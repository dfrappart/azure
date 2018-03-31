Configuration MonSiteWebDSCPush

{
    param(
        [string]$repertoireContenuSite = "c:\ContenuSite",
        [string]$repertoireZip = "c:\ContenuSite\zip",
        [string]$site = "FourthCoffee.zip",
        [string]$uri = "https://repositorydsc0.blob.core.windows.net/confdsc/FourthCoffee.zip",
        [string]$nomdusite = "FourthCoffee"
    )

    Import-DscResource -ModuleName PsDesiredStateConfiguration, xPSDesiredStateConfiguration

    WindowsFeature Role-IIS {
        Ensure = "Present" 
        Name   = "Web-WebServer"  
    }

    WindowsFeature WebServerManagementConsole {
        Ensure    = "Present"
        Name      = "Web-Mgmt-Console"            
        DependsOn = "[WindowsFeature]Role-IIS"
    }

    WindowsFeature ASP45 {
        Ensure = "Present"
        Name   = "NET-Framework-45-ASPNET"                                     
    }

    WindowsFeature WCF {
        Ensure    = "Present"
        Name      = "NET-WCF-Services45"
        DependsOn = "[WindowsFeature]ASP45"
    }

    WindowsFeature HttpActivation {
        Ensure    = "Present"
        Name      = "NET-WCF-HTTP-Activation45"
        DependsOn = "[WindowsFeature]ASP45"
    }

    File Directory {
        Ensure          = "Present"
        Type            = "Directory"
        DestinationPath = $repertoireZip                       
    }

    xRemoteFile DownloadSiteWebContent {
        Uri             = $uri
        DestinationPath = $repertoireZip
        DependsOn       = "[File]Directory"
    }

    Archive ArchiveExample {
        Ensure      = "Present" 
        Path        = "$repertoireZip\$site"
        Destination = "$repertoireContenuSite"
        DependsOn   = "[xRemoteFile]DownloadSiteWebContent"
    }

    File SiteWebContent {
        Ensure          = "Present"
        Type            = "Directory"
        Recurse         = $true
        SourcePath      = "$repertoireContenuSite\$nomdusite"
        DestinationPath = "c:\inetpub\wwwroot"
        DependsOn       = "[Archive]ArchiveExample"
    }     

}

MonSiteWebDSCPush -outputpath "C:\Mof"
Start-DscConfiguration -Path "C:\Mof" -Verbose -Wait -Force