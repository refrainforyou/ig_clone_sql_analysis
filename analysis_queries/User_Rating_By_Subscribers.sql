-- Purpose: calculate the number of followers for each user and build a ranking.
-- RANK() is used to order users by follower count in descending order.
-- Helps identify the most popular users on the platform.
SELECT
  u.username,
  COUNT(f.follower_id) AS followers,
  RANK() OVER (ORDER BY COUNT(f.follower_id) DESC) AS user_rank
FROM users u
LEFT JOIN follows f ON u.id = f.followee_id
GROUP BY u.id;