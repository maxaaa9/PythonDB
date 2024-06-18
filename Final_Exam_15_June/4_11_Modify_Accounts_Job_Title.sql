CREATE OR REPLACE PROCEDURE udp_modify_account(address_street VARCHAR(30),
												address_town VARCHAR(30))
AS
$$
BEGIN
	UPDATE accounts
		SET job_title = CONCAT('(Remote) ', job_title)
	WHERE "id" in (
					SELECT ac.id
					FROM accounts as ac
					JOIN addresses as ad
					ON ac.id = ad.account_id
					WHERE ad.street = address_street
							AND
							ad.town = address_town
	);
END;
$$
LANGUAGE plpgsql