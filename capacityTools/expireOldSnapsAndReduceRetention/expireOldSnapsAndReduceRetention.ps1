### usage: ./expireOldSnaps.ps1 -vip 192.168.1.198 -username admin [ -domain local ] [ -jobname myjob ]  -daysToKeep 60 [ -expire ]
### omitting the -expire parameter: the script will only display all the snaps older than -daysToKeep
### including the -expire parameter: the script will actually expire all the snaps older than -daysToKeep 

### process commandline arguments
[CmdletBinding()]
param (
    [Parameter(Mandatory = $True)][string]$vip,
    [Parameter(Mandatory = $True)][string]$username,
    [Parameter()][string]$domain = 'local',
    [Parameter()][string]$jobname = $null,
    [Parameter(Mandatory = $True)][string]$daysToKeep,
    [Parameter()][ValidateSet("kRegular","kFull","kLog","kSystem","kAll")][string]$backupType = 'kAll',
    [Parameter()][switch]$expire
)

### source the cohesity-api helper code
. ./cohesity-api

### authenticate
apiauth -vip $vip -username $username -domain $domain

### filter on jobname
$jobs = api get protectionJobs
if($jobname){
    $jobs = $jobs | Where-Object { $_.name -eq $jobname }
    if($jobs.count -eq 0){
        Write-Host "Job '$jobname' not found" -ForegroundColor Yellow
        exit
    }
}

### find protectionRuns that are older than daysToKeep
"Searching for old snapshots..."

foreach ($job in $jobs) {

    $jobId = $job.id

    foreach ($run in (api get protectionRuns?jobId=$($job.id)`&numRuns=999999`&excludeTasks=true`&excludeNonRestoreableRuns=true)) {
        if ($run.backupRun.snapshotsDeleted -eq $false -and ($run.backupRun.runType -eq $backupType -or $backupType -eq 'kAll')) {
            $startdate = usecstodate $run.copyRun[0].runStartTimeUsecs
            $startdateusecs = $run.copyRun[0].runStartTimeUsecs
            if ($startdateusecs -lt $(timeAgo $daysToKeep days) ) {
                ### if -expire switch is set, expire the local snapshot
                if ($expire) {
                    $exactRun = api get /backupjobruns?exactMatchStartTimeUsecs=$startdateusecs`&id=$jobId
                    $jobUid = $exactRun[0].backupJobRuns.protectionRuns[0].backupRun.base.jobUid
                    ### expire the snapshot
                    "Expiring $($job.name) Snapshot from $startdate"
                    $expireRun = @{'jobRuns' = @(
                            @{'expiryTimeUsecs'     = 0;
                                'jobUid'            = @{
                                    'clusterId' = $jobUid.clusterId;
                                    'clusterIncarnationId' = $jobUid.clusterIncarnationId;
                                    'id' = $jobUid.objectId;
                                }
                                'runStartTimeUsecs' = $startdateusecs;
                                'copyRunTargets'    = @(
                                    @{'daysToKeep' = 0;
                                        'type'     = 'kLocal';
                                    }
                                )
                            }
                        )
                    }
                    api put protectionRuns $expireRun
                }else{
                    ### just print old snapshots if we're not expiring
                    "Woud expire $($job.name) ($($run.backupRun.runType.subString(1))) $($startdate)"
                }
            }else{
                $newExpiryUsecs = [int64](dateToUsecs $startdate.addDays($daysToKeep))
                if($run.copyRun[0].expiryTimeUsecs -gt ($newExpiryUsecs + 86400000000)){
                    $reduceByDays = [int64][math]::floor(($run.copyRun[0].expiryTimeUsecs - $newExpiryUsecs) / 86400000000)
                    ### if -expire is set, reduce the retention
                    if ($expire) {
                        $exactRun = api get /backupjobruns?exactMatchStartTimeUsecs=$startdateusecs`&id=$jobId
                        $jobUid = $exactRun[0].backupJobRuns.protectionRuns[0].backupRun.base.jobUid
                        ### edit the snapshot
                        "Reducing retention for $($job.name) Snapshot from $startdate"
                        $editRun = @{'jobRuns' = @(
                                @{
                                    'jobUid'            = @{
                                        'clusterId' = $jobUid.clusterId;
                                        'clusterIncarnationId' = $jobUid.clusterIncarnationId;
                                        'id' = $jobUid.objectId;
                                    }
                                    'runStartTimeUsecs' = $startdateusecs;
                                    'copyRunTargets'    = @(
                                        @{'daysToKeep' = -$reduceByDays;
                                            'type'     = 'kLocal';
                                        }
                                    )
                                }
                            )
                        }
                        $null = api put protectionRuns $editRun
                    }else{
                        ### just print snapshots we would expire
                        "Would reduce $($job.name) $($startdate) by $reduceByDays days"
                    }    
                }
            }
        }
    }
}                                                                                           
