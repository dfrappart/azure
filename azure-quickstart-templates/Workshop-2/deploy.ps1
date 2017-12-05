$AzureAccount = 'root@masociete.onmicrosoft.com'
$PassAzureTenant= 'Password123$'

#Login 'Tenant Azure'
$PasswordAzureLogin = convertto-securestring $PassAzureTenant -asplaintext -force
$Credential = New-Object –TypeName System.Management.Automation.PSCredential –ArgumentList $AzureAccount, $PasswordAzureLogin
Login-AzureRmAccount -Credential $Credential

#Get-AzureRmSubscription –SubscriptionName "Services de la plateforme Windows Azure pour Visual Studio Ultim" | Select-AzureRmSubscription

$rgName ='RG_Name'
$Location= 'Westeurope'

try {     
    Get-AzureRmResourceGroup -Name $rgName -Location $location -ErrorAction Stop     
    Write-Host 'Le "ResourceGroup" existe déjà...' -foregroundcolor yellow 
}
catch {     
New-AzureRmResourceGroup -Name $rgName -Location $location 
}

New-AzureRmResourceGroupDeployment `
-Name DeployAppv1 `
-ResourceGroupName $rgName `
-TemplateFile .\azuredeploy.json `
-TemplateParameterFile .\azuredeploy.parameters.json `
-Verbose






