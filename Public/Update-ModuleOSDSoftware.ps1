<#
.SYNOPSIS
Updates the OSDSoftware PowerShell Module to the latest version

.DESCRIPTION
Updates the OSDSoftware PowerShell Module to the latest version from the PowerShell Gallery

.LINK
https://www.osdeploy.com/osdsoftware/docs/functions/update-moduleosdsoftware

.Example
Update-ModuleOSDSoftware
#>
function Update-ModuleOSDSoftware {
    [CmdletBinding()]
    PARAM ()
    try {
        Write-Warning "Uninstall-Module -Name OSDSoftware -AllVersions -Force"
        Uninstall-Module -Name OSDSoftware -AllVersions -Force
    }
    catch {}

    try {
        Write-Warning "Install-Module -Name OSDSoftware -Force"
        Install-Module -Name OSDSoftware -Force
    }
    catch {}

    try {
        Write-Warning "Import-Module -Name OSDSoftware -Force"
        Import-Module -Name OSDSoftware -Force
    }
    catch {}
}