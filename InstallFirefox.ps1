# Check if Firefox is already installed
$firefoxPath = "C:\Program Files\Mozilla Firefox\firefox.exe"
if (Test-Path $firefoxPath) {
    Write-Output "Mozilla Firefox is already installed."
} else {
    # Download the Firefox installation file
    $firefoxInstaller = "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US"
    Invoke-WebRequest -Uri $firefoxInstaller -OutFile $env:TEMP\FirefoxSetup.exe

    # Install Firefox
    Start-Process -FilePath $env:TEMP\FirefoxSetup.exe -ArgumentList '/S' -Wait

    # Clean up the installation file
    Remove-Item $env:TEMP\FirefoxSetup.exe -Force
}
