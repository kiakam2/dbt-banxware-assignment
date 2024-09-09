
  
    

        create or replace transient table home_assignments.PUBLIC.transformed_sales_data
         as
        (


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
FROM home_assignments.PUBLIC.RAW_SALES_DATA
        );
      
  