<# Pre-requisite: populate alertaction by running the below list of commands on each server once initially.
# Full path to powershell may be required and c:\scripts can be changed if required.
#>

$events = @("powersupply","powersupplywarn","tempwarn","tempfail","fanwarn","fanfail","voltwarn","voltfail","intrusion","redundegrad","redunlost","memprefail","memfail","hardwarelogwarn","hardwarelogfull","processorwarn","processorfail","watchdogasr","batterywarn","batteryfail","systempowerwarn","systempowerfail","storagesyswarn","storagesysfail","storagectrlwarn","storagectrlfail","pdiskwarn","pdiskfail","vdiskwarn","vdiskfail","enclosurewarn","enclosurefail","storagectrlbatterywarn","storagectrlbatteryfail")

foreach ($event in $events) {
   
   omconfig system alertaction event=$event execappath="powershell c:\scripts\omsa-alert.ps1 $event"

 }
