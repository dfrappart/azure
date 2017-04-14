Import-Module RemoteDesktop
New-RDSessionDeployment `
 -ConnectionBroker vm-cb.ma-pme.local `
 -SessionHost vm-rdsh0.ma-pme.local `
 -WebAccessServer vm-gw.ma-pme.local