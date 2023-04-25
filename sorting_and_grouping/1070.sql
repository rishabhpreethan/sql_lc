-- Write an SQL query that selects the product id, year, quantity, and price for the first year of every product sold.
-- Return the resulting table in any order.
-- The query result format is in the following example.


-- Example 1:

-- Input:

-- Sales table:
-- | sale_id | product_id | year | quantity | price |
-- |---------|------------|------|----------|-------| 
-- | 1       | 100        | 2008 | 10       | 5000  |
-- | 2       | 100        | 2009 | 12       | 5000  |
-- | 7       | 200        | 2011 | 15       | 9000  |

-- Product table:
-- | product_id | product_name |
-- |------------|--------------|
-- | 100        | Nokia        |
-- | 200        | Apple        |
-- | 300        | Samsung      |

-- Output: 
-- | product_id | first_year | quantity | price |
-- |------------|------------|----------|-------| 
-- | 100        | 2008       | 10       | 5000  |
-- | 200        | 2011       | 15       | 9000  |




select product_id, year as first_year,quantity, price
from sales
where(product_id, year)
in
(select product_id, min(year) as year
from sales
group by product_id);