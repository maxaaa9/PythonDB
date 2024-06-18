SELECT
	p.id AS photo_id,
	COUNT(DISTINCT l.id) AS likes_count,
	COUNT(DISTINCT c.id) AS comments_count
FROM
	photos AS p
		LEFT JOIN likes as l
			ON p.id = l.photo_id
				LEFT JOIN comments as c
					ON c.photo_id = p.id
GROUP BY
	p.id
ORDER BY
	likes_count DESC,
	comments_count DESC,
	photo_id