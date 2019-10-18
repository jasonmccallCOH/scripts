### usage: ./createSMBView.ps1 -vip mycluster -username myusername -domain mydomain.net -viewName newview1 -readWrite mydomain.net\server1 -fullControl mydomain.net\admingroup1 -qosPolicy 'TestAndDev High' -storageDomain mystoragedomain

### process commandline arguments
[CmdletBinding()]
param (
    [Parameter(Mandatory = $True)][string]$vip,       # the cluster to connect to (DNS name or IP)
    [Parameter(Mandatory = $True)][string]$username,  # username (local or AD)
    [Parameter()][string]$domain = 'local',           # local or AD domain
    [Parameter(Mandatory = $True)][string]$viewName,  # name of view to create
    [Parameter()][string]$storageDomain = 'DefaultStorageDomain',  # name of storage domain in which to create view
    [Parameter()][array]$fullControl,                 # list of users to grant full control
    [Parameter()][array]$readWrite,                   # list of users to grant read/write
    [Parameter()][ValidateSet(“Backup Target Low”,”Backup Target High”,”TestAndDev High”,"TestAndDev Low")][string]$qosPolicy = 'Backup Target Low'
)

### source the cohesity-api helper code
. $(Join-Path -Path $PSScriptRoot -ChildPath cohesity-api.ps1)

### authenticate
apiauth -vip $vip -username $username -domain $domain

### find storage domain
$sd = api get viewBoxes | Where-Object name -eq $storageDomain
if($sd){
    $sdId = $sd[0].id
}else{
    Write-Warning "Storage domain $storageDomain not found"
    exit 1
}

### define new view
$newView = @{
    "enableSmbAccessBasedEnumeration" = $true;
    "enableSmbViewDiscovery" = $true;
    "fileDataLock" = @{
      "lockingProtocol" = "kSetReadOnly"
    };
    "fileExtensionFilter" = @{
      "isEnabled" = $false;
      "mode" = "kBlacklist";
      "fileExtensionsList" = @()
    };
    "securityMode" = "kNativeMode";
    "smbPermissionsInfo" = @{
      "ownerSid" = "S-1-5-32-544";
      "permissions" = @()
    };
    "protocolAccess" = "kSMBOnly";
    "subnetWhitelist" = @();
    "qos" = @{
      "principalName" = $qosPolicy
    };
    "viewBoxId" = $sdId;
    "caseInsensitiveNamesEnabled" = $true;
    "storagePolicyOverride" = @{
      "disableInlineDedupAndCompression" = $false
    };
    "name" = $viewName
}

### add permissions
function addPermission($user, $perms){
    $domain, $domainuser = $user.split('\')
    $principal = api get "activeDirectory/principals?domain=$domain&includeComputers=true&search=$domainuser" | Where-Object fullName -eq $domainuser
    if($principal){
        $sid = $principal.sid
        $permission = @{
            "sid" = $principal.sid;
            "type" = "kAllow";
            "mode" = "kFolderSubFoldersAndFiles";
            "access" = $perms
        }
        $newView.smbPermissionsInfo.permissions += $permission
    }else{
        Write-Warning "User $user not found"
        exit 1
    }    
}

foreach($user in $readWrite){
    addPermission $user 'kReadWrite'
}

foreach($user in $fullControl){
    addPermission $user 'kFullControl'
}

### create the view
"Creating view $viewName..."
$null = api post views $newView
