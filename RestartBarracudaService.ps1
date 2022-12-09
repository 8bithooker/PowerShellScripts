# Set the service name
$serviceName = "cudanacsvc"

# Check if the service is running
$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
if ($service -eq $null) {
    # The service is not running, so start it
    Start-Service -Name $serviceName
}
else {
    if ($service.Status -ne "Running") {
        # The service is not running, so start it
        Start-Service -Name $serviceName
    }
}
