WITH quartile_data AS (
    SELECT
        name,
        area,
        NTILE(4) OVER (ORDER BY area) AS quartile
    FROM
        Country
    WHERE
        area IS NOT NULL
)
SELECT
    quartile,
    COUNT(*) AS num_countries,
    AVG(area) AS avg_area
FROM
    quartile_data
GROUP BY
    quartile
ORDER BY
    quartile;