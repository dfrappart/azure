$FileConf = "C:\TestWorkshop\MonSiteWebDSCPull.ps1"
$RG = "RG-Worshop-DSC-3"
$Automation ="SRV-PS-PULL"


Import-AzureRmAutomationDscConfiguration ` -SourcePath $FileConf ` -ResourceGroupName $RG ` -AutomationAccountName $Automation ` -Published