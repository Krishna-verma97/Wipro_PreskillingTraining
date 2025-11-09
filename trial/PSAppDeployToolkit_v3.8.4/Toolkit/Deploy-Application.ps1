## Deploy-Application.ps1
[CmdletBinding()]
Param (
    [ValidateSet('Install','Uninstall')]
    [string]$DeploymentType = 'Install',
    [ValidateSet('Interactive','Silent')]
    [string]$DeployMode = 'Silent'
)

# ==================================================================
# Custom Variables
# ==================================================================
$AppName = "7-Zip"
$AppExe  = "7z2501-x64.exe"
$AppPath = Join-Path -Path $PSScriptRoot -ChildPath "Files\$AppExe"
$CustomLog = "C:\ProgramData\7-Zip_Deploy.log"

# Ensure ProgramData exists
if (-not (Test-Path "C:\ProgramData")) {
    New-Item -Path "C:\ProgramData" -ItemType Directory -Force | Out-Null
}

# Ensure log file exists
if (-not (Test-Path $CustomLog)) {
    New-Item -Path $CustomLog -ItemType File -Force | Out-Null
}

function Write-CustomLog {
    param ([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $CustomLog -Value "$timestamp [$DeploymentType] $Message"
}

# ==================================================================
# Main Deployment Logic
# ==================================================================
try {
    if ($DeploymentType -eq 'Install') {
        Write-CustomLog "Starting Installation of $AppName"
        Start-Process -FilePath $AppPath -ArgumentList "/S" -Wait -PassThru | Out-Null
        Write-CustomLog "$AppName installed successfully."
    }
    elseif ($DeploymentType -eq 'Uninstall') {
        Write-CustomLog "Starting Uninstallation of $AppName"
        $UninstallString = "C:\Program Files\7-Zip\Uninstall.exe"
        if (Test-Path $UninstallString) {
            Start-Process -FilePath $UninstallString -ArgumentList "/S" -Wait -PassThru | Out-Null
            Write-CustomLog "$AppName uninstalled successfully."
        }
        else {
            Write-CustomLog "Uninstall.exe not found. $AppName may not be installed."
        }
    }
}
catch {
    Write-CustomLog "Error: $($_.Exception.Message)"
}
