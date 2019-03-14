param(
  [string] $environment = "production",
  [string] $role = "role::base_windows_role",
  [string] $master = "pe-2019-m01.aheadaviation.local",
)

[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$webClient=New-Object System.Net.WebClient
$webClient.DownloadFile('https://${master}:8140/packages/current/install.ps1', 'install.ps1')
.\install.ps1 custom_attributes:challengePassword=sUperSecret extension_requests:pp_environment=${environment} extension_requests:pp_role=${role}
