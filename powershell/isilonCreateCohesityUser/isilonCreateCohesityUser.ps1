### process commandline arguments
[CmdletBinding()]
param (
    [Parameter(Mandatory = $True)][string]$isilon,   # the isilon to connect to (DNS name or IP)
    [Parameter(Mandatory = $True)][string]$username, # username 
    [Parameter()][string]$password = $null,  # optional, will be prompted if omitted
    [Parameter()][string]$cohesityUsername = 'cohesity',
    [Parameter()][string]$cohesityPassword = $null,
    [Parameter()][switch]$createSMBUser,
    [Parameter()][switch]$delete
)

function isilonAPI($method, $uri, $data=$null){
    $uri = $baseurl + $uri
    $result = $null
    try{
        if($data){
            $BODY = ConvertTo-Json $data -Depth 99
            if($PSVersionTable.PSEdition -eq 'Core'){
                $result = Invoke-RestMethod -Uri $uri -Method $method -Headers $headers -Body $BODY -SkipCertificateCheck
            }else{
                $result = Invoke-RestMethod -Uri $uri -Method $method -Headers $headers -Body $BODY
            }
        }else{
            if($PSVersionTable.PSEdition -eq 'Core'){
                $result = Invoke-RestMethod -Uri $uri -Method $method -Headers $headers -SkipCertificateCheck
            }else{
                $result = Invoke-RestMethod -Uri $uri -Method $method -Headers $headers
            }
        }
    }catch{
        if($_.ToString().contains('"errors" :')){
            Write-Host (ConvertFrom-Json $_.ToString()).errors[0].message -foregroundcolor Yellow
        }else{
            Write-Host $_.ToString() -foregroundcolor yellow
        }
    }
    return $result
}

# demand modern powershell version (must support TLSv1.2)
if($Host.Version.Major -le 5 -and $Host.Version.Minor -lt 1){
    Write-Warning "PowerShell version must be upgraded to 5.1 or higher to connect to Cohesity!"
    Pause
    exit
}

if($PSVersionTable.PSEdition -eq 'Desktop'){
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { return $true }
    $ignoreCerts = @"
public class SSLHandler
{
    public static System.Net.Security.RemoteCertificateValidationCallback GetSSLHandler()
    {
        return new System.Net.Security.RemoteCertificateValidationCallback((sender, certificate, chain, policyErrors) => { return true; });
    }
}
"@

    if(!("SSLHandler" -as [type])){
        Add-Type -TypeDefinition $ignoreCerts
    }
    [System.Net.ServicePointManager]::ServerCertificateValidationCallback = [SSLHandler]::GetSSLHandler()
}

$baseurl = 'https://' + $isilon +":8080"

# authentication
if(!$password){
    $secureString = Read-Host -Prompt "Enter your Isilon password" -AsSecureString
    $password = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR( $secureString ))
}
$EncodedAuthorization = [System.Text.Encoding]::UTF8.GetBytes($username + ':' + $password)
$EncodedPassword = [System.Convert]::ToBase64String($EncodedAuthorization)
$headers = @{"Authorization"="Basic $($EncodedPassword)"}

$latest = (isilonAPI get /platform/latest).latest

$users = isilonAPI get /platform/1/auth/users
$existingUser = $users.users | Where-Object name -eq $cohesityUsername
$roles = isilonAPI get /platform/1/auth/roles
$existingRole = $roles.roles | Where-Object name -eq $cohesityUsername
$zones = isilonAPI get /platform/1/zones-summary

if($delete){
    # delete existing role
    if($existingRole){
        Write-Host "Deleting role $cohesityUsername..."
        $deleteRole = isilonAPI delete "/platform/1/auth/roles/$cohesityUsername"
    }
    foreach($zoneName in $zones.summary.list){
        # remove zone user from BackupAdmins
        $roles = isilonAPI get /platform/$latest/auth/roles?zone=$zoneName
        $role = $roles.roles | Where-Object name -eq "BackupAdmin"
        if($role){
            $existingMember = $role.members | Where-Object name -eq $cohesityUsername
            if($existingMember){
                Write-Host "Removing $cohesityUsername from BackupAdmin role in zone: $zoneName..."
                $role.members = @($role.members | Where-Object name -ne $cohesityUsername)
                $role = isilonAPI put /platform/$latest/auth/roles/BackupAdmin?zone=$zoneName @{"members" = $role.members}
            }
        }
    }
    # delete existing user
    if($existingUser){
        Write-Host "Deleting user $cohesityUsername..."
        $deleteUser = isilonAPI delete "/platform/1/auth/users/$cohesityUsername"
    }else{
        Write-Host "User $cohesityUsername not found"
    }
    foreach($zoneName in $zones.summary.list){
        # delete zone user
        $users = isilonAPI get "/platform/1/auth/users?zone=$zoneName&provider=lsa-local-provider%3A$zoneName"
        $user = $users.users | Where-Object name -eq $cohesityUsername
        if($user){
            Write-Host "Deleting SMB user $cohesityUsername from zone: $zoneName..."
            $deleteUser = isilonAPI delete "/platform/1/auth/users/$($cohesityUsername)?zone=$zoneName&provider=lsa-local-provider%3A$zoneName"
        }
    }
    exit
}

if(!$existingUser){
    "`nCreating API user $cohesityUsername..."
    if(!$cohesityPassword -and !$delete){
        while($True){
            $secureString = Read-Host -Prompt "Enter new password for $cohesityUsername" -AsSecureString
            $cohesityPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR( $secureString ))
            $secureString = Read-Host -Prompt "  Confirm password for $cohesityUsername" -AsSecureString
            $cohesityPassword2 = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR( $secureString ))
            if($cohesityPassword -eq $cohesityPassword2){
                break
            }else{
                Write-Host "passwords do not match`n" -foregroundcolor Yellow
            }
        }
    }
    
    $userParams = @{
        "name" = $cohesityUsername;
        "enabled" = $True;
        "shell" = "/bin/zsh";
        "password_expires" = $false;
        "password" = $cohesityPassword
    }
    
    $newUser = isilonAPI post /platform/1/auth/users $userParams
}

if(!$existingRole){
    $roleParams = @{
        "name" = $cohesityUsername;
        "members" = @(
            @{
                "name" = $cohesityUsername;
                "type" = "user"
            }
        );
        "privileges" = @(
            @{
                "id" = "ISI_PRIV_LOGIN_PAPI";
                "name" = "Platform API";
                "read_only" = $True
            };
            @{
                "id" = "ISI_PRIV_AUTH";
                "name" = "Auth";
                "read_only" = $True
            };
            @{
                "id" = "ISI_PRIV_CLUSTER";
                "name" = "Cluster";
                "read_only" = $True
            };
            @{
                "id" = "ISI_PRIV_JOB_ENGINE";
                "name" = "Job Engine";
                "read_only" = $false
            };
            @{
                "id" = "ISI_PRIV_NETWORK";
                "name" = "Network";
                "read_only" = $True
            };
            @{
                "id" = "ISI_PRIV_SMB";
                "name" = "SMB";
                "read_only" = $True
            };
            @{
                "id" = "ISI_PRIV_SNAPSHOT";
                "name" = "Snapshot";
                "read_only" = $false
            };
            @{
                "id" = "ISI_PRIV_NFS";
                "name" = "NFS";
                "read_only" = $false
            }
        )
    }
    
    "Creating API role for $cohesityUsername..."
    $newRole = isilonAPI post /platform/1/auth/roles $roleParams    
}

if($createSMBUser){
    $zones = isilonAPI get /platform/1/zones-summary
    foreach($zoneName in $zones.summary.list){
        $users = isilonAPI get "/platform/1/auth/users?zone=$zoneName&provider=lsa-local-provider%3A$zoneName"
        $user = $users.users | Where-Object name -eq $cohesityUsername
        if(! $user){
            Write-Host "Creating SMB user $cohesityUsername for zone: $zoneName..."
            $smbUserParams = @{
                "name" = $cohesityUsername;
                "enabled" = $True;
                "shell" = "/bin/zsh";
                "password_expires" = $false;
                "password" = $cohesityPassword
            }
            $newSMBUser = isilonAPI post "/platform/1/auth/users?zone=$zoneName&provider=lsa-local-provider%3A$zoneName" $smbUserParams
        }
        $roles = isilonAPI get /platform/$latest/auth/roles?zone=$zoneName
        $role = $roles.roles | Where-Object name -eq "BackupAdmin"
        if(! $role){
            Write-Host "Creating BackupAdmin role for zone: $zoneName..."
            $smbRoleParams = @{
                "members" = @(
                    @{
                        "name" = $cohesityUsername;
                        "type" = "user"
                    }
                );
                "name" = "BackupAdmin";
                "privileges" = @(
                    @{
                        "id" = "ISI_PRIV_IFS_BACKUP";
                        "name" = "Backup";
                        "read_only" = $true
                    };
                    @{
                        "id" = "ISI_PRIV_IFS_RESTORE";
                        "name" = "Restore";
                        "read_only" = $true
                    }
                )
            }
            $smbRole = isilonAPI post /platform/$latest/auth/roles?zone=$zoneName $smbRoleParams
        }else{
            $existingMember = $role.members | Where-Object name -eq $cohesityUsername
            if(! $existingMember){
                "Adding $cohesityUsername to BackupAdmin role in zone: $zoneName..."
                $role.members = @($role.members + @{"name" = $cohesityUsername; "type" = "user"})
                $role = isilonAPI put /platform/$latest/auth/roles/BackupAdmin?zone=$zoneName @{"members" = $role.members}
            }
        }
    }
}

"`nUser/Role creation completed"
