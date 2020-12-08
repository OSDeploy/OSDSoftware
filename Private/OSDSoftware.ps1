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

function InfoDellDisplayManager {
    $Global:OSDInfoUrl = 'https://www.dell.com/support/kbdoc/en-us/000060112/what-is-dell-display-manager'
    $Global:OSDDownloadUrl = 'https://www.delldisplaymanager.com/ddmsetup.exe'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'ddmsetup.exe'
    $Global:OSDDownloadMethod = 'WebClient'
}
function InfoGoogleChrome {
    $Global:OSDInfoUrl = $null
    $Global:OSDDownloadUrl = 'https://dl.google.com/tag/s/dl/chrome/install/googlechromestandaloneenterprise64.msi'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'googlechromestandaloneenterprise64.msi'
    $Global:OSDDownloadMethod = 'WebClient'
}
function InfoADK1803 {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install'
    $Global:OSDDownloadUrl = 'https://go.microsoft.com/fwlink/?linkid=873065'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'adksetup1803.exe'
    $Global:OSDDownloadMethod = 'WebClient'
}
function InfoADK1809 {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install'
    $Global:OSDDownloadUrl = 'https://go.microsoft.com/fwlink/?linkid=2026036'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'adksetup1809.exe'
    $Global:OSDDownloadMethod = 'WebClient'
}
function InfoADK1809PE {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install'
    $Global:OSDDownloadUrl = 'https://go.microsoft.com/fwlink/?linkid=2022233'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'adkwinpesetup1809.exe'
    $Global:OSDDownloadMethod = 'WebClient'
}
function InfoADK1903 {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install'
    $Global:OSDDownloadUrl = 'https://go.microsoft.com/fwlink/?linkid=2086042'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'adksetup1903.exe'
    $Global:OSDDownloadMethod = 'WebClient'
}
function InfoADK1903PE {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install'
    $Global:OSDDownloadUrl = 'https://go.microsoft.com/fwlink/?linkid=2087112'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'adkwinpesetup1903.exe'
    $Global:OSDDownloadMethod = 'WebClient'
}
function InfoADK2004 {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install'
    $Global:OSDDownloadUrl = 'https://go.microsoft.com/fwlink/?linkid=2120254'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'adksetup2004.exe'
    $Global:OSDDownloadMethod = 'WebClient'
}
function InfoADK2004PE {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install'
    $Global:OSDDownloadUrl = 'https://go.microsoft.com/fwlink/?linkid=2120253'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'adkwinpesetup2004.exe'
    $Global:OSDDownloadMethod = 'WebClient'
}
function InfoMDTx86 {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/sccm/mdt/'
    $Global:OSDDownloadUrl = 'https://download.microsoft.com/download/3/3/9/339BE62D-B4B8-4956-B58D-73C4685FC492/MicrosoftDeploymentToolkit_x86.msi'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'MicrosoftDeploymentToolkit_x86.msi'
    $Global:OSDDownloadMethod = 'WebClient'
}
function InfoMDTx64 {
    $Global:OSDInfoUrl = 'https://docs.microsoft.com/en-us/sccm/mdt/'
    $Global:OSDDownloadUrl = 'https://download.microsoft.com/download/3/3/9/339BE62D-B4B8-4956-B58D-73C4685FC492/MicrosoftDeploymentToolkit_x64.msi'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'MicrosoftDeploymentToolkit_x64.msi'
    $Global:OSDDownloadMethod = 'WebClient'
}
function InfoMDTHotfix {
    $Global:OSDInfoUrl = 'https://support.microsoft.com/en-us/help/4564442/windows-10-deployments-fail-with-microsoft-deployment-toolkit'
    $Global:OSDDownloadUrl = 'https://download.microsoft.com/download/3/0/6/306AC1B2-59BE-43B8-8C65-E141EF287A5E/KB4564442/MDT_KB4564442.exe'
    $Global:OSDPageUrl = $null
    $Global:OSDDownloadFileName = 'MDT_KB4564442.exe'
    $Global:OSDDownloadMethod = 'WebClient'
}
function InfoVSCodeUser {
    $Global:OSDInfoUrl = $null
    $Global:OSDDownloadUrl = 'https://aka.ms/win32-x64-user-stable'
    $Global:OSDPageUrl = (Invoke-WebRequest -Uri 'https://code.visualstudio.com/').Links | Where-Object {$_.innerText -like "*version*"}
    $Global:OSDDownloadFileName = "VSCodeUserSetup-x64-$($($OSDPageUrl.innerText).replace('Version ','')).exe"
    $Global:OSDDownloadMethod = 'WebClient'
}
function InfoVSCodeSystem {
    $Global:OSDInfoUrl = $null
    $Global:OSDDownloadUrl = 'https://go.microsoft.com/fwlink/?Linkid=852157'
    $Global:OSDPageUrl = (Invoke-WebRequest -Uri 'https://code.visualstudio.com/').Links | Where-Object {$_.innerText -like "*version*"}
    $Global:OSDDownloadFileName = "VSCodeSetup-x64-$($($OSDPageUrl.innerText).replace('Version ','')).exe"
    $Global:OSDDownloadMethod = 'WebClient'
}

