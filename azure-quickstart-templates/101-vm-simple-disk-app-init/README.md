# Exemple de déploiement d'une simple VM Windows Server avec un disque supplémentaire (initialisé et formaté sous Windows)

Le template déploie :
- Un compte de stockage
- Un "Virtual Network" et deux subnets
- Un "Load Balancer" avec un "Inbound net rule" 5001 (RDP de la VM)
- une carte réseau
- une VM avec un disque supplémentaire avec son initialisation et son formatage sous Windows
- un "Network Sécurity Group" TCP 3389 inbound sur la carte réseau


##Création d'un "resource group":
New-AzureRmResourceGroup -Name $rgName -Location $location 


##Déploiement de la VM:
New-AzureRmResourceGroupDeployment `
-Name DeployLab `
-ResourceGroupName $rgName `
-TemplateFile C:\code\LabARMPocv1\azuredeploy.json `
-TemplateParameterFile C:\code\LabARMPocv1\azuredeploy.parameters.json `
-Verbose

