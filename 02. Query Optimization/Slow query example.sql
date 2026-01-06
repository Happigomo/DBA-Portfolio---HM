-- Slow query example (no index)
-- Demonstrates a full table scan

SELECT *
FROM Products p
WHERE p.Category_Id IN (
    SELECT c.Category_Id
    FROM Categories c
    WHERE LOWER(c.Category_Name) = 'electronics'
)
AND p.Is_Active = 1;

