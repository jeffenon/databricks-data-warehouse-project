-- Defaults to data_warehouse.bronze
USE CATALOG data_warehouse;
USE SCHEMA bronze;

-- Creates new tables or replaces existing tables
CREATE OR REPLACE TABLE crm_customers (
    id INT,
    key VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    marital_status VARCHAR(50),
    gender VARCHAR(50),
    create_date DATE
) USING DELTA;

CREATE OR REPLACE TABLE crm_products (
    id INT,
    key VARCHAR(50),
    name VARCHAR(50),
    cost INT,
    line VARCHAR(50),
    start_date TIMESTAMP_NTZ,
    end_date TIMESTAMP_NTZ
) USING DELTA;

CREATE OR REPLACE TABLE crm_orders (
    order_number VARCHAR(50),
    product_key VARCHAR(50),
    customer_id INT,
    order_date INT,
    ship_date INT,
    due_date INT,
    sales INT,
    quantity INT,
    price INT
) USING DELTA;

CREATE OR REPLACE TABLE erp_customers (
    id VARCHAR(50),
    birthdate DATE,
    gender VARCHAR(50)
) USING DELTA;

CREATE OR REPLACE TABLE erp_locations (
    id VARCHAR(50),
    country VARCHAR(50)
) USING DELTA;

CREATE OR REPLACE TABLE erp_product_categories (
    id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    maintenance VARCHAR(50)
) USING DELTA;

-- Create or replace the volume
DROP VOLUME IF EXISTS data_warehouse.datasets;
CREATE VOLUME data_warehouse.datasets;

-- Insert data into the tables
COPY INTO crm_customers
FROM '/Volumes/data_warehouse/default/datasets/crm/customers.csv'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header'='true', 'inferSchema'='true');

COPY INTO crm_orders
FROM '/Volumes/data_warehouse/default/datasets/crm/sales.csv'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header'='true', 'inferSchema'='true');

COPY INTO crm_products
FROM '/Volumes/data_warehouse/default/datasets/crm/products.csv'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header'='true', 'inferSchema'='true');

COPY INTO erp_customers
FROM '/Volumes/data_warehouse/default/datasets/erp/customers.csv'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header'='true', 'inferSchema'='true');

COPY INTO erp_locations
FROM '/Volumes/data_warehouse/default/datasets/erp/locations.csv'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header'='true', 'inferSchema'='true');

COPY INTO erp_product_categories
FROM '/Volumes/data_warehouse/default/datasets/erp/product_categories.csv'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header'='true', 'inferSchema'='true');
