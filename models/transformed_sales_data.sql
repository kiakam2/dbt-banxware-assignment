{{ config(materialized='table') }}


SELECT
    order_id,
    customer_id,
    product_id,
    product_name,
    order_status,
    
    -- fetch year, month, and day from order_date
    EXTRACT(year FROM order_date) AS order_year,
    EXTRACT(month FROM order_date) AS order_month,
    EXTRACT(day FROM order_date) AS order_day,
    
    -- calculate total sales
    quantity * price AS total_sales_amount
FROM {{ source('my_raw_sales_data', 'RAW_SALES_DATA') }}