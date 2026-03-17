-- Top 10 Users Who Comment The Most
-- Retrieves the 10 users who have written the most comments on the platform.
-- Useful to identify highly active users and community contributors.
SELECT
  u.username,
  COUNT(c.id) AS comments_count
FROM
  comments c
  JOIN users u ON c.user_id = u.id
GROUP BY
  u.id
ORDER BY
  comments_count DESC
LIMIT
  10;