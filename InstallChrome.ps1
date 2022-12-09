# Check if Chrome is already installed
$chromePath = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
if (Test-Path $chromePath) {
    Write-Output "Google Chrome is already installed."
} else {
    # Download the Chrome installation file
    $chromeInstaller = "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B9A9D0E62-5888-4D77-A0BB-A868F72CFEA9%7D%26lang%3Den%26browser%3D4%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe"
    Invoke-WebRequest -Uri $chromeInstaller -OutFile $env:TEMP\ChromeSetup.exe

    # Install Chrome
    Start-Process -FilePath $env:TEMP\ChromeSetup.exe -ArgumentList '/silent /install' -Wait

    # Clean up the installation file
    Remove-Item $env:TEMP\ChromeSetup.exe -Force
}
