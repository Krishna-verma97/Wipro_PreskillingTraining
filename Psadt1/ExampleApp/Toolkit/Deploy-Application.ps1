## Deploy-Application.ps1
## PSAppDeployToolkit v3.8.4
## Example: Install / Uninstall 7-Zip 7z2501-x64.exe

[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [ValidateSet('Install', 'Uninstall')]
    [string]$DeploymentType = 'Install',

    [Parameter(Mandatory = $false)]
    [switch]$DeployMode,

    [Parameter(Mandatory = $false)]
    [switch]$AllowRebootPassThru = $false
)

# Load the toolkit functions
. "$PSScriptRoot\AppDeployToolkit\AppDeployToolkitMain.ps1"

Try {
    ##===============================================
    ## PRE-INSTALLATION
    ##===============================================
    Show-InstallationProgress -StatusMessage "Preparing for $DeploymentType of 7-Zip..."

    ##===============================================
    ## INSTALLATION
    ##===============================================
    if ($DeploymentType -ieq 'Install') {
        ## Close any running 7-Zip instances before install
        Show-InstallationWelcome -CloseApps '7zFM' -AllowDeferCloseApps -ForceCloseAppsCountdown 300

        ## Install 7-Zip silently
        Execute-Process -Path "$dirFiles\7z2501-x64.exe" -Arguments "/S" -Wait

        ## Show installation complete message
        Show-InstallationPrompt -Message "7-Zip installation completed successfully." -ButtonRightText "OK"
    }

    ##===============================================
    ## UNINSTALLATION
    ##===============================================
    elseif ($DeploymentType -ieq 'Uninstall') {
        ## Close any running 7-Zip instances before uninstall
        Show-InstallationWelcome -CloseApps '7zFM' -AllowDeferCloseApps -ForceCloseAppsCountdown 300

        ## Get the uninstall string from registry
        $UninstallRegKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
        $UninstallSubKey = Get-ChildItem $UninstallRegKey | Where-Object {
            (Get-ItemProperty $_.PSPath).DisplayName -like "7-Zip*"
        }

        if ($UninstallSubKey) {
            $UninstallString = (Get-ItemProperty $UninstallSubKey.PSPath).UninstallString
            Execute-Process -Path "cmd.exe" -Arguments "/c $UninstallString /S" -Wait
            Show-InstallationPrompt -Message "7-Zip was successfully uninstalled." -ButtonRightText "OK"
        }
        else {
            Show-InstallationPrompt -Message "7-Zip is not installed on this system." -ButtonRightText "OK"
        }
    }
}
Catch {
    Write-Log -Message "Error: $($_.Exception.Message)" -Severity 3 -Source $deploymentType
}
Finally {
    Exit-Script -ExitCode $mainExitCode
}
