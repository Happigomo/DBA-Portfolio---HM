-- Drop index if it exists
IF EXISTS (
    SELECT 1
    FROM sys.indexes
    WHERE name = 'idx_customer_email'
      AND object_id = OBJECT_ID('dbo.Customer')
)
BEGIN
    DROP INDEX idx_customer_email ON dbo.Customer;
END;
GO

-- Drop statistics if they exist
IF EXISTS (
    SELECT 1
    FROM sys.stats
    WHERE name = 'idx_customer_email'
      AND object_id = OBJECT_ID('dbo.Customer')
)
BEGIN
    DROP STATISTICS dbo.Customer.idx_customer_email;
END;
GO

-- Create index
CREATE INDEX idx_customer_email
ON dbo.Customer (Email);
GO
