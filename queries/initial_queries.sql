-- Report 1: Monthly Sales by Region
SELECT 
    YEAR(o.order_date) AS sales_year,
    MONTH(o.order_date) AS sales_month,
    s.region_id,
    SUM(o.quantity * o.unit_price) AS total_sales_amount,
    COUNT(DISTINCT o.order_id) AS number_of_orders
FROM orders o
    JOIN stores s ON o.store_id = s.store_id
WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
    AND o.order_date <= CURDATE()
GROUP BY sales_year,
    sales_month,
    s.region_id
ORDER BY sales_year,
    sales_month,
    s.region_id;



-- Report 2: Top Categories by Store
SELECT 
    o.store_id,
    p.category_id,
    SUM(o.quantity * o.unit_price) AS total_sales_amount,
    RANK() OVER (
        PARTITION BY o.store_id
        ORDER BY SUM(o.quantity * o.unit_price) DESC
    ) AS category_rank
FROM orders o
    JOIN products p ON o.product_id = p.product_id
WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
    AND o.order_date <= CURDATE()
GROUP BY o.store_id,
    p.category_id
ORDER BY o.store_id,
    category_rank;