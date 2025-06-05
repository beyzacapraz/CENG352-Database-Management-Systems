CREATE VIEW country_statistics AS
SELECT
    co.name AS country_name,
        (SELECT ci.name
         FROM City ci
         WHERE ci.country_code = co.code
         ORDER BY ci.population DESC
         LIMIT 1) AS biggest_city,
        (SELECT ci.name
         FROM City ci
         WHERE ci.country_code = co.code
         ORDER BY ci.elevation DESC
         LIMIT 1) AS highest_elevation,
    CASE
        WHEN co.area > 0 THEN co.population / co.area
        ELSE NULL
    END AS density
FROM
    Country co;
