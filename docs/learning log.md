
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

## Day 4: Joins

- An INNER JOIN keeps only rows that have a match in both tables. A row with no match is dropped.
- A LEFT JOIN keeps every row from the left table. If the right table has no match, the right-side columns show NULL.
- The ON clause says which columns must match between the two tables.
- To find rows with no partner in another table, use a LEFT JOIN and filter for NULL with IS NULL.
- A condition that compares to NULL needs IS NULL, because = NULL never matches anything.

## Day 5: RIGHT, FULL, and self joins

- A RIGHT JOIN keeps every row from the right table. It works the same as a LEFT JOIN with the tables swapped, so I can always write it as a LEFT JOIN.
- A FULL OUTER JOIN keeps rows from both tables. Where one side has no match, that side shows NULL.
- A self join joins a table to itself. I give each copy a different alias, such as s1 and s2.
- In a self join, s1.id < s2.id stops a row from matching itself and removes duplicate pairs.

## Day 6: GROUP BY, HAVING, and window review

- GROUP BY collapses rows into one row per group. Every selected column must be in the GROUP BY or inside an aggregate like SUM or COUNT.
- WHERE filters rows before grouping. HAVING filters groups after aggregation, so I use HAVING for conditions like COUNT(*) > 100.
- A window function keeps every row. GROUP BY collapses them.
- I can't filter a window function directly in WHERE, so I put it in a CTE first, then filter in the outer query.
