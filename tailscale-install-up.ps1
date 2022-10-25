[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $authkey
)
mkdir C:\temp -Force
wget https://pkgs.tailscale.com/stable/tailscale-ipn-setup-1.32.1.exe  -OutFile C:\temp\tailscale-ipn-setup-1.32.1.exee
Start-Process -FilePath C:\temp\tailscale-ipn-setup-1.32.1.exe -Wait -NoNewWindow -ArgumentList ' /S'
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
tailscale up --authkey=$authkey --unattended --accept-routes
