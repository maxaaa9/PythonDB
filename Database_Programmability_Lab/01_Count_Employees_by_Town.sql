CREATE FUNCTION fn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT AS
$$
	DECLARE
		counter INT;
	BEGIN
		SELECT
		COUNT(*) INTO counter
			FROM employees as e
			JOIN addresses as a
				USING(address_id)
				JOIN towns as t
					USING(town_id)
		WHERE t.name = town_name;
	RETURN counter;
	END;
$$
LANGUAGE plpgsql;

SELECT fn_count_employees_by_town('Varna') AS "count"