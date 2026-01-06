-- Optimized query
-- Uses indexed columns for faster execution

SELECT 
    p.Product_Id,
    p.Product_Name,
    p.Price
FROM Products p
JOIN Categories c
    ON c.Category_Id = p.Category_Id
WHERE c.Category_Name = 'Electronics'
  AND p.Is_Active = 1;

