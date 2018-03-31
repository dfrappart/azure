$DSCSourceFilePath = "C:\Worshop-DSC-2\MonSiteWebDSCPushJSON.ps1"
$DSCArchiveFilePath = "C:\Worshop-DSC-2\MonSiteWebDSCPushJSON.ps1.zip"

Publish-AzureRmVMDscConfiguration $DSCSourceFilePath -OutputArchivePath $DSCArchiveFilePath -Force -Verbose