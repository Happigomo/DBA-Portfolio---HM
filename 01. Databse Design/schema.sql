-- E-commerce Database Schema

USE [E-commerce];

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(500) NOT NULL UNIQUE,
    Phone VARCHAR(20) NOT NULL,
    Created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Is_active BIT NOT NULL
);

CREATE TABLE Addresses (
    Address_Id INT PRIMARY KEY,
    Customer_Id INT NOT NULL,
    Address_Type VARCHAR(50),
    Street VARCHAR(100),
    City VARCHAR(50),
    Postal_Code VARCHAR(10),
    Province VARCHAR(50),
    Created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id)
);

CREATE TABLE Categories (
    Category_Id INT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL,
    Parent_Category_Id INT,
    Created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Parent_Category_Id) REFERENCES Categories(Category_Id)
);

CREATE TABLE Products (
    Product_Id INT PRIMARY KEY,
    Category_Id INT NOT NULL,
    Product_Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Price DECIMAL(10,2) NOT NULL,
    Is_active BIT NOT NULL,
    Created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Category_Id) REFERENCES Categories(Category_Id)
);

CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_Id INT NOT NULL,
    Order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Order_status VARCHAR(20),
    Total_amount DECIMAL(10,2),
    Shipping_address_Id INT,
    Created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Shipping_address_Id) REFERENCES Addresses(Address_Id)
);

CREATE TABLE Order_Items (
    Order_Item_Id INT PRIMARY KEY,
    Order_Id INT NOT NULL,
    Product_Id INT NOT NULL,
    Quantity INT NOT NULL,
    Unit_price DECIMAL(10,2) NOT NULL,
    Line_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id),
    FOREIGN KEY (Product_Id) REFERENCES Products(Product_Id)
);

CREATE TABLE Payments (
    Payment_Id INT PRIMARY KEY,
    Order_Id INT NOT NULL,
    Payment_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Payment_method VARCHAR(20),
    Payment_status VARCHAR(20),
    Amount DECIMAL(10,2) NOT NULL,
    Transaction_reference VARCHAR(100) NOT NULL UNIQUE,
    FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id)
);

CREATE TABLE Shipments (
    Shipment_Id INT PRIMARY KEY,
    Order_Id INT NOT NULL,
    Address_Id INT NOT NULL,
    Shipping_provider VARCHAR(50),
    Tracking_number VARCHAR(50) NOT NULL UNIQUE,
    Shipping_date DATETIME,
    Delivery_date DATETIME,
    Shipment_status VARCHAR(20),
    FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id),
    FOREIGN KEY (Address_Id) REFERENCES Addresses(Address_Id)
);

CREATE TABLE Inventory (
    Inventory_Id INT PRIMARY KEY,
    Product_Id INT NOT NULL,
    Quantity_available INT NOT NULL,
    Reorder_level INT NOT NULL,
    Last_updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Product_Id) REFERENCES Products(Product_Id)
);

CREATE TABLE Inventory_Movement (
    Movement_Id INT PRIMARY KEY,
    Product_Id INT NOT NULL,
    Movement_type VARCHAR(20) NOT NULL,
    Quantity INT NOT NULL,
    Movement_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Reference_Id INT,
    FOREIGN KEY (Product_Id) REFERENCES Products(Product_Id)
);
