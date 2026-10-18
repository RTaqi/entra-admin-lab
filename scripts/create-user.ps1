$users = Import-Csv .\users.csv

foreach ($u in $users) {
    $pw = @{
        Password = "LabPass#2026x"
        ForceChangePasswordNextSignIn = $true
    }
    New-MgUser -DisplayName u.DisplayName `
            -UserPrincipalName $u.UPN `
            -MailNickname $u.Nick `
            -AccountEnabled `
            -PasswordProfile $pw `
            -Department $u.Department `
            -JobTitle $u.JobTitle `
            -UsageLocation "PK"
}



