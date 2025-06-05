WITH continent_shares AS (
    SELECT
        e.continent,
        c.area * e.percentage / 100 AS continent_area,
        c.population * e.percentage / 100 AS continent_population
    FROM
        Country c
    JOIN
        Encompasses e ON c.code = e.country_code
    WHERE
        c.area IS NOT NULL
        AND c.population IS NOT NULL
)
SELECT
    CASE WHEN GROUPING(continent) = 1 THEN 'World' ELSE continent END AS region,
    SUM(continent_area) AS total_area,
    SUM(continent_population) AS total_population
FROM
    continent_shares
GROUP BY
    GROUPING SETS (
        (continent),
        ()
    )
ORDER BY
    GROUPING(continent),
    region;
