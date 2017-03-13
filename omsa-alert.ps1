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

<# Pre-requisite: setup alert action on each server by running the bellow commands
omconfig system alertaction event=powersupply execappath="powershell c:\scripts\omsa-alert.ps1 power_supply_failure"
omconfig system alertaction event=powersupplywarn execappath="powershell c:\scripts\omsa-alert.ps1 power_supply_warning"
omconfig system alertaction event=tempwarn execappath="powershell c:\scripts\omsa-alert.ps1 temperature_warning"
omconfig system alertaction event=tempfail execappath="powershell c:\scripts\omsa-alert.ps1 temperature_failure"
omconfig system alertaction event=fanwarn execappath="powershell c:\scripts\omsa-alert.ps1 fan_speed_warning"
omconfig system alertaction event=fanfail execappath="powershell c:\scripts\omsa-alert.ps1 fan_speed_failure"
omconfig system alertaction event=voltwarn execappath="powershell c:\scripts\omsa-alert.ps1 voltage_warning"
omconfig system alertaction event=voltfail execappath="powershell c:\scripts\omsa-alert.ps1 voltage_failure"
omconfig system alertaction event=intrusion execappath="powershell c:\scripts\omsa-alert.ps1 chassis_intrusion"
omconfig system alertaction event=redundegrad execappath="powershell c:\scripts\omsa-alert.ps1 redundancy_degraded"
omconfig system alertaction event=redunlost execappath="powershell c:\scripts\omsa-alert.ps1 redundancy_lost"
omconfig system alertaction event=memprefail execappath="powershell c:\scripts\omsa-alert.ps1 memory_pre-failure"
omconfig system alertaction event=memfail execappath="powershell c:\scripts\omsa-alert.ps1 memory_failure"
omconfig system alertaction event=hardwarelogwarn execappath="powershell c:\scripts\omsa-alert.ps1 hardware_log_warning"
omconfig system alertaction event=hardwarelogfull execappath="powershell c:\scripts\omsa-alert.ps1 hardware_log_full"
omconfig system alertaction event=processorwarn execappath="powershell c:\scripts\omsa-alert.ps1 processor_ warning"
omconfig system alertaction event=processorfail execappath="powershell c:\scripts\omsa-alert.ps1 processor_failure"
omconfig system alertaction event=watchdogasr execappath="powershell c:\scripts\omsa-alert.ps1 watchdog_asr"
omconfig system alertaction event=batterywarn execappath="powershell c:\scripts\omsa-alert.ps1 battery_warning"
omconfig system alertaction event=batteryfail execappath="powershell c:\scripts\omsa-alert.ps1 battery_failure"
omconfig system alertaction event=systempowerwarn execappath="powershell c:\scripts\omsa-alert.ps1 system_power_warning"
omconfig system alertaction event=systempowerfail execappath="powershell c:\scripts\omsa-alert.ps1 system_power_failure"
omconfig system alertaction event=storagesyswarn execappath="powershell c:\scripts\omsa-alert.ps1 storage_system_warning"
omconfig system alertaction event=storagesysfail execappath="powershell c:\scripts\omsa-alert.ps1 storage_system_failure"
omconfig system alertaction event=storagectrlwarn execappath="powershell c:\scripts\omsa-alert.ps1 storage_controller_warning"
omconfig system alertaction event=storagectrlfail execappath="powershell c:\scripts\omsa-alert.ps1 storage_controller_failure"
omconfig system alertaction event=pdiskwarn execappath="powershell c:\scripts\omsa-alert.ps1 physical_disk_warning"
omconfig system alertaction event=pdiskfail execappath="powershell c:\scripts\omsa-alert.ps1 physical_disk_failure"
omconfig system alertaction event=vdiskwarn execappath="powershell c:\scripts\omsa-alert.ps1 virtual_disk_warning"
omconfig system alertaction event=vdiskfail execappath="powershell c:\scripts\omsa-alert.ps1 virtual_disk_failure"
omconfig system alertaction event=enclosurewarn execappath="powershell c:\scripts\omsa-alert.ps1 enclosure_warning"
omconfig system alertaction event=enclosurefail execappath="powershell c:\scripts\omsa-alert.ps1 enclosure_failure"
omconfig system alertaction event=storagectrlbatterywarn execappath="powershell c:\scripts\omsa-alert.ps1 storage_controller_battery_warning"
omconfig system alertaction event=storagectrlbatteryfail execappath="powershell c:\scripts\omsa-alert.ps1 storage_controller_battery_failure"
#>