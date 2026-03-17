-- Users Who Liked All Photos (Potential Bots)
-- Identifies users who have liked every photo on the platform, which is unusual behavior.
-- Useful for detecting potential bot accounts or spam-like activity.
SELECT
  u.username,
  COUNT(*) AS total_likes
FROM
  likes l
  JOIN users u ON u.id = l.user_id
GROUP BY
  u.id
HAVING
  total_likes = (
    SELECT
      COUNT(*)
    FROM
      photos
  );