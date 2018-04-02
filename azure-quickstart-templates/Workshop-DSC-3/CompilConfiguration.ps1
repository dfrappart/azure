$ConfName = "MonSiteWebDSCPull"
$RG = "RG-Worshop-DSC-3"
$Automation ="SRV-PS-PULL"


Start-AzureRmAutomationDscCompilationJob ` -ConfigurationName $ConfName ` -ResourceGroupName $RG ` -AutomationAccountName $Automation