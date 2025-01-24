# MySQL Reports Optimization Test Solution

This is my solution for the MySQL Reports Developer Test. The task was all about speeding up some slow sales reports. I had to work on a "Monthly Sales by Region" report and a "Top Categories by Store" report. The initial queries were pretty straight forward, so I've updated the database and the queries to make them faster.

The original, straightforward queries can be found in `queries/initial_queries.sql`.


**Why were they slow?**

*   **No indexes on `orders`:** The `orders` table is huge, and without indexes, filtering was taking forever.
*   **Too much calculation:** The first query had to get all data every time, which was slowing things down.


## Making things faster

Here's what I did to speed things up:

### 1. Added some key indexes

I added indexes on columns used in joins and where clauses.  See `schema/schema_modifications.sql` for the specific commands.

*   These indexes help MySQL quickly find the data, instead of scanning the entire table each time. Think of it like having an index in a book.

### 2. Created a monthly sales summary table

To speed up the monthly sales report, I created a table to store pre-calculated monthly data.  See `schema/schema_modifications.sql` for the specific command.

*   A script (`scripts/populate_monthly_sales.sql`) updates this table daily, so the report can grab pre-calculated totals instead of recomputing them.

## The Optimized Queries - Much Faster!

The optimized queries can be found in `queries/optimized_queries.sql`.

*   The first query is now super quick since it's just reading from the summary table.
*   The second query is much better thanks to the indexes!

## Things to Keep in Mind

*   The monthly sales summary table (`monthly_region_sales`) needs to be updated daily using the `scripts/populate_monthly_sales.sql` script.
*   The queries are made for MySQL 8.0.
*   You can test the queries out after setting up MySQL with the schema and the data.

## Future Proofing

*   The summary table approach works well even if the data gets way bigger.
*   Indexes keep the queries fast no matter how much data we throw at it.

## How to Run This

1.  **Get MySQL:** Make sure you have MySQL 8.0+ installed and running.
2.  **Create DB:** Create a new database where you'll import the schema.
3.  **Import:** Run the SQL scripts in the `schema` folder to set up the database.
4.  **Sample Data** Run the script in `schema/sample_data.sql` to populate sample data
5.  **Run queries:** Try the queries in the `queries` folder.
6.  **Populate Monthly Data:** Run `scripts/populate_monthly_sales.sql` to populate the monthly data.

## That's all
