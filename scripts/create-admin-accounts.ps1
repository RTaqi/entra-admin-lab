# This script creates admin accounts in Azure Portal using the Microsoft Graph PowerShell module.

$domain = "your-tenant.onmicrosoft.com"

function New-LabPassword {
    -join ((48..57) + (65..90) + (97..122) | Get-Random -Count 24 | ForEach-Object {[char]$_})
}

$admins = @(
    @{ Name="Break Glass 1"; Nick="breakglass1" },
    @{ Name="Break Glass 2"; Nick="breakglass2" },
    @{ Name="Admin Muhammad Taqi";  Nick="adm.taqi" },
    @{ Name="Admin Muhammad Raza"; Nick="adm.raza" }
)

foreach ($admin in $admins) {
    $password = New-LabPassword
    $userPrincipalName = "$($admin.Nick)@$domain"
    
    
    New-MgUser -DisplayName $admin.Name `
               -UserPrincipalName $userPrincipalName `
               -AccountEnabled:$true `
               -MailNickname $admin.Nick `
               -PasswordProfile @{ ForceChangePasswordNextSignIn = $false; Password = $password }

    Write-Host "Creating user: $($admin.Name) with UPN: $userPrincipalName and password: $password"
}