# This script creates security groups for specific roles in Microsoft Graph.
# The groups are created with the necessary properties to be used for role assignments.

# Add Member to the groups

$roleGrop = 'UserAdmins','Helpdesk-Sales','GlobalReaders','SecurityReaders','AppAdmins'

foreach ($role in $roleGrop) {
    # Create a new group for each role.
    New-MgGroup -DisplayName "SG-Role-$role" `
                -MailEnabled:$false `
                -MailNickname "SG-Role-$role" `
                -SecurityEnabled:$true `
                -Description "Security group for $role role"
}


