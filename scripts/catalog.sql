/*
Creates a catalog and the medallion schemas using SQL.
*/

-- Creates the catalog 'data_warehouse'
CREATE CATALOG IF NOT EXISTS data_warehouse;

-- Sets the default catalog to 'data_warehouse'
USE CATALOG data_warehouse;

-- Creates the medallion layer schemas
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;

-- Create or replace the volume
DROP VOLUME IF EXISTS data_warehouse.datasets;
CREATE VOLUME data_warehouse.datasets;

-- The files were uploaded via the UI.
