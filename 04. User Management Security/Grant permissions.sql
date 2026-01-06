-- Grant permissions and assign users to roles
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Customer TO db_app_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Orders TO db_app_user;

ALTER ROLE db_app_admin ADD MEMBER app_admin;
ALTER ROLE db_app_user ADD MEMBER app_user;