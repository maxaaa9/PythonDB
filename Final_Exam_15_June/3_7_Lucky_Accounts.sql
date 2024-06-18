SELECT
	CONCAT(a.id, ' ', a.username) AS id_username,
	a.email AS email
FROM
	accounts AS a
	JOIN accounts_photos as ap
	ON a.id = ap.account_id
WHERE ap.account_id = ap.photo_id
ORDER BY
	a.id