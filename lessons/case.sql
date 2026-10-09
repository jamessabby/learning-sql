/*
CASE Expression

Notes:
A CASE expression in SQL is a way to apply conditional logic within your SQL queries.

-- Example SQL query using a CASE statement
SELECT
    CASE
        WHEN column_name = 'Value1' THEN 'Description for Value1'
        WHEN column_name = 'Value2' THEN 'Description for Value2'
        ELSE 'Other'
    END AS column_description
FROM
    table_name;

- CASE  - begins the expression
- WHEN  - specifies the condition(s) to look at
- THEN  - what to do when the condition is TRUE
- ELSE  (optional) - provides output if none of the WHEN conditions are met
- END   - concludes the CASE expression
*/