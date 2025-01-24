CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY,
    customer_id BIGINT,
    product_id BIGINT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    order_date DATE,
    store_id BIGINT
);

CREATE TABLE products (
    product_id BIGINT PRIMARY KEY,
    category_id BIGINT,
    product_name VARCHAR(200)
);

CREATE TABLE stores (
    store_id BIGINT PRIMARY KEY,
    region_id BIGINT,
    store_name VARCHAR(200)
);