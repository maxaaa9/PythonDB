CREATE OR REPLACE FUNCTION udf_accounts_photos_count
							(account_username VARCHAR(30))
RETURNS INT
AS
$$
BEGIN
	RETURN (
			SELECT
					COUNT(*)
			FROM
					accounts_photos as ap
			JOIN
					accounts as a
			ON
					a.id = ap.account_id
			WHERE
					a.username = account_username
	);
END;
$$
LANGUAGE plpgsql