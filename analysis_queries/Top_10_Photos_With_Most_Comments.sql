-- Top 10 Photos With Most Comments
-- Retrieves the 10 photos that have received the highest number of comments.
-- Useful to analyze the most engaging content and user interaction patterns.
SELECT
  p.id,
  p.image_url,
  COUNT(c.id) AS comments_count
FROM
  photos p
  LEFT JOIN comments c ON p.id = c.photo_id
GROUP BY
  p.id
ORDER BY
  comments_count DESC
LIMIT
  10;