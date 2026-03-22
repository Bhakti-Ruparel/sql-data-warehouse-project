/*
============================================================
Author      : Bhakti Ruparel
Environment : SQL Server Express
Database    : DataWarehouse
Version     : 1.0

Description :
    - Drops existing DataWarehouse database if present
    - Creates a new DataWarehouse database
    - Sets up layered architecture using schemas:
        bronze (raw), silver (processed), gold (analytics)

Notes :
    - Uses SINGLE_USER mode to force drop if connections exist
    - Intended for development/testing purposes

Created On  : 2026-03-22
============================================================
*/

USE master;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END
GO

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
