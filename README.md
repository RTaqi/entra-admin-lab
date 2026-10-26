============================================================
Enatra Aadmin Lab
============================================================

Prerequisites
1. Updated Version of PowerShell

==== Operations ====
1. Creating User with the script
	-- Install Microsoft Graph PowerShell Modul
	-- Sign in to Tenant via Tenant Id.
	-- Create and run script.
	-- After Creating a user check whether users created or not.



==== Problem Faced During the Tasks ====
Problem
	-- While Sing in to Microsoft Graph, its shows like connection established with the tenant but on getting the details it shows empty Tenant Id, this cause issue in creating a user.

Solution
	-- Run Connect Command with your Tenant Id (Pass Tenant ID as a parameter in Connect Command)
=========================================


2. Cleaan up directory and Give it  Structure
	-- Start with Audit : Check for same Display Name and Missing department or jobtitle - no issues found their.
	-- Standardized the Department and Job Tile Like Sale Rep and Sales Representative = Sales Representative.

3. Create Department Groups and Add Members in group to grant permission at once to all user belongs to same Department.