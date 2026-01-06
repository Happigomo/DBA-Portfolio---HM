
-- =============================================
-- Stored Procedures for E-commerce Database
-- =============================================
USE [E-commerce];
GO

-- =============================================
-- 1. Create New Customer
-- =============================================
CREATE OR ALTER PROCEDURE sp_CreateCustomer
    @First_Name VARCHAR(50),
    @Last_Name VARCHAR(50),
    @Email VARCHAR(500),
    @Phone VARCHAR(20)
AS
BEGIN
    INSERT INTO Customer (Customer_Id, First_Name, Last_Name, Email, Phone, Is_active)
    VALUES (
        (SELECT ISNULL(MAX(Customer_Id),0)+1 FROM Customer),
        @First_Name, @Last_Name, @Email, @Phone, 1
    );
END;
GO

-- =============================================
-- 2. Place Order
-- =============================================
CREATE OR ALTER PROCEDURE sp_CreateOrder
    @Customer_Id INT,
    @Shipping_address_Id INT,
    @Total_amount DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Orders (Order_Id, Customer_Id, Order_status, Total_amount, Shipping_address_Id)
    VALUES (
        (SELECT ISNULL(MAX(Order_Id),0)+1 FROM Orders),
        @Customer_Id, 'PLACED', @Total_amount, @Shipping_address_Id
    );
END;
GO

-- =============================================
-- 3. Add Order Item
-- =============================================
CREATE OR ALTER PROCEDURE sp_AddOrderItem
    @Order_Id INT,
    @Product_Id INT,
    @Quantity INT,
    @Unit_price DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Order_Items
    (Order_Item_Id, Order_Id, Product_Id, Quantity, Unit_price, Line_total)
    VALUES (
        (SELECT ISNULL(MAX(Order_Item_Id),0)+1 FROM Order_Items),
        @Order_Id, @Product_Id, @Quantity, @Unit_price, @Quantity * @Unit_price
    );

    UPDATE Inventory
    SET Quantity_available = Quantity_available - @Quantity,
        Last_updated = GETDATE()
    WHERE Product_Id = @Product_Id;
END;
GO

-- =============================================
-- 4. Record Payment
-- =============================================
CREATE OR ALTER PROCEDURE sp_RecordPayment
    @Order_Id INT,
    @Payment_method VARCHAR(20),
    @Amount DECIMAL(10,2),
    @Transaction_reference VARCHAR(100)
AS
BEGIN
    INSERT INTO Payments
    (Payment_Id, Order_Id, Payment_method, Payment_status, Amount, Transaction_reference)
    VALUES (
        (SELECT ISNULL(MAX(Payment_Id),0)+1 FROM Payments),
        @Order_Id, @Payment_method, 'Completed', @Amount, @Transaction_reference
    );
END;
GO

-- =============================================
-- 5. Get Order Summary
-- =============================================
CREATE OR ALTER PROCEDURE sp_GetOrderSummary
    @Order_Id INT
AS
BEGIN
    SELECT 
        o.Order_Id,
        c.First_Name + ' ' + c.Last_Name AS Customer_Name,
        o.Order_status,
        o.Total_amount,
        p.Product_Name,
        oi.Quantity,
        oi.Line_total
    FROM Orders o
    JOIN Customer c ON o.Customer_Id = c.Customer_Id
    JOIN Order_Items oi ON o.Order_Id = oi.Order_Id
    JOIN Products p ON oi.Product_Id = p.Product_Id
    WHERE o.Order_Id = @Order_Id;
END;
GO
