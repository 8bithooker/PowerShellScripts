#########################################################################################################################################################
#This script will prompt for the administrative credentials twice (for Azure AD and MSOL) and then prompt for the user that is being worked on.
#It will then reset the password, disable MFA and revoke any current sessions
#########################################################################################################################################################


# Import the necessary modules
Import-Module AzureAD
Import-Module MSOnline

# Connect to Azure AD and Exchange Online
Connect-AzureAD
$cred = Get-Credential
Connect-MsolService -Credential $cred

# Prompt for the user's username
$username = Read-Host "Enter the user's username (e.g. user@domain.com)"

# Generate a random password that includes numbers, letters, and special characters
$password = -join ((33..47) + (48..57) + (58..64) + (65..90) + (91..96) + (97..122) | Get-Random -Count 16 | % {[char]$_})

# Set the user's password
Set-MsolUserPassword -UserPrincipalName $username -NewPassword $password

# Disable MFA for the user
Set-MsolUser -UserPrincipalName $username -StrongAuthenticationRequirements $null

# Force sign out of all sessions for the user
Get-AzureADUser -SearchString $username | Revoke-AzureADUserAllRefreshToken
