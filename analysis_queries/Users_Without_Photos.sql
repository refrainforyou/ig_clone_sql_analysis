-- Users Without Photos
-- Lists users who have not uploaded any photos.
-- Useful to detect inactive users or those with minimal engagement.
SELECT
  username,
  COALESCE(photos.id, 0) as photo_count
FROM
  users
  LEFT JOIN photos ON users.id = photos.user_id
WHERE
  photos.id IS NULL;