# Setup OpenManage Alerting

Script to set up Dell OpenManage alerts via e-mail for typical outages


Overview:

There are two files, Populate-AlertAction.ps1 and omsa-alert.ps1
Populate-AlertAction.ps1 is run once on each server to set up the embedded OpenManage with the correct information.
If a hardware issue occurs, osma-alert.ps1 is called from openmanage directly with a parameter from openmanage 
denoting the type of failure which is sent as an e-mail.

Installation:

Amend both ps1 script files as required:

* Set your e-mail recipient address in osma-alert.ps1

* Set your mailserver dns name or ip address in osma-alert.ps1

* Check powershell is on the system path to ensure Populate-AlertAction.ps1 can be run or else edit to provide full path

* Ensure scripts are located in c:\scripts or amend the path as you wish to one of your choosing. Note this path must
not change after populating with omconfig, or it will fail to be found



