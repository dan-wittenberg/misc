[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$webClient=New-Object System.Net.WebClient
$webClient.DownloadFile('https://pe-2019-m01.aheadaviation.local:8140/packages/current/install.ps1', 'install.ps1')
.\install.ps1 custom_attributes:challengePassword=sUperSecret extension_requests:pp_environment=production extension_requests:pp_role=role::base_windows_role
