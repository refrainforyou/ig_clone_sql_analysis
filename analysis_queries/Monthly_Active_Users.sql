-- Рахуємо MAU (Monthly Active Users) за всіма діями користувачів: фото, лайки, коментарі, підписки
-- Внутрішній підзапит об’єднує всі дії з форматом дати 'YYYY-MM' для місяця, UNION ALL зберігає всі записи
-- Зовнішній запит групує за місяцем і рахує унікальних користувачів (COUNT(DISTINCT user_id))

SELECT
  activity_month,
  COUNT(DISTINCT user_id) AS MAU
FROM
  (
    SELECT
      user_id,
      DATE_FORMAT(created_at, '%Y-%m') AS activity_month
    FROM
      photos
    UNION ALL
    SELECT
      user_id,
      DATE_FORMAT(created_at, '%Y-%m') AS activity_month
    FROM
      likes
    UNION ALL
    SELECT
      user_id,
      DATE_FORMAT(created_at, '%Y-%m') AS activity_month
    FROM
      comments
    UNION ALL
    SELECT
      follower_id AS user_id,
      DATE_FORMAT(created_at, '%Y-%m') AS activity_month
    FROM
      follows
  ) AS all_activity
GROUP BY
  activity_month
ORDER BY
  activity_month;