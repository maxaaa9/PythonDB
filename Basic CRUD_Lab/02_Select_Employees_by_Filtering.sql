SELECT
	id,
	concat_ws(' ', first_name, last_name) AS "full name",
	job_title AS "Job Title",
	salary
FROM employees
WHERE salary > 1000.00
ORDER BY id;