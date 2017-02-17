$AzureAccount = 'root@admapme.onmicrosoft.com'
$PassAzureTenant= 'Satanas!007'


#Login 'Tenant Azure'
$PasswordAzureLogin = convertto-securestring $PassAzureTenant -asplaintext -force
$Credential = New-Object –TypeName System.Management.Automation.PSCredential –ArgumentList $AzureAccount, $PasswordAzureLogin
Login-AzureRmAccount -Credential $Credential

$rgName ='RG-VM-HDD-Manage'
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
-TemplateFile C:\Git\Pierre-Chesne\azure\azure-quickstart-templates\101-vm-simple-managed-disks-2-data\azuredeploy.json `
-TemplateParameterFile C:\Git\Pierre-Chesne\azure\azure-quickstart-templates\101-vm-simple-managed-disks-2-data\azuredeploy.parameters.json `
-Verbose





