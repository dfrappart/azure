# Exemple de déploiement d'une simple VM Windows Server avec deux disques supplémentaires (au choix S4 S4 S10 S20 S30) en "Managed Disk" (initialisés et formatés sous Windows)

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2F101-vm-simple-managed-disks-2-data%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2F101-vm-simple-managed-disks-2-data%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>



Le template déploie :
- Un "Virtual Network" et un subnets
- Une "IP publique" pour le "Load Balancer"
- Un "Load Balancer" avec un "Inbound nat rule" TCP 5001 (RDP de la VM)
- Une carte réseau
- Une VM avec deux disques supplémentaires en 'Managed Disk' avec initialisation et formatage des disques sous Windows
- Initialisation et le formatage des deux disques en PowerShell DSC
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

