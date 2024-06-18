CREATE TABLE deleted_employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    middle_name VARCHAR(20),
    job_title VARCHAR(50),
    department_id INTEGER,
    salary NUMERIC(19,4)
);


CREATE FUNCTION log_items()
RETURNS TRIGGER
AS
    $$
        BEGIN
            INSERT INTO deleted_employees(
                                          first_name,
                                          last_name,
                                          middle_name,
                                          job_title,
                                          department_id,
                                          salary)
            VALUES (
                    old.first_name,
                    old.last_name,
                    old.middle_name,
                    old.job_title,
                    old.department_id,
                    old.salary);
            RETURN new;
        end;
    $$
LANGUAGE plpgsql;


CREATE TRIGGER deleted_employees_trigger
AFTER DELETE on employees
    FOR EACH ROW
EXECUTE PROCEDURE log_items();