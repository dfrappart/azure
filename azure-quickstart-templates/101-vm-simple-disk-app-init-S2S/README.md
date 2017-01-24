# Exemple de déploiement d'une configuration VM Windows Server dans un "Virtual Network" avec un lien VPN S2S


Le template déploie :
- Un compte de stockage
- Un "Virtual Network" et deux subnets
- Une "Virtual Gateway"
- Une connexion "VPN 2S2"
- Une "IP publique" pour le "Load Balancer"
- Une "IP publique" pour la "Virtual Gateway"
- Un "Load Balancer" avec un "Inbound nat rule" TCP 5001 (RDP de la VM)
- Une carte réseau
- Une VM avec un disque 500 Go supplémentaire avec son initialisation et son formatage sous Windows
- Les rôles DNS et ADDS installés dans la VM Windows via PowerShell DSC
- Initialise le disque et le formate via PowerShell DSC
- Un "Network Sécurity Group" TCP 3389 inbound sur la carte réseau de la vm
- Update du VNet avec le DNS de l'ADDS 



##Création d'un "Resource Group":
New-AzureRmResourceGroup -Name $rgName -Location $location 


##Déploiement de la VM:
New-AzureRmResourceGroupDeployment `
-Name DeployLab `
-ResourceGroupName $rgName `
-TemplateFile .\azuredeploy.json `
-TemplateParameterFile .\azuredeploy.parameters.json `
-Verbose

