# Exemple de déploiement d'une simple VM Windows Server avec un disque supplémentaire (initialisé et formaté sous Windows)

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2F101-vm-simple-disk-app-init%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2F101-vm-simple-disk-app-init%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>



Le template déploie :
- Un compte de stockage
- Un "Virtual Network" et deux subnets
- Une "IP publique" pour le "Load Balancer"
- Un "Load Balancer" avec un "Inbound nat rule" TCP 5001 (RDP de la VM)
- Une carte réseau
- Une VM avec un disque supplémentaire avec son initialisation et son formatage sous Windows
- Initialise le disque et le formate via PowerShell DSC
- Un "Network Sécurity Group" TCP 3389 inbound sur la carte réseau de la vm



##Création d'un "Resource Group":
New-AzureRmResourceGroup -Name $rgName -Location $location 


##Déploiement de la VM:
New-AzureRmResourceGroupDeployment `
-Name DeployLab `
-ResourceGroupName $rgName `
-TemplateFile .\azuredeploy.json `
-TemplateParameterFile .\azuredeploy.parameters.json `
-Verbose

