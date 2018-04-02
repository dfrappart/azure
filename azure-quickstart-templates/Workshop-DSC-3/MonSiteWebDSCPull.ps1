configuration MonSiteWebDSCPull
{
    Import-DscResource -ModuleName PsDesiredStateConfiguration, xPSDesiredStateConfiguration
    
    Node localhost
    {
        WindowsFeature Role-IIS {
            Ensure = 'Present'
            Name   = 'Web-Server'       
        }
        WindowsFeature WebServerManagementConsole {
            Ensure = "Present"
            Name   = "Web-Mgmt-Console"
            DependsOn = "[WindowsFeature]Role-IIS"            
        }
        WindowsFeature ASP45 {
            Ensure = "Present"
            Name   = "NET-Framework-45-ASPNET"                                     
        }
        WindowsFeature WCF {
            Ensure = "Present"
            Name   = "NET-WCF-Services45"
            DependsOn = "[WindowsFeature]ASP45"            
        }
        WindowsFeature HttpActivation {
            Ensure = "Present"
            Name   = "NET-WCF-HTTP-Activation45"
            DependsOn = "[WindowsFeature]ASP45"            
        }
        File Directory {
            Ensure          = "Present"
            Type            = "Directory"
            DestinationPath = "C:\ContenuSite\zip"                       
        }
        xRemoteFile DownloadSiteWebContent {
            Uri             = "https://repositorydsc0.blob.core.windows.net/confdsc/FourthCoffee.zip"
            DestinationPath = "C:\ContenuSite\zip"
            DependsOn       = "[File]Directory"
        }
        Archive ArchiveExample {
            Ensure      = "Present" 
            Path        = "C:\ContenuSite\zip\FourthCoffee.zip"
            Destination = "C:\ContenuSite"
            DependsOn   = "[xRemoteFile]DownloadSiteWebContent"
        }
        File SiteWebContent {
            Ensure          = "Present"
            Type            = "Directory"
            Recurse         = $true
            SourcePath      = "C:\ContenuSite\FourthCoffee"
            DestinationPath = "c:\inetpub\wwwroot"
            DependsOn       = "[Archive]ArchiveExample"
        }      
    }
}