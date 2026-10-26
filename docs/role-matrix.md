Role Assignment


Role-assignable groups, administrative units and custom roles require Entra ID P1/P2, which this lab tenant doesn’t have. Roles were assigned directly to named admin accounts instead. In a licensed client tenant, I would assign roles to role-assignable groups and scope the helpdesk role to an administrative unit.




Role: Global Administrator    
Assigned to: 2 break-glass accounts only
Scope: Whole Tenant
Why: Emengency Access, nothing else


Role: User Administrator	
Assigned to: adm.taqi@your-tenant.com
Scope: Whole tenant	
Why: Create and manage users and groups

Role: Helpdesk Administrator	
Assigned to: adm.raza@your-tenant.com
Role: AU-Sales only	
Why: Reset passwords for Sales staff, nobody else

Role: Global Reader	
Assigned to: imran.baig
Scope: Whole tenant	
Why: View everything, change nothing (auditors, CEO)

Role: Security Reader	
Assigned to: adm.raza@yout-tenant.com
Scope:Whole tenant	
Why: View security reports

Role: Application Administrator	
Assigned to: adm.taqi@your-tenant.com
Scope: Whole tenant	
Why: Used in Task 4



