WITH country_continent AS (
    SELECT
        e.country_code,
        en.continent,
        e.gdp,
        e.agriculture,
        e.industry,
        e.service
    FROM
        Economy e
    JOIN
        Encompasses en ON e.country_code = en.country_code
    WHERE
        en.percentage > 50 AND e.gdp IS NOT NULL
),
sector_data AS (
    SELECT
        country_code,
        continent,
        UNNEST(ARRAY['agriculture', 'industry', 'service']) AS sector,
        UNNEST(ARRAY[
            CASE WHEN agriculture IS NOT NULL THEN gdp * agriculture / 100 ELSE NULL END,
            CASE WHEN industry IS NOT NULL THEN gdp * industry / 100 ELSE NULL END,
            CASE WHEN service IS NOT NULL THEN gdp * service / 100 ELSE NULL END
        ]) AS sector_gdp
    FROM
        country_continent
    WHERE
        agriculture IS NOT NULL OR industry IS NOT NULL OR service IS NOT NULL
)
SELECT
    COALESCE(continent, 'All Continents') AS continent,
    COALESCE(sector, 'All Sectors') AS sector,
    SUM(sector_gdp) AS total_gdp
FROM
    sector_data
GROUP BY
    CUBE(continent, sector)
ORDER BY
    continent, sector;
