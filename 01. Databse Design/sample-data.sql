USE [E-commerce];

-- ======================
-- Customer
-- ======================
INSERT INTO Customer 
(Customer_Id, First_Name, Last_Name, Email, Phone, Created_at, Updated_at, Is_active)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '0710000001', '2022-01-10', '2023-05-01', 1),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '0710000002', '2022-02-15', '2023-06-10', 1),
(3, 'Michael', 'Brown', 'michael.brown@email.com', '0710000003', '2021-11-20', '2022-12-01', 0),
(4, 'Emily', 'Davis', 'emily.davis@email.com', '0710000004', '2023-01-05', '2023-07-18', 1),
(5, 'David', 'Wilson', 'david.wilson@email.com', '0710000005', '2020-09-12', '2022-03-09', 0),
(6, 'Sarah', 'Mokoena', 'sarah.mokoena@email.com', '0710000006', '2023-03-21', '2023-08-01', 1),
(7, 'Thabo', 'Nkosi', 'thabo.nkosi@email.com', '0710000007', '2022-06-30', '2023-04-12', 1),
(8, 'Lerato', 'Kgosi', 'lerato.kgosi@email.com', '0710000008', '2021-04-17', '2022-08-22', 0),
(9, 'Peter', 'Johnson', 'peter.johnson@email.com', '0710000009', '2023-02-11', '2023-09-03', 1),
(10,'Nomsa', 'Dlamini', 'nomsa.dlamini@email.com', '0710000010', '2022-12-01', '2023-10-10', 1);



-- ======================
-- Addresses
-- ======================
INSERT INTO Addresses (Address_Id, Customer_Id, Address_Type, Street, City, Postal_Code, Province)
VALUES
(1, 1, 'Billing', '12 Oak Street', 'Pretoria', 0002, 'Gauteng'),
(2, 1, 'Shipping', '45 Pine Road', 'Pretoria', 0002, 'Gauteng'),
(3, 2, 'Shipping', '89 Main Street', 'Johannesburg', 2001, 'Gauteng'),
(4, 3, 'Billing', '7 Sunset Ave', 'Polokwane', 0700, 'Limpopo'),
(5, 4, 'Shipping', '102 Lake View', 'Cape Town', 8001, 'Western Cape'),
(6, 6, 'Shipping', '55 Freedom Drive', 'Soweto', 1804, 'Gauteng'),
(7, 7, 'Billing', '18 Market Road', 'Durban', 4001, 'KwaZulu-Natal'),
(8, 9, 'Shipping', '77 Ocean Lane', 'Port Elizabeth', 6001, 'Eastern Cape');

-- ======================
-- Categories
-- ======================
INSERT INTO Categories
(Category_Id, Category_Name, Parent_Category_Id)
VALUES
(1, 'Electronics', NULL),
(2, 'Home Appliances', NULL),
(3, 'Fashion', NULL),
(4, 'Office', NULL);

-- ======================
-- Products
-- ======================
INSERT INTO Products
(Product_Id, Category_Id, Product_Name, Description, Price, Is_active)
VALUES
(1, 1, 'Laptop Pro 15"', 'High-performance business laptop', 18500.00, 1),
(2, 1, 'Wireless Mouse', 'Ergonomic wireless mouse', 450.00, 1),
(3, 2, 'Microwave Oven', '800W countertop microwave', 2200.00, 1),
(4, 3, 'Leather Jacket', 'Genuine leather jacket', 1750.00, 1),
(5, 4, 'Office Chair', 'Adjustable ergonomic chair', 3100.00, 1),
(6, 1, 'Smartphone X', '5G Android smartphone', 14500.00, 1),
(7, 4, 'Desk Lamp', 'LED desk lamp with dimmer', 650.00, 1);

-- ======================
-- Inventory
-- ======================
INSERT INTO Inventory
(Inventory_Id, Product_Id, Quantity_available, Reorder_level)
VALUES
(1, 1, 12, 5),
(2, 2, 150, 30),
(3, 3, 25, 10),
(4, 4, 8, 5),
(5, 5, 6, 3),
(6, 6, 18, 7),
(7, 7, 40, 15);

-- ======================
-- Orders
-- ======================
INSERT INTO Orders 
(Order_Id, Customer_Id, Order_Date, Total_Amount, Order_status)
VALUES
(101, 1, '2023-01-15', 1200.00, 'Completed'),
(102, 1, '2023-03-22', 450.00, 'Completed'),
(103, 2, '2023-02-10', 2200.00, 'Completed'),
(104, 2, '2023-07-19', 300.00, 'Cancelled'),
(105, 3, '2022-06-05', 1500.00, 'Completed'),
(106, 4, '2023-08-01', 980.00, 'Pending'),
(107, 4, '2023-08-10', 1750.00, 'Completed'),
(108, 5, '2021-12-25', 500.00, 'Completed'),
(109, 6, '2023-04-12', 2600.00, 'Completed'),
(110, 6, '2023-05-30', 800.00, 'Completed'),
(111, 7, '2022-09-18', 1300.00, 'Completed'),
(112, 7, '2023-01-02', 400.00, 'Pending'),
(113, 8, '2021-05-10', 950.00, 'Completed'),
(114, 9, '2023-06-14', 3100.00, 'Completed'),
(115, 9, '2023-09-01', 150.00, 'Cancelled'),
(116,10, '2023-03-08', 2100.00, 'Completed'),
(117,10, '2023-10-05', 700.00, 'Pending');


-- ======================
-- Order Items
-- ======================
INSERT INTO Order_Items
(Order_Item_Id, Order_Id, Product_Id, Quantity, Unit_price, Line_total)
VALUES
(1, 101, 2, 2, 450.00, 900.00),
(2, 101, 7, 1, 650.00, 650.00),
(3, 102, 4, 1, 1750.00, 1750.00),
(4, 103, 1, 1, 18500.00, 18500.00),
(5, 106, 3, 1, 2200.00, 2200.00),
(6, 107, 5, 1, 3100.00, 3100.00),
(7, 109, 6, 1, 14500.00, 14500.00),
(8, 110, 2, 3, 450.00, 1350.00),
(9, 114, 1, 1, 18500.00, 18500.00),
(10, 116, 6, 1, 14500.00, 14500.00),
(11, 117, 7, 2, 650.00, 1300.00);

-- ======================
-- Payments
-- ======================
INSERT INTO Payments
(Payment_Id, Order_Id, Payment_Date, Amount, Payment_Method, Payment_status, Transaction_Reference)
VALUES
(1, 101, '2023-01-15', 1550.00, 'Card', 'Success', 'TXN-20230115-0001'),
(2, 102, '2023-03-22', 1750.00, 'EFT', 'Success', 'TXN-20230322-0002'),
(3, 103, '2023-02-10', 18500.00, 'Card', 'Success', 'TXN-20230210-0003'),
(4, 104, '2023-07-19', 450.00, 'Card', 'Failed',  'TXN-20230719-0004'),
(5, 107, '2023-08-10', 3100.00, 'EFT', 'Success', 'TXN-20230810-0005'),
(6, 109, '2023-04-12', 14500.00, 'Card', 'Success', 'TXN-20230412-0006'),
(7, 114, '2023-06-14', 18500.00, 'Card', 'Success', 'TXN-20230614-0007'),
(8, 117, '2023-10-05', 1300.00, 'EFT', 'Pending', 'TXN-20231005-0008');

-- ======================
-- Shipments
-- ======================
INSERT INTO Shipments
(Shipment_Id, Order_Id, Address_Id, Shipping_provider, Tracking_number, Shipping_date, Delivery_date, Shipment_Status)
VALUES
(1, 101, 2, 'DHL',    'DHL-PTA-20230116-001', '2023-01-16', '2023-01-18', 'Delivered'),
(2, 102, 2, 'FedEx',  'FDX-JHB-20230323-002', '2023-03-23', '2023-03-26', 'Delivered'),
(3, 106, 5, 'Aramex', 'ARM-CT-20230802-003', '2023-08-02', NULL,         'In Transit'),
(4, 107, 5, 'DHL',    'DHL-CT-20230811-004', '2023-08-11', '2023-08-14', 'Delivered'),
(5, 114, 8, 'FedEx',  'FDX-EC-20230615-005', '2023-06-15', '2023-06-19', 'Delivered'),
(6, 117, 5, 'Aramex', 'ARM-CT-20231006-006', '2023-10-06', NULL,         'Pending');

-- ======================
-- Inventory Movement
-- ======================
INSERT INTO Inventory_Movement
(Movement_Id, Product_Id, Movement_Type, Quantity, Movement_Date, Reference_Id)
VALUES
(1, 2, 'OUT', 2, '2023-01-15', 'Order 101'),
(2, 7, 'OUT', 1, '2023-01-15', 'Order 101'),
(3, 4, 'OUT', 1, '2023-03-22', 'Order 102'),
(4, 1, 'OUT', 1, '2023-02-10', 'Order 103'),
(5, 6, 'OUT', 1, '2023-04-12', 'Order 109'),
(6, 2, 'OUT', 3, '2023-05-30', 'Order 110'),
(7, 1, 'IN', 5, '2023-07-01', 'Supplier Restock'),
(8, 5, 'IN', 3, '2023-07-15', 'Supplier Restock');
