# Write your MySQL query statement below
select query_name,
    ROUND(
        AVG(CAST(rating AS decimal) / position), 2
    ) AS quality,
    ROUND(
        SUM(
            CASE WHEN rating < 3
            THEN 1
            ELSE 0
            END
        ) * 100 / COUNT(*), 2
    ) AS poor_query_percentage
FROM queries
WHERE query_name IS NOT NULL
GROUP BY query_name;