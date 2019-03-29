<# This sends e-mails via smtp to a chosen address if an alert is triggered on a Dell Server system by OpenManage
# Pre-Requisites: 
# - Dell OpenManage installed
# - A mail server allowing smtp without authentication is available
# - Populate-AlertAction.ps1 has been run once on the system to set up omconfig correctly
#
# Tested on 2008R2 and 2012R2
#>

$mail_recipient='youraddress@contoso.com'
$mail_server='mail.contoso.com'

param(
[string]$body
)

# This can be amended as required and authentication for some mailservers may require some extra code for saved credentials
send-mailmessage -to $mail_recipient -from $env:COMPUTERNAME -subject "$env:COMPUTERNAME OMSA Alert!" -Body $body -SmtpServer $mail_server

# Log any mail errors
$error[0].Exception | Format-List * -Force | Out-File C:\scripts\mailerror.txt -Append
$error[0].Exception.InnerException | Format-List * -Force | Out-File C:\scripts\mailerror.txt -Append
