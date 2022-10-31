SELECT * from sales.customers;
SELECT * from sales.date;
SELECT * from sales.markets;
SELECT * from sales.products;
SELECT * from sales.transactions;

-- Total number of customers 
SELECT count(*) FROM sales.customers;

-- Select all sales transactions at Chennai
SELECT * FROM sales.transactions WHERE market_code = 'MARK001';

-- Distinct product_code of products sold at Chennai
SELECT distinct sales.products.product_code FROM sales.products INNER JOIN sales.transactions ON sales.products.product_code = sales.transactions.product_code WHERE sales.transactions.market_code = 'Mark001';

-- Transaction where Currency is USD
SELECT * FROM sales.transactions WHERE currency = 'USD';

-- All the transactions that took place in 2020
SELECT sales.transactions.*, sales.date.year FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date WHERE sales.date.year = '2020';

-- Total Revenue in 2020
SELECT SUM(sales.transactions.sales_amount) AS Total_Revenue, sales.date.year FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date WHERE sales.date.year = '2020' and sales.transactions.currency = 'INR\r' or sales.transactions.currency = 'USD\r';

-- Total Revenue in January 2020
SELECT SUM(sales.transactions.sales_amount) AS Total_Revenue, sales.date.year FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date WHERE sales.date.year = '2020' and sales.date.month_name = 'January' and (sales.transactions.currency = 'INR\r' or sales.transactions.currency = 'USD\r');

-- Total Revenue in Chennai in 2020
SELECT SUM(sales.transactions.sales_amount) AS Total_Revenue, sales.date.year FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date WHERE sales.date.year = '2020' and sales.transactions.market_code = 'Mark001';
