# Worshop PowerShell DSC . Création d'un site Web en mode 'Push'


Le template déploie pour un LAB :
- Une IP Publique
- Un groupe de disponibilité
- Un virtual network
- Une VM Windows Server
- Auto-Shutdown à 19h
- Extension PowerShell DSC


##Création d'un "Resource Group":
New-AzureRmResourceGroup -Name $rgName -Location $location 


##Déploiement de la VM:
New-AzureRmResourceGroupDeployment `
-Name DeployLab `
-ResourceGroupName $rgName `
-TemplateFile .\azuredeploy.json `
-Verbose

