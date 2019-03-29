# Setup OpenManage Alerting

Script to set up Dell OpenManage alerts via e-mail for typical outages


Overview:

There are two files, Populate-AlertAction.ps1 and omsa-alert.ps1
Populate-AlertAction.ps1 is run once on each server to set up the embedded OpenManage with the correct information.
If a hardware issue occurs, osma-alert.ps1 is called from openmanage directly with a parameter from openmanage 
denoting the type of failure which is sent as an e-mail.

Installation:
Amend both ps1 files as requred and store them to your system in the predefined path or path of your choosing
in particular for osma-alert.ps1. Note this file and it's path must not changed or the Populate-AlertAction.ps1
will have to be re-run to ensure the path and naming are consistent.

