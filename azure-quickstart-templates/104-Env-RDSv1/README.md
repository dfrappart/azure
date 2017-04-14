# Exemple de déploiement d'une plateforme RDS (PoC). Déploiement en une heure !

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2F104-Env-RDSv1%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2F104-Env-RDSv1%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

Le template déploie :
- Vnet
- 2 subnets (Subnet AD + Subnet RDS)
- Load balancer (LB-AD prise de main "Inbound Nat rule" VM AD tcp 5001) + IP Publique
- Load balancer (LB-CB prise de main "Inbound Nat rule" VM Connexion Brocker tcp 5001) + IP Publique
- Load balancer (LB-RDS prise de main "Inbound Nat rule" VM RDSH0 tcp 5001) + IP Publique
- Load balancer (LB-GW prise de main "Inbound Nat rule" VM GW tcp 5001 + "Load balancing rules" TCP 443 + UDP 3391 sur la VM Gateway+Web) + IP Publique
- Une VM AD (rôle AD + provisionnement de l'Ad) - Disque Sysvol (managed disk)
- Une VM Connexion Brocker membre de l'Ad (managed disk)
- Une VM Gateway+Web membre de l'Ad (managed disk)
- Une VM RDSH0 membre de l'AD (managed disk)

Les services RDS sont exposés par l'IP Publique du "Load Balancer LB-GW"   (ex:fqdnippubgw.westeurope.cloudapp.azure.com)

Pour finir la configuration lancer le script "rds.ps1" sur le controleur de domaine pour déployer tous les rôles "RDS" (Connexion Broker,Remote Desktop Host, WEB). (20 minutes)
Ex:
Import-Module RemoteDesktop
New-RDSessionDeployment `
 -ConnectionBroker vm-cb.ma-pme.local `
 -SessionHost vm-rdsh0.ma-pme.local `
 -WebAccessServer vm-gw.ma-pme.local

A la fin du script, ajoutez les serveurs "vm-cb.ma-pme.local", "vm-rdsh0.ma-pme.local", "vm-gw.ma-pme.local" dans le "Server Manager" de l'AD pour lancer votre configuration :
- Gateway "fqdnippubgw.westeurope.cloudapp.azure.com"
- Assistant RemoteApp/Bureau (collections ...)
- etc

Pour des tests, récuperer le certificat auto-signé "fqdnippubgw.westeurope.cloudapp.azure.com" sur le serveur "vm-gw.ma-pme.local" (export) , il sera à installer sur les postes ...

Bon test !!!

##Création d'un "Resource Group":
New-AzureRmResourceGroup -Name $rgName -Location $location

##Déploiement de la VM:
New-AzureRmResourceGroupDeployment `
-Name DeployLab `
-ResourceGroupName $rgName `
-TemplateFile .\azuredeploy.json `
-TemplateParameterFile .\azuredeploy.parameters.json `
-Verbose

