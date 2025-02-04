# Update Protection Job Properties using PowerShell

Warning: this code is provided on a best effort basis and is not in any way officially supported or sanctioned by Cohesity. The code is intentionally kept simple to retain value as example code. The code in this repository is provided as-is and the author accepts no liability for damages resulting from its use.

This script modifies various protection job properties including policy, startTime, timeZone, incremental and full SLAs.

## Download the script

Run these commands from PowerShell to download the script(s) into your current directory

```powershell
# Download Commands
$scriptName = 'updateJob'
$repoURL = 'https://raw.githubusercontent.com/bseltz-cohesity/scripts/master/powershell'
(Invoke-WebRequest -UseBasicParsing -Uri "$repoUrl/$scriptName/$scriptName.ps1").content | Out-File "$scriptName.ps1"; (Get-Content "$scriptName.ps1") | Set-Content "$scriptName.ps1"
(Invoke-WebRequest -UseBasicParsing -Uri "$repoUrl/cohesity-api/cohesity-api.ps1").content | Out-File cohesity-api.ps1; (Get-Content cohesity-api.ps1) | Set-Content cohesity-api.ps1
# End Download Commands
```

## Components

* updateJob.ps1: the main powershell script
* cohesity-api.ps1: the Cohesity REST API helper module

Place both files in a folder together, then we can run the script.

To change the policy the job uses:

```powershell
./updateJob.ps1 -vip mycluster `
                -username myusername `
                -domain mydomain.net `
                -jobName 'my job 1', 'my job 2' `
                -policyName 'my new policy'
```

You can also provide a text file of jobs to change (one job name per line):

```powershell
./updateJob.ps1 -vip mycluster `
                -username myusername `
                -domain mydomain.net `
                -jobList ./myjobs.txt `
                -policyName 'my new policy'
```

Changing the start time:

```powershell
./updateJob.ps1 -vip mycluster `
                -username myusername `
                -domain mydomain.net `
                -jobList ./myjobs.txt `
                -startTime '23:30'
```

Changing several properties at once:

```powershell
./updateJob.ps1 -vip mycluster `
                -username myusername `
                -domain mydomain.net `
                -jobList ./myjobs.txt `
                -startTime '23:30' `
                -policyName 'my new policy' `
                -incrementalProtectionSlaTimeMins 120

```

## Authentication Parameters

* -vip: (optional) name or IP of Cohesity cluster (defaults to helios.cohesity.com)
* -username: (optional) name of user to connect to Cohesity (defaults to helios)
* -domain: (optional) your AD domain (defaults to local)
* -useApiKey: (optional) use API key for authentication
* -password: (optional) will use cached password or will be prompted
* -mcm: (optional) connect through MCM
* -mfaCode: (optional) TOTP MFA code
* -emailMfaCode: (optional) send MFA code via email
* -clusterName: (optional) cluster to connect to when connecting through Helios or MCM

## Job Parameters

* -jobName: (optional) one or more job names to modify (comma separated)
* -jobList: (optional) text file of job names to modify (one per line)
* -policyName: (optional) name of new policy to assign to job
* -startTime: (optional) e.g. '18:30'
* -timeZone: (optional) e.g. 'America/New_York'
* -incrementalProtectionSlaTimeMins: (optional) number of minutes before marking incremental SLA as missed
* -fullProtectionSlaTimeMins: (optional) number of minutes before marking full SLA as missed
