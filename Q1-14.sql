SELECT COUNT(DISTINCT city) AS distinct_city_count
FROM amazondb.amazon_sales;

SELECT DISTINCT branch, city
FROM amazondb.amazon_sales;

SELECT COUNT(DISTINCT product_line) AS distinct_product_line_count
FROM amazondb.amazon_sales;

SELECT payment_method, COUNT(*) AS frequency
FROM amazondb.amazon_sales
GROUP BY payment_method
ORDER BY frequency DESC
LIMIT 1;

SELECT product_line, SUM(total) AS total_sales
FROM amazondb.amazon_sales
GROUP BY product_line
ORDER BY total_sales DESC
LIMIT 1;

SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month, 
    SUM(total) AS total_revenue
FROM 
    amazondb.amazon_sales
GROUP BY 
    DATE_FORMAT(date, '%Y-%m')
ORDER BY 
    month;

SELECT 
    DATE_FORMAT(date, '%Y-%m') AS month, 
    SUM(cogs) AS total_cogs
FROM 
    amazondb.amazon_sales
GROUP BY 
    DATE_FORMAT(date, '%Y-%m')
ORDER BY 
    total_cogs DESC
LIMIT 1;


SELECT product_line, SUM(total) AS total_revenue
FROM amazondb.amazon_sales
GROUP BY product_line
ORDER BY total_revenue DESC
LIMIT 1;


SELECT city, SUM(total) AS total_revenue
FROM amazondb.amazon_sales
GROUP BY city
ORDER BY total_revenue DESC
LIMIT 1;


SELECT product_line, SUM(VAT) AS total_vat
FROM amazondb.amazon_sales
GROUP BY product_line
ORDER BY total_vat DESC
LIMIT 1;


SELECT 
    product_line, 
    total_sales,
    CASE 
        WHEN total_sales > (SELECT AVG(total_sales) 
                            FROM (
                                SELECT product_line, SUM(total) AS total_sales
                                FROM amazondb.amazon_sales
                                GROUP BY product_line
                            ) AS avg_subquery
                           ) THEN 'Good'
        ELSE 'Bad'
    END AS sales_performance
FROM (
    SELECT product_line, SUM(total) AS total_sales
    FROM amazondb.amazon_sales
    GROUP BY product_line
) AS total_sales_subquery;


SELECT 
    branch,
    total_quantity,
    CASE 
        WHEN total_quantity > (SELECT AVG(quantity)
                               FROM amazondb.amazon_sales) THEN 'Exceeded'
        ELSE 'Did not exceed'
    END AS sales_performance
FROM (
    SELECT branch, SUM(quantity) AS total_quantity
    FROM amazondb.amazon_sales
    GROUP BY branch
) AS total_quantity_subquery;


SELECT 
    gender, 
    product_line, 
    COUNT(*) AS frequency
FROM 
    amazondb.amazon_sales
GROUP BY 
    gender, 
    product_line
ORDER BY 
    gender, 
    frequency DESC;
    
    
SELECT 
    product_line, 
    AVG(rating) AS average_rating
FROM 
    amazondb.amazon_sales
GROUP BY 
    product_line;
