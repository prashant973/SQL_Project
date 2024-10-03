SELECT 
    DAYNAME(time) AS weekday,
    HOUR(time) AS hour_of_day,
    COUNT(*) AS sales_occurrences
FROM 
    amazondb.amazon_sales
GROUP BY 
    weekday,
    hour_of_day
ORDER BY 
    FIELD(weekday, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
    hour_of_day;
    
    
SELECT customer_type, SUM(total) AS total_revenue
FROM amazondb.amazon_sales
GROUP BY customer_type
ORDER BY total_revenue DESC
LIMIT 1;


SELECT 
    city, 
    SUM(VAT) AS total_VAT, 
    SUM(total) AS total_sales,
    SUM(VAT) / SUM(total) * 100 AS VAT_percentage
FROM 
    amazondb.amazon_sales
GROUP BY 
    city
ORDER BY 
    VAT_percentage DESC
LIMIT 1;


SELECT 
    customer_type, 
    SUM(VAT) AS total_VAT_payments
FROM 
    amazondb.amazon_sales
GROUP BY 
    customer_type
ORDER BY 
    total_VAT_payments DESC
LIMIT 1;


SELECT COUNT(DISTINCT customer_type) AS distinct_customer_types
FROM amazondb.amazon_sales;


SELECT COUNT(DISTINCT payment_method) AS distinct_payment_methods
FROM amazondb.amazon_sales;


SELECT 
    customer_type, 
    COUNT(*) AS frequency
FROM 
    amazondb.amazon_sales
GROUP BY 
    customer_type
ORDER BY 
    frequency DESC
LIMIT 1;


SELECT 
    customer_type, 
    COUNT(*) AS purchase_frequency
FROM 
    amazondb.amazon_sales
GROUP BY 
    customer_type
ORDER BY 
    purchase_frequency DESC
LIMIT 1;


SELECT 
    gender, 
    COUNT(*) AS frequency
FROM 
    amazondb.amazon_sales
GROUP BY 
    gender
ORDER BY 
    frequency DESC
LIMIT 1;


SELECT 
    branch,
    gender,
    COUNT(*) AS frequency
FROM 
    amazondb.amazon_sales
GROUP BY 
    branch, gender
ORDER BY 
    branch, frequency DESC;
    
    
SELECT 
    HOUR(time) AS hour_of_day,
    COUNT(*) AS rating_count
FROM 
    amazondb.amazon_sales
GROUP BY 
    hour_of_day
ORDER BY 
    rating_count DESC
LIMIT 1;


SELECT 
    branch,
    HOUR(time) AS hour_of_day,
    COUNT(*) AS rating_count
FROM 
    amazondb.amazon_sales
GROUP BY 
    branch, hour_of_day
ORDER BY 
    branch, rating_count DESC;
    
    
SELECT 
    DAYNAME(date) AS day_of_week,
    AVG(rating) AS average_rating
FROM 
    amazondb.amazon_sales
GROUP BY 
    day_of_week
ORDER BY 
    average_rating DESC
LIMIT 1;


SELECT 
    branch,
    DAYNAME(date) AS day_of_week,
    AVG(rating) AS average_rating
FROM 
    amazondb.amazon_sales
GROUP BY 
    branch, day_of_week
ORDER BY 
    branch, average_rating DESC;
