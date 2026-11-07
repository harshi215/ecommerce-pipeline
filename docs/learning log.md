
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

## Day 3 :subqueries and NOT EXISTS practice
## Day 3: Subqueries (Nov 7)

- Scalar subquery: returns exactly one value. Runs once and is used by the outer query. Used in WHERE or SELECT. Error if it returns more than one row.
- Correlated subquery: refers to a column from the outer query, so it's run once per outer row. Use it to compare each row with its own group (e.g., each order vs its customer's average).
- EXISTS: returns true if the subquery finds at least one row. NOT EXISTS returns true if it finds none. It stops at the first match, so it's efficient.