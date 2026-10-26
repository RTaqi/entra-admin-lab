# Create Groups
# Group let you manage permissions for multiple users at once.
# You can create groups for different roles or departments in your organization.

$depts = 'Sales','Finance','IT','HR','Marketing','Operations','Executive'

foreach ($dept in $depts) {
    # Create a new group for each department.
    New-MgGroup -DisplayName "SG-Dept-$dept" `
                -MailEnabled:$false `
                -MailNickname "SG-Dept-$dept" `
                -SecurityEnabled:$true `
                -Description "Security group for $dept department"
}

# Add members to groups

foreach ($d in $depts) {
  $group = Get-MgGroup -Filter "displayName eq 'SG-Dept-$d'"
  $members = Get-MgUser -All -Property Id,Department,AccountEnabled |
             Where-Object { $_.Department -eq $d -and $_.AccountEnabled }
  foreach ($m in $members) {
    New-MgGroupMember -GroupId $group.Id -DirectoryObjectId $m.Id
  }
}