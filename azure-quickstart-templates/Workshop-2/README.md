# Exemple de déploiement d'une simple VM Windows Server - un disque supplémentaire (initialisé et formaté ) - un Workspace OMS

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2FWorkshop-2%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2FWorkshop-2%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>



Le template déploie pour un LAB :
- Une IP Publique
- Une URL
- Un groupe de disponibilité
- Un virtual network
- un disque data
- un worksapce OMS (avec les compteurs de performence Windows - CPU - Mémoire - Disque)
- Une VM Windows Server rattachée au Workspace OMS
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

