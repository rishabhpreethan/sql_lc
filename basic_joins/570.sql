-- Write an SQL query to report the managers with at least five direct reports.
-- Return the result table in any order.
-- The query result format is in the following example.


-- Example 1:

-- Input:

-- Employee table:
-- | id  | name  | department | managerId |
-- |-----|-------|------------|-----------|
-- | 101 | John  | A          | None      |
-- | 102 | Dan   | A          | 101       |
-- | 103 | James | A          | 101       |
-- | 104 | Amy   | A          | 101       |
-- | 105 | Anne  | A          | 101       |
-- | 106 | Ron   | B          | 101       |

-- Output: 
-- | name |
-- |------|
-- | John |



select distinct g.name as name
from employee e join employee g
on g.id=e.managerid
group by g.id
having count(*)>=5;