Get-MgRoleManagementDirectoryRoleAssignment -All -Property principal,roleDefinition |
  Select-Object @{n='Principal';e={$_.Principal.AdditionalProperties.displayName}},
                @{n='Role';e={$_.RoleDefinition.DisplayName}},
                DirectoryScopeId |
  Sort-Object Role | Format-Table -AutoSize