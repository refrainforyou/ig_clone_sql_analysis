-- Top 10 Most Liked Photos
-- Retrieves the 10 photos with the highest number of likes along with their authors.
-- Useful for analyzing most engaging content and top-performing users.
SELECT
  u.username,
  l.photo_id,
  p.image_url,
  COUNT(*) AS total
FROM
  photos p
  JOIN likes l ON l.photo_id = p.id
  JOIN users u ON p.user_id = u.id
GROUP BY
  l.photo_id,
  u.username,
  p.image_url
ORDER BY
  total DESC
LIMIT
  10;