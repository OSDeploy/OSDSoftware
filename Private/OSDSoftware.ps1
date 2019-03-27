Function OSDSoftware-Get-RedirectedUrl {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true)]
        [String]$URL
    )

    $request = [System.Net.WebRequest]::Create($url)
    $request.AllowAutoRedirect=$false
    $response=$request.GetResponse()

    If ($response.StatusCode -eq "Found")
    {
        $response.GetResponseHeader("Location")
    }
}

function OSDSchrome {
    $Global:OSDInfoUrl = $null
    $Global:OSDDownloadUrl = 'https://dl.google.com/tag/s/dl/chrome/install/googlechromestandaloneenterprise64.msi'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'googlechromestandaloneenterprise64.msi'
    $Global:OSDDownloadMethod = 'WebClient'
}
function OSDSadk1803 {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install'
    $Global:OSDDownloadUrl = 'https://go.microsoft.com/fwlink/?linkid=873065'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'adksetup1803.exe'
    $Global:OSDDownloadMethod = 'WebClient'
}

function OSDSadk1809 {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install'
    $Global:OSDDownloadUrl = 'https://go.microsoft.com/fwlink/?linkid=2026036'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'adksetup1809.exe'
    $Global:OSDDownloadMethod = 'WebClient'
}

function OSDSadk1809PE {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install'
    $Global:OSDDownloadUrl = 'https://go.microsoft.com/fwlink/?linkid=2022233'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'adkwinpesetup1809.exe'
    $Global:OSDDownloadMethod = 'WebClient'
}
function OSDSmdt32 {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/sccm/mdt/'
    $Global:OSDDownloadUrl = 'https://download.microsoft.com/download/3/3/9/339BE62D-B4B8-4956-B58D-73C4685FC492/MicrosoftDeploymentToolkit_x86.msi'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'MicrosoftDeploymentToolkit_x86.msi'
    $Global:OSDDownloadMethod = 'WebClient'
}
function OSDSmdt64 {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/sccm/mdt/'
    $Global:OSDDownloadUrl = 'https://download.microsoft.com/download/3/3/9/339BE62D-B4B8-4956-B58D-73C4685FC492/MicrosoftDeploymentToolkit_x64.msi'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'MicrosoftDeploymentToolkit_x64.msi'
    $Global:OSDDownloadMethod = 'WebClient'
}

function OSDSmscodeu {
    $Global:OSDInfoUrl = $null
    $Global:OSDDownloadUrl = 'https://aka.ms/win32-x64-user-stable'
    $Global:OSDPageUrl = (Invoke-WebRequest -Uri 'https://code.visualstudio.com/').Links | Where-Object {$_.innerText -like "*version*"}
    $Global:OSDDownloadFileName = "VSCodeUserSetup-x64-$($($OSDPageUrl.innerText).replace('Version ','')).exe"
    $Global:OSDDownloadMethod = 'WebClient'
}

function OSDSmscodes {
    $Global:OSDInfoUrl = $null
    $Global:OSDDownloadUrl = 'https://go.microsoft.com/fwlink/?Linkid=852157'
    $Global:OSDPageUrl = (Invoke-WebRequest -Uri 'https://code.visualstudio.com/').Links | Where-Object {$_.innerText -like "*version*"}
    $Global:OSDDownloadFileName = "VSCodeSetup-x64-$($($OSDPageUrl.innerText).replace('Version ','')).exe"
    $Global:OSDDownloadMethod = 'WebClient'
}

