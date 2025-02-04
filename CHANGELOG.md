# Change Log for bseltz-cohesity/scripts

## 2023-11-07

* [pyhesity.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/pyhesity) [`Update`] updated password storage after validation
* [cohesity-api.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cohesity-api) [`Update`] updated password storage after validation

## 2023-11-06

* [cloneBackupToView.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cloneBackupToView) [`Fix`] Don't clone empty log backups (e.g. passive AAG node)

## 2023-11-05

* [Grafana](https://github.com/bseltz-cohesity/scripts/tree/master/reports/grafana) [`Update`] added examples for various data source types: PostgreSQL, Prometheus, InfluxDB, JSON API

## 2023-11-03

* [oracleBackupReport.py](https://github.com/bseltz-cohesity/scripts/tree/master/oracle/python/oracleBackupReport) [`Update`] added columns for database type and DataGuard role
* [sqlJobSelections.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/sql/sqlJobSelections) [`New`] generate report of SQL protection group selections

## 2023-11-02

* [replicationReport.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/replicationReport) [`Update`] included queued / running replications

## 2023-11-01

* [unprotectVM](https://github.com/bseltz-cohesity/scripts/tree/master/linux/unprotectVM) [`New`] compiled binary for linux, unprotect a VM
* [unprotectPhysicalServer](https://github.com/bseltz-cohesity/scripts/tree/master/linux/unprotectPhysicalServer) [`New`] compiled binary for linux, unprotect a physical server
* [unprotectSQLServer](https://github.com/bseltz-cohesity/scripts/tree/master/linux/unprotectSQLServer) [`New`] compiled binary for linux, unprotect a SQL server
* [unregisterSource](https://github.com/bseltz-cohesity/scripts/tree/master/linux/unregisterSource) [`New`] compiled binary for linux, unregister a protection source

## 2023-10-31

* [myBackupStatus.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/myBackupStatus) [`Fix`] fixed PowerShell 5.1 detection issue

## 2023-10-30

* [aagFailoverMinder.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/sql/aagFailoverMinder) [`Update`] added support for helios / multiple clusters

## 2023-10-28

* [protectOracle.py](https://github.com/bseltz-cohesity/scripts/tree/master/oracle/python/protectOracle) [`Update`] added support to specify more than one database (previously was one database or all databases)

## 2023-10-27

* [protectO365Mailboxes.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/protectO365Mailboxes) [`Fix`] Force exclude ID list uniqueness

## 2023-10-26

* [cohesity-api.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cohesity-api) [`Fix`] updated auth validation to use basicClusterInfo, fixed copySessionCookie function

## 2023-10-24

* [addObjectToUserAccessList.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/addObjectToUserAccessList) [`Update`] added -environment parameter to filter on object type

## 2023-10-23

* [instantVolumeMount.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/instantVolumeMount) [`Update`] v2 rewrite, modernize authentication, support replicated backups

## 2023-10-22

* [instantVolumeMount.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/instantVolumeMount) [`Update`] v2 rewrite, modernize authentication, support replicated backups

## 2023-10-18

* [replicationQueue.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/replicationQueue) [`Update`] added --youngerthan and --olderthan parameters
* [restartFailedJobs.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/restartFailedJobs) [`Update`] added --jobname and --joblist parameters
* [pauseProtectionActivity.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/pauseProtectionActivity) [`New`] pause or resume protection activities (backup, replication, archive) for maximum restore performance

## 2023-10-17

* [reLicenseCluster.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/reLicenseCluster) [`New`] refresh license for dark site cluster
* [migrateEC2CSMProtectionGroup.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/migrateEC2CSMProtectionGroup) [`New`] Migrate EC2 Snapshot Manager protection group from one cluster to another

## 2023-10-16

* [jobDumper.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/jobDumper) [`New`] Dump protection groups and sources to JSON (to aid in development and analysis)
* [jobDumper.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/jobDumper) [`New`] Dump protection groups and sources to JSON (to aid in development and analysis)

## 2023-10-13

* [pyhesity.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/pyhesity) [`Fix`] fixed password prompt for AD user
* [cohesity-api.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cohesity-api) [`Fix`] fixed password prompt for AD user
* [deleteObjectBackups.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/deleteObjectBackups) [`Update`] moderinized authentication
* [moveProtectionGroup.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/moveProtectionGroup) [`Update`] added rename old protection group option

## 2023-10-12

* [recoverVMsV2.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/recoverVMsV2) [`New`] restore multiple VMware VMs using python
* [recoverVMsV2.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/recoverVMsV2) [`Update`] added -taskName parameter
* [myBackupStatus.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/myBackupStatus) [`New`] get my current backup status
* [storagePerObjectReport.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/storagePerObjectReport) [`Update`] added description field and 2nd output format (custom requested format)
* [chargebackReportV2.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/chargebackReportV2) [`Update`] added description field
* [viewStorageReport.py](https://github.com/bseltz-cohesity/scripts/tree/master/reports/python/viewStorageReport) [`New`] view storage report

## 2023-10-11

* [cohesity-api.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cohesity-api) [`Update`] removed demand minimim powershell version, to support Start-Job
* [expungeDataSpillage.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/expungeDataSpillage) [`Update`] no longer connects to replica clusters, run script independently on separate clusters
* [archiveVersionReport.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/archiveVersionReport) [`New`] reports on the cloud archive version (v1 or v2) in use per protection group
* [pureSnapDiff.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/pureSnapDiff) [`Update`] auto-detect Pure API version

## 2023-10-10

* [deployWindowsAgentSimple.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/deployWindowsAgentSimple) [`New`] remotely install Cohesity windows agent and set the service account
* [archiveNow-latest.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/archiveNow-latest) [`Update`] modernized authentication
* [storagePerObjectReport.py](https://github.com/bseltz-cohesity/scripts/tree/master/reports/python/storagePerObjectReport) [`Update`] use cached data
* [storagePerObjectReport.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/storagePerObjectReport) [`Update`] use cached data

## 2023-10-09

* [pyhesity.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/pyhesity) [`Update`] set last error on cluster not connected to helios
* [cohesity-api.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cohesity-api) [`Update`] clarify password / API key prompts
* [pauseResumeJobs.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/pauseResumeJobs) [`Update`] modernized authentication
* [cancelRunningJobs.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/cancelRunningJobs) [`Update`] modernized authentication
* [archiveQueue.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/archiveQueue) [`Update`] modernized authentication

## 2023-10-06

* [activeSnapshots.py](https://github.com/bseltz-cohesity/scripts/tree/master/reports/python/activeSnapshots) [`Update`] added email support
* [activeSnapshots.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/activeSnapshots) [`Update`] added email support

## 2023-10-05

* [protectO365Mailboxes.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/protectO365Mailboxes) [`Update`] added include domain filter
* [unprotectedO365Objects.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/unprotectedO365Objects) [`Update`] added output to CSV
* [featureFlags.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/featureFlags) [`Update`] allow import from CSV without timestamp column

## 2023-10-04

* [restoreFiles.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/restoreFiles) [`Update`] added support for wildcard restores e.g. /folder1/*

## 2023-10-03

* [pyhesity.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/pyhesity) [`Fix`] fixed 'forcePasswordChange' error on AD authentication

## 2023-10-02

* [cohesity-api.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cohesity-api) [`Fix`] cosmetic bug 'An item with the same key has already been added. Key: content-type'
* [registerPhysical.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/registerPhysical) [`Update`] added support for multitenancy
* [chargebackReport.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/chargebackReport) [`Fix`] added lower bound startTimeUsecs to query parameters

## 2023-09-29

* [featureFlags.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/featureFlags) [`New`] Python script to get, set, export and import feature flags
* [featureFlags.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/featureFlags) [`New`] PowerShell script to get, set, export and import feature flags

## 2023-09-28

* [activeSnapshotsRemote.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/activeSnapshotsRemote) [`New`] Script to determine count, oldest, and newest backups available on replica cluster (that can't be queried directly, e.g. isolated vault cluster)
* [archiveQueue.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/archiveQueue) [`Update`] don't show expired archives when using -showFinished

## 2023-09-26

* [reports](https://github.com/bseltz-cohesity/scripts/tree/master/reports) [`Update`] Renamed heliosV2 folder to helios and renamed heliosV1 folder to helios-old

## 2023-09-24

* [pyhesity.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/pyhesity) [`Update`] minor refactoring
* [cohesity-api.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cohesity-api) [`Update`] minor refactoring

## 2023-09-23

* [cohesity-api.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cohesity-api) [`Update`] switched to web session authentication, added support for password reset. email MFA
* [gflags.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/gflags) [`Update`] switched to web session authentication
* [pyhesity.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/pyhesity) [`Update`] switched to web session authentication, added support for password reset, email MFA
* [gflagList.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/gflagList) [`Update`] switched to web session authentication
* [gflags.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/gflags) [`Update`] switched to web session authentication

## 2023-09-22

* [replicationQueue.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/replicationQueue) [`Update`] added option to cancel outdated/all replications per job, per target
* [licenseCluster.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/licenseCluster) [`New`] generates a license from Helios and applies it to a cluster
* [cohesity-api.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cohesity-api) [`Update`] added file upload function to support the new licenseCluster script

## 2023-09-21

* [strikeReportV2.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/strikeReportV2) [`Fix`] bug fix

## 2023-09-19

* [replicationReport.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/replicationReport) [`Update`] Performance improvement
* [storagePerObjectReport.py](https://github.com/bseltz-cohesity/scripts/tree/master/reports/python/storagePerObjectReport) [`Update`] added tenant column
* [storagePerObjectReport.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/storagePerObjectReport) [`Update`] added tenant column
* [findFilesV2.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/findFilesV2) [`New`] New script to search for indexed files

## 2023-09-18

* [oracleLogDeletionDaysReport.py](https://github.com/bseltz-cohesity/scripts/tree/master/oracle/python/oracleLogDeletionDaysReport) [`Fix`] abend on missing database ID

## 2023-09-16

* [unregisterProtectionSource.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/unregisterProtectionSource) [`Update`] modernized authentication (added MFA, multi-tenancy, etc)
* [protectVM.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/protectVM) [`Update`] modernized authentication (added MFA, multi-tenancy, etc)
* [unprotectVM.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/unprotectVM) [`Update`] modernized authentication (added MFA, multi-tenancy, etc)
* [migratePhysicalProtectionGroup.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/migratePhysicalProtectionGroup) [`Update`] added support for multi-tenancy
* [migrateSQLProtectionGroup.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/migrateSQLProtectionGroup) [`Update`] added support for multi-tenancy
* [migrateVMProtectionGroup.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/migrateVMProtectionGroup) [`Update`] added support for multi-tenancy

## 2023-09-15

* [oracleLogDeletionDaysReport.py](https://github.com/bseltz-cohesity/scripts/tree/master/oracle/python/oracleLogDeletionDaysReport) [`New`] report oracle archive log deletion settings
* [dataReadPerVMReport.py](https://github.com/bseltz-cohesity/scripts/tree/master/reports/python/dataReadPerVMReport) [`Update`] Improved dataRead adjustment logic

## 2023-09-14

* [strikeReportV2.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/strikeReportV2) [`Update`] added sourceName column

## 2023-09-13

* [backupNow.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/backupNow) [`Update`] Improved error handling on start
* [backupNow.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/backupNow) [`Update`] Improved error handling on start

## 2023-09-12

* [aagFailoverMinder.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/sql/aagFailoverMinder) [`Fix`] wait for application refresh

## 2023-09-11

* [heliosCSVReport.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/heliosV2/powershell/heliosCSVReport) [`New`] script to generate Helios reports in raw CSV format (much faster than heliosReport.ps1)
* [resetMyExpiredPassword.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/resetMyExpiredPassword) [`New`] script to reset my expired password

## 2023-09-08

* [protectGPFS.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/protectGPFS) [`New`] python script to protect GPFS Filesets (agent-based approach)

## 2023-09-07

* [pauseResumeJobs.py.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/pauseResumeJobs.py) [`Update`] added show mode
* [protectOracle.py](https://github.com/bseltz-cohesity/scripts/tree/master/oracle/python/protectOracle) [`Update`] added --noalert option
* [refreshSource.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/refreshSource) [`Fix`] wait for app/DB refresh
* [aix](https://github.com/bseltz-cohesity/scripts/tree/master/aix) [`Update`] Added MFA support to compiled binaries for AIX
* [linux](https://github.com/bseltz-cohesity/scripts/tree/master/linux) [`Update`] Added MFA support to compiled binaries for Linux
* [backupNow.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/backupNow) [`Update`] Added MFA support
* [backedUpFileList.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/backedUpFileList) [`Update`] Added MFA support
* [restoreFiles.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/restoreFiles) [`Update`] Added MFA support

## 2023-09-06

* [pyhesity.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/pyhesity) [`Update`] added timeout parameter to apiauth and api functions (required for latest version of backupNow.py)
* [cancelArchivesV2.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cancelArchivesV2) [`Update`] added support to filter on target name
* [protectOracle.py](https://github.com/bseltz-cohesity/scripts/tree/master/oracle/python/protectOracle) [`Fix`] fixed edge case bug that caused unhandled exception
* [backupNow.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/backupNow) [`Update`] performance improvements
* [backupNow.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/backupNow) [`Update`] performance improvements

## 2023-09-04

* [gflags.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/gflags) [`Fix`] Fixed service restart function

## 2023-09-03

* [backupNow.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/backupNow) [`Update`] performance improvements
* [backupNow.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/backupNow) [`Update`] performance improvements

## 2023-08-31

* [recoverHyperVVMs.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/recoverHyperVVMs) [`Update`] added support for restore to stand alone failover clusters and stand alone hosts

## 2023-08-30

* [unprotectDmaasM365Mailboxes.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/dmaas/powershell/unprotectDmaasM365Mailboxes) [`Update`] added support for mailbox selection by UUID
* [storagePerVMReport.py](https://github.com/bseltz-cohesity/scripts/tree/master/reports/python/storagePerVMReport) [`New`] new script to report storage consumed per VMware VM
* [instantVolumeMount.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/instantVolumeMount) [`Update`] added support for v2 runid format
* [updateJobSettings.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/updateJobSettings) [`New`] New script to update common protection group settings

## 2023-08-28

* [protectOracle.py](https://github.com/bseltz-cohesity/scripts/tree/master/oracle/python/protectOracle) [`Update`] added additional parameters
* [cohesity-api.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cohesity-api) [`Update`] added offending line number to cohesity-api-debug.log

## 2023-08-27

* [archiveQueue.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/archiveQueue) [`Update`] added exit 0 when no active archive tasks found, exit 1 if tasks are found
* [aagFailoverMinder.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/sql/aagFailoverMinder) [`Fix`] updated run payload to remove kLocal copyRun
* [updateAWSCredentials.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/updateAWSCredentials) [`New`] new python script to update access key / secret key for AWS source.

## 2023-08-22

* [expireOldArchives.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/expireOldArchives) [`Update`] added modern authentication support
* [registerOracle.py](https://github.com/bseltz-cohesity/scripts/tree/master/oracle/python/registerOracle) [`Fix`] fixed error that occured when no Oracle sources were present on the cluster

## 2023-08-19

* [addObjectToUserAccessList.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/addObjectToUserAccessList) [`Update`] added support for AD groups

## 2023-08-17

* [updateGCPExternalTargetPrivateKey.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/updateGCPExternalTargetPrivateKey) [`New`] PowerShell script to update the private key on a Google Cloud archive target
* [expireOldSnaps.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/expireOldSnaps) [`Update`] added modern authentication methods (API keys, MFA, Helios, etc)
* [storagePerObjectReport.py](https://github.com/bseltz-cohesity/scripts/tree/master/reports/python/storagePerObjectReport) [`Update`] added estimated archival usage per object
* [storagePerObjectReport.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/storagePerObjectReport) [`Update`] added estimated archival usage per object
* [activeSnapshots.py](https://github.com/bseltz-cohesity/scripts/tree/master/reports/python/activeSnapshots) [`Update`] added support for multitenancy
* [updateJobDescriptions.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/updateJobDescriptions) [`New`] PowerShell script to update protection group descriptions from a CSV file

## 2023-08-16

* [restoreReport.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/restoreReport) [`Update`] added recoery point to output
* [restoreSQL.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/sql/restoreSQL) [`Fix`] Fixed cosmetic error "Cannot index into a null array" when checking previous restores during resume recovery

## 2023-08-15

* [cohesity-api.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cohesity-api) [`Fix`] Enforce TLSv1.2 to solve TLSv1.3 handshake failures with PowerShell.Core on Windows Server 2022

## 2023-08-14

* [strikeReportV2.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/strikeReportV2) [`Fix`] parsing misbehavior on Windows PowerShell 5.1
* [backupNow.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/backupNow) [`Fix`] updated script to exit with failure on "TARGET_NOT_IN_POLICY_NOT_ALLOWED"
* [backupNow.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/backupNow) [`Fix`] updated script to exit with failure on "TARGET_NOT_IN_POLICY_NOT_ALLOWED"

## 2023-08-12

* [updateArchiveRetention.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/updateArchiveRetention) [`Fix`] fixed filter by policy names
* [usersAndGroups.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/usersAndGroups) [`New`] report list of users and groups

## 2023-08-11

* [backedUpFileList](https://github.com/bseltz-cohesity/scripts/tree/master/linux/backedUpFileList) [`New`] compiled binary version of backedUpFileList for Linux
* [restoreFiles](https://github.com/bseltz-cohesity/scripts/tree/master/linux/restoreFiles) [`New`] compiled binary version of restoreFiles for Linux
* [gflagList.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/gflagList) [`New`] get complete list of gflags for a service
* [unprotectDmaasM365Mailboxes.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/dmaas/powershell/unprotectDmaasM365Mailboxes) [`New`] unprotect M365 mailboxes in CCS

## 2023-08-10

* [clusterProtectedObjects.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/clusterProtectedObjects) [`New`] cluster-direct API script to generate protected objects report
* [clusterProtectionRuns.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/clusterProtectionRuns) [`Fix`] performance improvement

## 2023-08-09

* [expireOldSnapshots.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/expireOldSnapshots) [`Update`] added -s, --skipmonthlies parameter
* [storagePerObjectReport.py](https://github.com/bseltz-cohesity/scripts/tree/master/reports/python/storagePerObjectReport) [`Update`] updated storage calculations

## 2023-08-02

* [protectedFilePathReport.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/reports/powershell/protectedFilePathReport) [`Update`] added output column for skipNestedVolumes

## 2023-08-01

* [protectO365OneDrive.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/protectO365OneDrive) [`Update`] added support for UUIDs as input list of users to protect
* [storagePerObjectReport.py](https://github.com/bseltz-cohesity/scripts/tree/master/reports/python/storagePerObjectReport) [`Update`] added recent growth column to the output

## 2023-07-31

* [protectVM.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/protectVM) [`Fix`] fixed disk exclusions
* [protectMongoDB.py](https://github.com/bseltz-cohesity/scripts/tree/master/python/protectMongoDB) [`Update`] exit with 0 on no databases to protect

## 2023-07-30

* [protectWindows.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/protectWindows) [`Fix`] remove null entry from exclude paths
* [globalExcludePaths.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/globalExcludePaths) [`Fix`] remove null entry from exclude paths

## 2023-07-29

* [epic_pure_freeze_thaw](https://github.com/bseltz-cohesity/scripts/tree/master/bash/epic_pure_freeze_thaw) [`Update`] parameterized configuration variables and added autodetection of OS (Linux or AIX)

## 2023-07-27

* [addGlobalExcludePaths.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/addGlobalExcludePaths) [`Fix`] remove null entry from exclude paths
* [cancelDmaasProtectionRuns.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/dmaas/powershell/cancelDmaasProtectionRuns) [`Update`] added -subType filter (e.g. kO365Sharepoint)
* [protectDmaasM365Groups.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/dmaas/powershell/protectDmaasM365Groups) [`Update`] updated to support autoselect of groups with non-unique names
* [protectDmaasM365Teams.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/dmaas/powershell/protectDmaasM365Teams) [`Update`] updated to support autoselect of teams with non-unique names
* [protectDmaasM365Sites.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/dmaas/powershell/protectDmaasM365Sites) [`Update`] updated to support autoselect of sites with non-unique names
* [protectLinux.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/protectLinux) [`Fix`] remove null entry from exclude paths
* [cloneVM.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cloneVM) [`Fix`] cluster/host not found error due to unexpected sorting in object hierarchy
* [viewDR.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/viewDR) [`Update`] replicateViews.ps1 and added replication completion check to cleanupJobs.ps1

## 2023-07-26

* [restoreSQL.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/sql/restoreSQL) [`Fix`] Updated search time range for the latest log backup that might be arbitrarily old (previously only looked 3 days back).
* [restoreSQLDBs.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/sql/restoreSQLDBs) [`Fix`] Updated search time range for the latest log backup that might be arbitrarily old (previously only looked 3 days back).
* [cloneVM.ps1](https://github.com/bseltz-cohesity/scripts/tree/master/powershell/cloneVM) [`Fix`] Updated resource pool search to provide clearer error message when compute resource not found.

## 2023-07-20

* [backedUpFileList](https://github.com/bseltz-cohesity/scripts/tree/master/aix/backedUpFileList) [`New`] backedUpFileList for AIX

## 2023-07-19

* [restoreFiles](https://github.com/bseltz-cohesity/scripts/tree/master/aix/restoreFiles) [`New`] restoreFiles for AIX
* [backupNow](https://github.com/bseltz-cohesity/scripts/tree/master/aix/backupNow) [`Fix`] backupNow for AIX fix for 6.8.1 P11 / 6.6.0 P34 error: "TARGET_NOT_IN_POLICY_NOT_ALLOWED%!(EXTRA int64=0)"
