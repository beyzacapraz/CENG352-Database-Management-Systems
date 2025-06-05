SELECT
    e.continent,
    SUM(ec.gdp) AS total_gdp,
    SUM(ec.gdp * 1000000) / SUM(c.population) AS gdp_per_capita
FROM
    Economy ec
JOIN
    Country c ON ec.country_code = c.code
JOIN (
    SELECT DISTINCT ON (country_code)
        country_code,
        continent
    FROM
        Encompasses
    ORDER BY
        country_code, percentage DESC
) e ON ec.country_code = e.country_code
WHERE
    ec.gdp IS NOT NULL AND c.population IS NOT NULL AND c.population > 0
GROUP BY
    e.continent
ORDER BY
    gdp_per_capita DESC
LIMIT 3;
