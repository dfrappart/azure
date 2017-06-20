#Infrastructure de base pour une plateforme XenDesktop Essentials 

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2F104-XD%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2F104-XD%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>


Le template déploie :
- Un "Virtual Network"
- Un "Groupe de disponibilité"
- Une "IP Publique"
- Un "Load Balancer" avec trois "inbound Nat Rules" TCP 5001, 5002, 5003 pour la prise de main à distance du Contrôleur de domaine et des Serveurs membres
- une carte réseau pour le contrôleur de domaine
- des cartes réseau pour les serveurs membres
- une carte réseau pour le poste Windows 10 master
- « Network Secutity Group » sur les cartes réseaux (TCP 3389) 
- un disque suplémentaire pour le SysVol initialisé et formaté pour l'AD (en "managed disk")
- une VM "Controleur de domaine" avec un attachement du disque "Sysvol" , et toute l’active directory de provisionnée.
- Creation de quatre OU (XDConnectorsVDI; XDUsersVDI; XDPostesVDI; XDMasterVDI)
- deux VM membres (Serveurs Connectors) du domaine qui joint l' OU XDConnectorsVDI (redémarer les VM à la fin du déploiement)
- Compte de stockage pour les diags des VM
- Compte de stockage pour le master Windows 10
- Compte de stockage pour l'image Windows 10
- une VM Windows 10 (image MSDN) avec un



##Création d'un "Resource Group":
New-AzureRmResourceGroup -Name $rgName -Location $location 


##Déploiement de la VM:
New-AzureRmResourceGroupDeployment `
-Name DeployLab `
-ResourceGroupName $rgName `
-TemplateFile .\azuredeploy.json `
-TemplateParameterFile .\azuredeploy.parameters.json `
-Verbose

