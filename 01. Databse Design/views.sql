
-- =============================================
-- Views for E-commerce Database
-- =============================================
USE [E-commerce];
GO

-- =============================================
-- 1. Customer Order Summary View
-- =============================================
CREATE OR ALTER VIEW vw_CustomerOrders
AS
SELECT 
    c.Customer_Id,
    c.First_Name,
    c.Last_Name,
    c.Email,
    o.Order_Id,
    o.Order_date,
    o.Order_status,
    o.Total_amount
FROM Customer c
LEFT JOIN Orders o ON c.Customer_Id = o.Customer_Id;
GO

-- =============================================
-- 2. Order Details View
-- =============================================
CREATE OR ALTER VIEW vw_OrderDetails
AS
SELECT
    o.Order_Id,
    o.Order_date,
    o.Order_status,
    c.First_Name + ' ' + c.Last_Name AS Customer_Name,
    p.Product_Name,
    oi.Quantity,
    oi.Unit_price,
    oi.Line_total
FROM Orders o
JOIN Customer c ON o.Customer_Id = c.Customer_Id
JOIN Order_Items oi ON o.Order_Id = oi.Order_Id
JOIN Products p ON oi.Product_Id = p.Product_Id;
GO

-- =============================================
-- 3. Product Inventory Status View
-- =============================================
CREATE OR ALTER VIEW vw_ProductInventory
AS
SELECT
    p.Product_Id,
    p.Product_Name,
    p.Price,
    i.Quantity_available,
    i.Reorder_level,
    CASE 
        WHEN i.Quantity_available <= i.Reorder_level THEN 'REORDER'
        ELSE 'OK'
    END AS Stock_Status
FROM Products p
JOIN Inventory i ON p.Product_Id = i.Product_Id;
GO

-- =============================================
-- 4. Payments Overview View
-- =============================================
CREATE OR ALTER VIEW vw_Payments
AS
SELECT
    p.Payment_Id,
    p.Order_Id,
    p.Payment_date,
    p.Payment_method,
    p.Payment_status,
    p.Amount,
    o.Customer_Id
FROM Payments p
JOIN Orders o ON p.Order_Id = o.Order_Id;
GO

-- =============================================
-- 5. Shipment Tracking View
-- =============================================
CREATE OR ALTER VIEW vw_Shipments
AS
SELECT
    s.Shipment_Id,
    s.Order_Id,
    s.Shipping_provider,
    s.Tracking_number,
    s.Shipment_status,
    s.Shipping_date,
    s.Delivery_date,
    a.City,
    a.Province
FROM Shipments s
JOIN Addresses a ON s.Address_Id = a.Address_Id;
GO
