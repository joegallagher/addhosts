$hostName = $args[0]
$ipAddress = $args[1]

Get-PackageProvider -Name "NuGet" -Force

if (Get-Module -ListAvailable -Name PsHosts) {
    Write-Host "Module exists"
} 
else {
    Install-Module PsHosts -Confirm:$False -Force 
}
Import-Module PsHosts

If (Test-HostEntry $hostName) {
    Remove-HostEntry $hostName
}
Set-HostEntry $hostName $ipAddress -force