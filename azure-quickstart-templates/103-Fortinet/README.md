# Déploiement d'une Virtual Appliance Fortinet
# Exemple de déploiement d'une Virtual Appliance FortiGate NGFW Single VM Template avec trois NICs 
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2F103-Fortinet%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FPierre-Chesne%2Fazure%2Fmaster%2Fazure-quickstart-templates%2F103-Fortinet%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>


Le template déploie :
- Un "Virtual Network" avec 3 Subnets (Public/Internal1/Internal2)
- Un "Groupe de disponibilité"
- Une "IP Publique" 
- une Nic (Subnet public) avec l'IP Publique
- une Nic (Subnet Internal 1)
- une Nic (Subnet Internal 2)
- trois UDR (Public/Internal1/Internal2)
- une Virtual Appliance FortiGate NGFW Single VM Template


##Création d'un "Resource Group":
New-AzureRmResourceGroup -Name $rgName -Location $location 


##Déploiement de la VM:
New-AzureRmResourceGroupDeployment `
-Name DeployLab `
-ResourceGroupName $rgName `
-TemplateFile .\azuredeploy.json `
-TemplateParameterFile .\azuredeploy.parameters.json `
-Verbose

