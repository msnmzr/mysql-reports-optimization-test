-- Report 1: Monthly Sales by Region (Optimized)
SELECT 
    sales_year,
    sales_month,
    region_id,
    total_sales_amount,
    number_of_orders
FROM monthly_region_sales
WHERE (
        sales_year = YEAR(CURDATE())
        AND sales_month <= MONTH(CURDATE())
        AND (
            sales_year = YEAR(CURDATE()) -1
            AND sales_month >= MONTH(CURDATE())
        )
        OR sales_year < YEAR(CURDATE())
    );

    
-- Report 2: Top Categories by Store (Optimized)
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
WHERE BETWEEN DATE_SUB(CURDATE(), INTERVAL 3 MONTH) AND CURDATE()
GROUP BY o.store_id,
    p.category_id
ORDER BY o.store_id,
    category_rank;