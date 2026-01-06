-- Audit trigger on Customer table
IF OBJECT_ID('dbo.Customer_Audit', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Customer_Audit (
        Audit_Id INT IDENTITY PRIMARY KEY,
        Customer_Id INT,
        Operation VARCHAR(10),
        Changed_By SYSNAME,
        Changed_At DATETIME DEFAULT GETDATE()
    );
END;
GO

IF OBJECT_ID('dbo.trg_customer_audit', 'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_customer_audit;
GO

CREATE TRIGGER dbo.trg_customer_audit
ON dbo.Customer
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    INSERT INTO dbo.Customer_Audit (Customer_Id, Operation, Changed_By)
    SELECT
        COALESCE(i.Customer_Id, d.Customer_Id),
        CASE
            WHEN i.Customer_Id IS NOT NULL AND d.Customer_Id IS NULL THEN 'INSERT'
            WHEN i.Customer_Id IS NOT NULL AND d.Customer_Id IS NOT NULL THEN 'UPDATE'
            WHEN i.Customer_Id IS NULL AND d.Customer_Id IS NOT NULL THEN 'DELETE'
        END,
        SYSTEM_USER
    FROM inserted i
    FULL OUTER JOIN deleted d
        ON i.Customer_Id = d.Customer_Id;
END;
GO