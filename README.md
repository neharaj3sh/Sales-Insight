# Sales Insight Project
This project aims to provide insights into sales performance using SQL for data extraction and viewing, and Power BI for data transformation and data visualization.

### Data Analysis using SQL
The following queries were used to draw insights.
1. Show all customer records

    `SELECT * FROM customers;`

1. Show total number of customers

    `SELECT count(*) FROM customers;`

1. Show all transaction records

    `SELECT * FROM transactions;`

1. Show total number of sales amount from each market

    `SELECT market_code, SUM(sales_amount) FROM transactions GROUP BY market_code;`

1. Show total number of sales quatity from each market

    `SELECT market_code, SUM(sales_qty) FROM transactions GROUP BY market_code;`

1. Show transaction records having currency as USD

    `SELECT * from transactions where currency="USD";`

1. Show transactions made by each market monthly

    `SELECT market_code, month_name, SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date GROUP BY market_code, month_name;`

1. Show transactions made by each market yearly

    `SELECT market_code, year, SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date GROUP BY market_code, year;`

1. Show revenue collected yearly

    `SELECT year, SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date GROUP BY year;`




### Data Analysis using Power BI
Following queries were used for data transformation
1. Removing -1/0 sales amount

    `= Table.SelectRows(sales_transactions, each ([sales_amount] <> -1 and [sales_amount] <> 0))`

1. Removing duplicate inr transactions

    `= Table.SelectRows(#"remove -1/0 sales amount", each ([currency] <> "INR"))`

1. Normalizing sales amount to inr

    `= Table.AddColumn(#"removing duplicate inr transactions", "normalized_sales_amount", each if [currency] = "USD" then [sales_amount]*83.3 else [sales_amount])`
