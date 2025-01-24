ALTER TABLE orders
ADD INDEX idx_store_order_date (store_id, order_date),
ADD INDEX idx_product_id (product_id);

ALTER TABLE products
ADD INDEX idx_product_category (product_id, category_id);

ALTER TABLE stores
ADD INDEX idx_store_id (store_id),
ADD INDEX idx_region_id (region_id);


CREATE TABLE monthly_region_sales (
    sales_year INT,
    sales_month INT,
    region_id BIGINT,
    total_sales_amount DECIMAL(20, 2),
    number_of_orders INT,
    PRIMARY KEY (sales_year, sales_month, region_id),
    INDEX idx_sales_region_period (region_id, sales_year, sales_month)
);