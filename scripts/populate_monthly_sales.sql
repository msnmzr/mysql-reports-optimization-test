INSERT INTO monthly_region_sales (
        sales_year,
        sales_month,
        region_id,
        total_sales_amount,
        number_of_orders
    )
    SELECT 
        YEAR(o.order_date) AS sales_year,
        MONTH(o.order_date) AS sales_month,
        s.region_id,
        SUM(o.quantity * o.unit_price) AS total_sales_amount,
        COUNT(DISTINCT o.order_id) AS number_of_orders
    FROM orders o
        JOIN stores s ON o.store_id = s.store_id
    GROUP BY sales_year,
        sales_month,
        s.region_id 
    ON DUPLICATE KEY UPDATE 
        total_sales_amount = VALUES(total_sales_amount),
        number_of_orders = VALUES(number_of_orders);