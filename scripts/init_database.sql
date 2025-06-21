/*
=======================================================================
📦 Create Database and Schemas – Initialization Script
=======================================================================

🎯 Purpose:
    - Creates a new database named **DataWarehouse**
    - If the database already exists, it will be **dropped and recreated**
    - Creates three schemas within the database:
        • **bronze** – for raw/staged data
        • **silver** – for cleansed/transformed data
        • **gold** – for business-ready, reporting data

⚠️ WARNING:
    - This script will **permanently delete** the existing 'DataWarehouse' database.
    - All data will be lost if backups are not taken.
    - Use with extreme caution in development or production environments.

💡 Recommendation:
    - Ensure proper backups or versioned snapshots are taken before execution.
    - Use this script for clean initialization or during initial project setup.

=======================================================================
*/




-- Create database 'DataWarehouse'

USE master;
GO

-- Drop and recreate the 'DataWarehouseAnalytics' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas

CREATE SCHEMA bronze;
Go
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
