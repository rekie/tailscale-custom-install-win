[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $authkey
)
wget https://pkgs.tailscale.com/stable/tailscale-ipn-setup-1.18.0.exe  -OutFile C:\temp\tailscale-ipn-setup-1.18.0.exe
Start-Process -FilePath C:\temp\tailscale-ipn-setup-1.18.0.exe -Wait -NoNewWindow -ArgumentList ' /S'
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
tailscale up --authkey=$authkey --unattended --accept-routes