-- Create database roles
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'db_app_admin')
    CREATE ROLE db_app_admin;

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'db_app_user')
    CREATE ROLE db_app_user;