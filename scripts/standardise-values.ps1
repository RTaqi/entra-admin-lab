# This script standardizes the values of the Department and JobTitle fields for all users in Microsoft Graph.

# deptMap is a hashtable that maps the original department values to their standardized values.
$deptMap = @{'sales' = 'Sales'; 'finance' = 'Finance'; 'hr' = 'Human Resources'; 'it' = 'IT';}

# tilteMap is a hashtable that maps the original job title values to their standardized values.
$tilteMap = @{
    'Sales Rep' = 'Sales Representative'
    'sales representative' = 'Sales Representative'
    'Sys Admin' = 'System Administrator'
    'Marketing Exec' = 'Marketing Executive'
    'marketing executive' = 'Marketing Executive'
    'accountant' = 'Accountant'
    'helpdesk' = 'Help Desk Technician'
}

# Get all users from Microsoft Graph with the required properties.
$users = Get-MgUser -All -Property Id,UserPrincipalName,DisplayName,Department,JobTitle

# Loop through each user and check if their Department or JobTitle needs to be standardized.
foreach ($u in $users) {
    $changes = @{}

    # Check if the user's JobTitle needs to be standardized.
    if($u.Department -and $deptMap.ContainsKey($u.Department) -and $deptMap[$u.Department] -cne $u.Department) {
        $changes['Department'] = $deptMap[$u.Department]
    } 

    # Check if the user's JobTitle needs to be standardized.
    if($u.JobTitle -and $tilteMap.ContainsKey($u.JobTitle) -and $tilteMap[$u.JobTitle] -cne $u.JobTitle) {
        $changes['JobTitle'] = $tilteMap[$u.JobTitle]
    }

    # If there are any changes to be made, update the user in Microsoft Graph.
    if($changes.Count -gt 0) {
        Write-Host "Updateing user $($u.UserPrincipalName) with changes: $($changes.Keys -join ', ')"
        # Update the user in Microsoft Graph with the standardized values.
        Update-MgUser -UserId $u.Id @changes 
    }

}