CREATE OR REPLACE FUNCTION update_city_count_on_insert()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE country_city_count
    SET num_cities = num_cities + 1
    WHERE country_code = NEW.country_code;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER city_insert_trigger
AFTER INSERT ON City
FOR EACH ROW
EXECUTE FUNCTION update_city_count_on_insert();


CREATE OR REPLACE FUNCTION update_city_count_on_update()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.country_code <> NEW.country_code THEN
        UPDATE country_city_count
        SET num_cities = num_cities - 1
        WHERE country_code = OLD.country_code;

        UPDATE country_city_count
        SET num_cities = num_cities + 1
        WHERE country_code = NEW.country_code;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER city_update_trigger
AFTER UPDATE ON City
FOR EACH ROW
WHEN (OLD.country_code IS DISTINCT FROM NEW.country_code)
EXECUTE FUNCTION update_city_count_on_update();