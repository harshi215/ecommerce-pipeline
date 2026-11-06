
# Learning Log

## Day 1: Window functions

- GROUP BY combines rows into one row per group. A window function keeps every row and adds a calculated value next to it.
- PARTITION BY splits the rows into groups, like GROUP BY, but without collapsing them.
- ORDER BY inside OVER sets the order within each group. ROW_NUMBER() and running totals depend on it.
- ROW_NUMBER() numbers each row inside its group, starting from 1.
- RANK,DENSE RANK: window function assigns sequential numbers to the rows within each partition, in the order defined by the ORDER BY clause
---- window functions are permitted only on SELECT and ORDER BY and also use SUM,AVG,COUNT

## Day 2: CTE 
- A CTE is a named temporary result, defined with WITH at the top of a query.
- Each step has a name and the query inside brackets. Steps are separated by commas.
- A later step can use an earlier step's name, so a long query can be built in parts.
- The final SELECT after the last step produces the output.
- I'd use a CTE when a query is hard to read in one piece, or when I need the same intermediate result twice.