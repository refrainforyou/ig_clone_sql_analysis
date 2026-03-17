-- Average Likes Per Photo
-- Calculates the average number of likes received per photo across the platform.
-- Useful to evaluate overall content engagement and popularity trends.
SELECT
  ROUND(AVG(like_count), 2) AS avg_likes_per_photo
FROM
  (
    SELECT
      p.id,
      COUNT(l.user_id) AS like_count
    FROM
      photos p
      LEFT JOIN likes l ON p.id = l.photo_id
    GROUP BY
      p.id
  ) t;