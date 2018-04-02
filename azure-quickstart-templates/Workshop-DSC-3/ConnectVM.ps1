$RG = "RG-Worshop-DSC-3"
$Automation ="SRV-PS-PULL"
$NodeConfiguration = "MonSiteWebDSCPull.localhost"
$VM = "VM-1-Lab"



Register-AzureRmAutomationDscNode ` -ResourceGroupName $RG ` -AutomationAccountName $Automation ` -AzureVMResourceGroup $RG ` -AzureVMName $VM ` -NodeConfigurationName $NodeConfiguration ` -RefreshFrequencyMins 30 ` -ConfigurationModeFrequencyMins 15 ` -RebootNodeIfNeeded $true ` -ConfigurationMode ApplyAndAutocorrect ` -ActionAfterReboot ContinueConfiguration  