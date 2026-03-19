-- Purpose: identify top 3 photos for each user based on number of likes.
-- RANK() is used with PARTITION BY to rank photos within each user group.
-- Returns the most popular photos per user by likes count.
SELECT *
FROM (
    SELECT
        p.user_id,
        p.id AS photo_id,
        COUNT(l.user_id) AS likes_count,
        RANK() OVER (
            PARTITION BY p.user_id
            ORDER BY COUNT(l.user_id) DESC
        ) AS rnk
    FROM photos p
    LEFT JOIN likes l ON p.id = l.photo_id
    GROUP BY p.user_id, p.id
) t
WHERE rnk <= 3;