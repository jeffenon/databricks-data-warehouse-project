-- Defaults to data_warehouse.bronze
USE CATALOG data_warehouse;
USE SCHEMA bronze;

-- Creates the tables
CREATE TABLE IF NOT EXISTS crm_customers (
    id INT,
    key VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    marital_status VARCHAR(50),
    gender VARCHAR(50),
    create_data DATE
);

CREATE TABLE IF NOT EXISTS crm_products (
    id INT,
    key VARCHAR(50),
    name VARCHAR(50),
    cost INT,
    line VARCHAR(50),
    start_date TIMESTAMP_NTZ,
    end_date TIMESTAMP_NTZ
);

CREATE TABLE IF NOT EXISTS crm_orders (
    order_number VARCHAR(50),
    product_key VARCHAR(50),
    customer_id INT,
    order_date INT,
    ship_date INT,
    due_date INT,
    sales INT,
    quantity INT,
    price INT
);

CREATE TABLE IF NOT EXISTS erp_customers (
    id VARCHAR(50),
    birthdate DATE,
    gender VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS erp_locations (
    id VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS erp_product_categories (
    id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    maintenance VARCHAR(50)
);
