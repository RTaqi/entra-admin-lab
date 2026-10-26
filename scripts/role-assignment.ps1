
function Add-RoleToUser ($upn, $roleName, $Scope="/") {
    $user = Get-MgUser -UserId $upn
    $role = Get-MgRoleManagementDirectoryRoleDefinition -Filter "displayName eq '$roleName'"

    New-MgRoleManagementDirectoryRoleAssignment `
    -DirectoryScopeId $Scope | Out-Null `
    -PrincipalId $user.Id `
    -RoleDefinitionId $role.Id

    Write-Host "Assigned role '$roleName' to user '$upn' with scope '$Scope'"
    
    
}
$domain = "your-tenant.onmicrosoft.com"  # Replace with your actual domain
Add-RoleToUser "adm.taqi@$domain"  "User Administrator"
Add-RoleToUser "adm.taqi@$domain"  "Application Administrator"
Add-RoleToUser "adm.raza@$domain" "Helpdesk Administrator"
Add-RoleToUser "adm.raza@$domain" "Security Reader"
Add-RoleToUser "imran.baig@$domain" "Global Reader"

foreach ($n in 'breakglass1','breakglass2') {
    Add-RoleToUser "$n@$domain" "Global Administrator"
}