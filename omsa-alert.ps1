<# This sends e-mails via smtp to a chosen address if an alert is triggered on a Dell Server system by OpenManage
# Pre-Requisites: Dell OpenManage installed, a mail server allowing smtp without authentication, omconfig on the system path 
# or can be called by full path. Note: Dell omconfig alert action must be populated once per server with the list of commands
# at the end of this script
# Tested on 2008R2 and 2012R2
#>

param(
[string]$body
)

# This can be amended as required and authentication for some mailservers may require some extra code for saved credentials
send-mailmessage -to "youraddress@yourdomain" -from "server1 <server1@yourdomain>" -subject "Compdc1 OMSA Alert!" -Body $body -SmtpServer yourmailserver

# Log any mail errors
$error[0].Exception | Format-List * -Force | Out-File C:\scripts\mailerror.txt -Append
$error[0].Exception.InnerException | Format-List * -Force | Out-File C:\scripts\mailerror.txt -Append

<# Pre-requisite: populate alertaction on each server once by running the below list of commands.
# Full path to powershell may be required and c:\scripts can be changed if required.

$events = @("powersupply","powersupplywarn","tempwarn","tempfail","fanwarn","fanfail","voltwarn","voltfail","intrusion","redundegrad","redunlost","memprefail","memfail","hardwarelogwarn","hardwarelogfull","processorwarn","processorfail","watchdogasr","batterywarn","batteryfail","systempowerwarn","systempowerfail","storagesyswarn","storagesysfail","storagectrlwarn","storagectrlfail","pdiskwarn","pdiskfail","vdiskwarn","vdiskfail","enclosurewarn","enclosurefail","storagectrlbatterywarn","storagectrlbatteryfail")

foreach ($event in $events) {
   
   omconfig system alertaction event=$event execappath="powershell c:\scripts\omsa-alert.ps1 $event"

 }


#>