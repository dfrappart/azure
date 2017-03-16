# Exemple de déploiement d'un contrôleur de domaine avec un serveur membre (Exemple de mise en place d'une démonstration XenApp Esssentials)

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2F102-vm-AD-plus-Srv-Membre%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2F102-vm-AD-plus-Srv-Membre%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>



Le template déploie :
- Un "Virtual Network"
- Un "Groupe de disponibilité"
- Une "IP Publique"
- Un "Load Balancer" avec deux "inbound Nat Rules" TCP 5001 et 5002 pour la prise de main à distance du Controleur de domaine et du Serveur membre
- une carte réseau pour le controleur de domaine
- une carte réseau pour le serveur membre
- un disque suplémentaire pour le SysVol initialisé et formaté pour l'AD (en "managed disk")
- une VM "Controleur de domaine" avec attache du disque "Sysvol"
- Creation de trois OU
- Une VM membre du domaine qui rentre dans une des trois OU (redémarer la VM à la fin du déploiement)


##Création d'un "Resource Group":
New-AzureRmResourceGroup -Name $rgName -Location $location 


##Déploiement de la VM:
New-AzureRmResourceGroupDeployment `
-Name DeployLab `
-ResourceGroupName $rgName `
-TemplateFile .\azuredeploy.json `
-TemplateParameterFile .\azuredeploy.parameters.json `
-Verbose

