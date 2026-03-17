-- Engagement Score per Photo
-- Calculates total engagement for each photo by summing distinct likes and comments.
-- Useful to identify the most engaging content and evaluate user interaction patterns.
SELECT
  p.id,
  p.image_url,
  COUNT(DISTINCT l.user_id) AS likes,
  COUNT(DISTINCT c.id) AS comments,
  COUNT(DISTINCT l.user_id) + COUNT(DISTINCT c.id) AS engagement
FROM
  photos p
  LEFT JOIN likes l ON p.id = l.photo_id
  LEFT JOIN comments c ON p.id = c.photo_id
GROUP BY
  p.id
ORDER BY
  engagement DESC;