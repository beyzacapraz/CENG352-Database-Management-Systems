WITH city_with_avg AS (
    SELECT
        name,
        country_code,
        population,
        AVG(population) OVER (PARTITION BY country_code) AS avg_population
    FROM
        City
)
SELECT
    name AS city_name,
    country_code,
    population,
    avg_population
FROM
    city_with_avg
WHERE
    population > 0.5 * avg_population
ORDER BY
    city_name DESC;
