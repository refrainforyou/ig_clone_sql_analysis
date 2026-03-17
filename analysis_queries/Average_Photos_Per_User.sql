-- Average Photos Per User
-- Calculates the average number of photos uploaded per user on the platform.
-- Helps to understand overall user activity and engagement levels.
SELECT
  ROUND(AVG(count_photos), 2) as avg_photo_per_user
FROM
  (
    SELECT
      u.username,
      COALESCE(count(p.id), 0) AS count_photos
    FROM
      users u
      LEFT JOIN photos p ON p.user_id = u.id
    GROUP BY
      u.username
  ) t;