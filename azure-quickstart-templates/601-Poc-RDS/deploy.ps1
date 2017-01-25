$AzureAccount = 'root@admapme.onmicrosoft.com'
$PassAzureTenant= 'Satanas!007'


#Login 'Tenant Azure'
$PasswordAzureLogin = convertto-securestring $PassAzureTenant -asplaintext -force
$Credential = New-Object –TypeName System.Management.Automation.PSCredential –ArgumentList $AzureAccount, $PasswordAzureLogin
Login-AzureRmAccount -Credential $Credential

$rgName ='601-POC-RDS'
$Location= 'Westeurope'

try {     
    Get-AzureRmResourceGroup -Name $rgName -Location $location -ErrorAction Stop     
    Write-Host 'Le "ResourceGroup" existe déjà...' -foregroundcolor yellow 
}
catch {     
New-AzureRmResourceGroup -Name $rgName -Location $location 
}


New-AzureRmResourceGroupDeployment `
-Name DeployLab `
-ResourceGroupName $rgName `
-TemplateFile C:\Git\Pierre-Chesne\azure\azure-quickstart-templates\601-Poc-RDS\azuredeploy.json `
-TemplateParameterFile C:\Git\Pierre-Chesne\azure\azure-quickstart-templates\601-Poc-RDS\azuredeploy.parameters.json `
-Verbose





