# Exemple de déploiement d'une simple VM Windows Server avec un disque supplémentaire (initialisé et formaté sous Windows)

Le template déploie :
- Un compte de stockage
- Un "Virtual Network" et deux subnets
- Une "IP publique" pour le "Load Balancer"
- Un "Load Balancer" avec un "Inbound nat rule" 5001 (RDP de la VM)
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

