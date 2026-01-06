-- Query Optimization

This folder demonstrates how SQL query performance can be improved using indexing
and query refactoring.

-- Files Included

- Slow query example.sql  
  Demonstrates a query performing full table scans.

- Indexes created.sql  
  Adds indexes to frequently filtered and joined columns.

- Optimized query.sql  
  Refactored query that benefits from the created indexes.

-- How to Run

1. Execute `Slow query example.sql`
2. Capture the execution plan (before)
3. Execute `Indexes created.sql`
4. Execute `Optimized query.sql`
5. Compare execution plans
