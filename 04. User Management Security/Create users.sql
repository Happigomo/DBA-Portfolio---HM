-- Create users (SQL Server, idempotent)
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'app_admin')
    CREATE LOGIN app_admin WITH PASSWORD = 'StrongP@ssw0rd!';

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'app_user')
    CREATE LOGIN app_user WITH PASSWORD = 'UserP@ssw0rd!';

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'app_admin')
    CREATE USER app_admin FOR LOGIN app_admin;

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'app_user')
    CREATE USER app_user FOR LOGIN app_user;