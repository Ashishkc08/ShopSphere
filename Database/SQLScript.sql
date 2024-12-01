-- Check if the database exists, and create it if it doesn't
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ShopSphereDB')
BEGIN
    CREATE DATABASE ShopSphereDB;
END
GO

-- Switch to the ShopSphereDB context
USE ShopSphereDB;
GO

-- Check if the Roles table exists, and create it if it doesn't
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Roles')
BEGIN
    CREATE TABLE Roles (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        RoleName NVARCHAR(50) NOT NULL UNIQUE
    );
END
GO

-- Insert roles if they do not already exist
IF NOT EXISTS (SELECT * FROM Roles WHERE RoleName = 'Admin')
BEGIN
    INSERT INTO Roles (RoleName) VALUES ('Admin');
END

IF NOT EXISTS (SELECT * FROM Roles WHERE RoleName = 'Customer')
BEGIN
    INSERT INTO Roles (RoleName) VALUES ('Customer');
END
GO
