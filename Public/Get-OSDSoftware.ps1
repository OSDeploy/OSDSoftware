<#
.SYNOPSIS
Download software related to OS Deployment

.DESCRIPTION
Download software related to OS Deployment, including the ADK and MDT

.LINK
https://osdsoftware.osdeploy.com/module/functions/get-osdsoftware

.PARAMETER Name
Name of the software to download

.PARAMETER DownloadPath
This is the path to download the updates

.EXAMPLE
Get-OSDSoftware -Name 'Google Chrome Enterprise x64' -DownloadPath C:\Temp
Downloads googlechromestandaloneenterprise64.msi to C:\Temp
Alternatively, use the shorter command line
OSDSoftware 'Google Chrome Enterprise x64' C:\Temp
#>
function Get-OSDSoftware {
    [CmdletBinding()]
    PARAM (
        [Parameter(Position=0,Mandatory=$true)]
        [ValidateSet(`
            'Dell Display Manager',
            'Google Chrome Enterprise x64',
            'Microsoft ADK 1803',
            'Microsoft ADK 1809',
            'Microsoft ADK 1809 WinPE Addon',
            'Microsoft ADK 1903',
            'Microsoft ADK 1903 WinPE Addon',
            'Microsoft ADK 2004',
            'Microsoft ADK 2004 WinPE Addon',
            'Microsoft MDT 8456 x86',
            'Microsoft MDT 8456 x64',
            'Microsoft MDT Hotfix 4564442',
            'Microsoft VS code User x64',
            'Microsoft VS code System x64'
        )]
        [string]$Name,
        [Parameter(Position=1)]
        [string]$DownloadPath,
        [switch]$Run
    )
    #===================================================================================================
    #   Variables
    #===================================================================================================
    $Global:OSDInfoUrl = $null
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadUrl = $null
    $Global:OSDDownloadFileName = $null
    $Global:OSDDownloadMethod = $null
    #===================================================================================================
    #   Paths
    #===================================================================================================
    #{374DE290-123F-4565-9164-39C4925E467B}
    if (!($DownloadPath)) {$DownloadPath = [Environment]::GetFolderPath("Desktop")}
    if (!(Test-Path "$DownloadPath")) {New-Item -Path "$DownloadPath" -ItemType Directory -Force | Out-Null}
    #===================================================================================================
    #   Software
    #===================================================================================================
    if ($Name -eq 'Dell Display Manager') {InfoDellDisplayManager}
    if ($Name -eq 'Google Chrome Enterprise x64') {InfoGoogleChrome}
    if ($Name -eq 'Microsoft ADK 1803') {InfoADK1803}
    if ($Name -eq 'Microsoft ADK 1809') {InfoADK1809}
    if ($Name -eq 'Microsoft ADK 1809 WinPE Addon') {InfoADK1809PE}
    if ($Name -eq 'Microsoft ADK 1903') {InfoADK1903}
    if ($Name -eq 'Microsoft ADK 1903 WinPE Addon') {InfoADK1903PE}
    if ($Name -eq 'Microsoft ADK 2004') {InfoADK2004}
    if ($Name -eq 'Microsoft ADK 2004 WinPE Addon') {InfoADK2004PE}
    if ($Name -eq 'Microsoft MDT 8456 x86') {InfoMDTx86}
    if ($Name -eq 'Microsoft MDT 8456 x64') {InfoMDTx64}
    if ($Name -eq 'Microsoft MDT Hotfix 4564442') {InfoMDTHotfix}
    if ($Name -eq 'Microsoft VS code User x64') {InfoVSCodeUser}
    if ($Name -eq 'Microsoft VS code System x64') {InfoVSCodeSystem}
    #===================================================================================================
    #   Download
    #===================================================================================================
    Write-Verbose -Verbose "Downloading from $OSDDownloadUrl using $OSDDownloadMethod"
    #Write-Host -ForegroundColor DarkGray "Saving As: $DownloadPath\$OSDDownloadFileName"
    #Write-Host -ForegroundColor DarkGray "Download Method: $OSDDownloadMethod"
    #===================================================================================================
    #   BITS
    #===================================================================================================
    if ($OSDDownloadMethod -eq 'BITS') {
        Start-BitsTransfer -Source $OSDDownloadUrl -Destination "$DownloadPath"
    }
    #===================================================================================================
    #   WebClient
    #===================================================================================================
    if ($OSDDownloadMethod -eq 'WebClient') {
        if (Test-Path "$DownloadPath\$OSDDownloadFileName") {
            Write-Warning "Overwriting existing file $DownloadPath\$OSDDownloadFileName"
        } else {
            Write-Warning "Downloading to $DownloadPath\$OSDDownloadFileName"
        }
        (New-Object System.Net.WebClient).DownloadFile("$OSDDownloadUrl", "$DownloadPath\$OSDDownloadFileName")
        if (Test-Path "$DownloadPath\$OSDDownloadFileName") {
            Write-Verbose -Verbose "Download Complete"
            if ($Run -eq $true) {
                & "$DownloadPath\$OSDDownloadFileName"
            }
        }
    }
    #===================================================================================================
    #   WebRequest
    #===================================================================================================
    if ($OSDDownloadMethod -eq 'WebRequest') {
        #$DownloadFileName = [System.IO.Path]::GetFileName((Get-RedirectedUrl "$OSDDownloadUrl"))
        #Write-Host $DownloadFileName
        Invoke-WebRequest -Uri $OSDDownloadUrl -OutFile "$DownloadPath\$OSDDownloadFileName"

    }
}