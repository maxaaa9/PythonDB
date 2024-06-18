SELECT
	p."id" AS photo_id,
	p.capture_date,
	p.description,
	COUNT(c.id) AS comments_count
FROM
	comments as c
	JOIN photos as p
	ON p.id = c.photo_id
WHERE
	description IS NOT NULL
GROUP BY
	p.id
ORDER BY
	comments_count DESC,
	photo_id
LIMIT 3