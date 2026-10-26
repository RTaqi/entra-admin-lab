
$domain = "Your-tenant.onmicrosoft.com"  # Replace with your actual domain

function Add-ToGroup($groupname, $userPrincipalName) {
    # Get the group by display name
    $group = Get-MgGroup -Filter "displayName eq '$groupname'"
    $user = Get-MgUser -UserId $userPrincipalName
    New-MgGroupMember -GroupId $group.Id -DirectoryObjectId $user.Id

}

Add-ToGroup "SG-Role-UserAdmins"     "adm.taqi@$domain"
Add-ToGroup "SG-Role-AppAdmins"      "adm.taqi@$domain"
Add-ToGroup "SG-Role-Helpdesk"       "adm.raza@$domain"
Add-ToGroup "SG-Role-SecurityReaders" "adm.raza@$domain"
Add-ToGroup "SG-Role-GlobalReaders"  "imran.baig@$domain"