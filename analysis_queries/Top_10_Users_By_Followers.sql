-- Top 10 Users By Followers
-- Retrieves the 10 users with the highest number of followers on the platform.
-- Useful to identify top influencers and most popular accounts.
SELECT
  u.username,
  COUNT(f.follower_id) AS followers
FROM
  users u
  LEFT JOIN follows f ON u.id = f.followee_id
GROUP BY
  u.id
ORDER BY
  followers DESC
LIMIT
  10;