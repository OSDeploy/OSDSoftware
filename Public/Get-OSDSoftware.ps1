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
            'Google Chrome Enterprise x64',`
            'Microsoft ADK 1803',`
            'Microsoft ADK 1809',`
            'Microsoft ADK 1809 WinPE Addon',`
            'Microsoft MDT 8456 x86',`
            'Microsoft MDT 8456 x64',`
            'Microsoft VS code User x64',`
            'Microsoft VS code System x64'`
        )]
        [string]$Name,
        [Parameter(Position=1)]
        [string]$DownloadPath
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
    if ($Name -eq 'Google Chrome Enterprise x64') {OSDSchrome}
    if ($Name -eq 'Microsoft ADK 1803') {OSDSadk1803}
    if ($Name -eq 'Microsoft ADK 1809') {OSDSadk1809}
    if ($Name -eq 'Microsoft ADK 1809 WinPE Addon') {OSDSadk1809PE}
    if ($Name -eq 'Microsoft MDT 8456 x86') {OSDSmdt32}
    if ($Name -eq 'Microsoft MDT 8456 x64') {OSDSmdt64}
    if ($Name -eq 'Microsoft VS code User x64') {OSDSmscodeu}
    if ($Name -eq 'Microsoft VS code System x64') {OSDSmscodes}
    #===================================================================================================
    #   Download
    #===================================================================================================
    Write-Host "Download Url: $OSDDownloadUrl" -ForegroundColor Cyan
    Write-Host "Download Full Path: $DownloadPath\$OSDDownloadFileName" -ForegroundColor Cyan
    Write-Host "Download Method: $OSDDownloadMethod" -ForegroundColor Cyan
    if ($OSDDownloadMethod -eq 'BITS') {
        Start-BitsTransfer -Source $OSDDownloadUrl -Destination "$DownloadPath"
    }
    if ($OSDDownloadMethod -eq 'WebClient') {
        Write-Warning "Downloading without progress ..."
        (New-Object System.Net.WebClient).DownloadFile("$OSDDownloadUrl", "$DownloadPath\$OSDDownloadFileName")
        #Start-BitsTransfer -Source $OSDDownloadUrl -Destination "$DownloadPath\$OSDDownloadFileName"
    }
    if ($OSDDownloadMethod -eq 'WebRequest') {
        #$DownloadFileName = [System.IO.Path]::GetFileName((Get-RedirectedUrl "$OSDDownloadUrl"))
        #Write-Host $DownloadFileName
        Invoke-WebRequest -Uri $OSDDownloadUrl -OutFile "$DownloadPath\$OSDDownloadFileName"
    }
}