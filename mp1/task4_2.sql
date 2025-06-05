CREATE TABLE country_city_count (
    country_name VARCHAR(100),
    country_code VARCHAR(10) PRIMARY KEY,
    num_cities INTEGER,
    FOREIGN KEY (country_code) REFERENCES Country(code)
);

INSERT INTO country_city_count (country_name, country_code, num_cities)
SELECT
    c.name AS country_name,
    c.code AS country_code,
    COUNT(ci.name) AS num_cities
FROM
    Country c
LEFT JOIN
    City ci ON c.code = ci.country_code
GROUP BY
    c.name, c.code;