# Exemple de déploiement d'une simple VM Windows Server avec un disque supplémentaire (initialisé et formaté sous Windows)

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2FWorkshop-1%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2FWorkshop-1%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>



Le template déploie pour un LAB :
- Une IP Publique
- Une URL
- Un groupe de disponibilité
- Un virtual network
- un disque data
- Une VM Windows Server
- Initialisation et formatage du disque avec l'extension PowerShell DSC



##Création d'un "Resource Group":
New-AzureRmResourceGroup -Name $rgName -Location $location 


##Déploiement de la VM:
New-AzureRmResourceGroupDeployment `
-Name DeployLab `
-ResourceGroupName $rgName `
-TemplateFile .\azuredeploy.json `
-TemplateParameterFile .\azuredeploy.parameters.json `
-Verbose

