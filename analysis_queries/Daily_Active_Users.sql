-- Рахуємо DAU (Daily Active Users) за всіма діями користувачів: фото, лайки, коментарі, підписки
-- Внутрішній підзапит об’єднує всі дії з датою, UNION ALL зберігає всі записи
-- Зовнішній запит групує за датою і рахує унікальних користувачів (COUNT(DISTINCT user_id))

SELECT
  activity_date,
  COUNT(DISTINCT user_id) AS DAU
FROM
  (
    SELECT
      user_id,
      DATE(created_at) AS activity_date
    FROM
      photos
    UNION ALL
    SELECT
      user_id,
      DATE(created_at) AS activity_date
    FROM
      likes
    UNION ALL
    SELECT
      user_id,
      DATE(created_at) AS activity_date
    FROM
      comments
    UNION ALL
    SELECT
      follower_id AS user_id,
      DATE(created_at) AS activity_date
    FROM
      follows
  ) AS all_activity
GROUP BY
  activity_date
ORDER BY
  activity_date;