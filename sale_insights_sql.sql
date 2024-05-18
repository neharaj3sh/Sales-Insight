SELECT * FROM customers;

SELECT count(*) FROM customers;

SELECT * FROM transactions;

SELECT market_code, SUM(sales_amount) FROM transactions GROUP BY market_code;

SELECT market_code, SUM(sales_qty) FROM transactions GROUP BY market_code;

SELECT * from transactions where currency="USD";

SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date ;

SELECT market_code, month_name, SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date GROUP BY market_code, month_name;

SELECT market_code, year, SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date GROUP BY market_code, year;

SELECT year, SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date GROUP BY year;