-- Users Registrations By Day of Week
-- Counts how many users registered on each day of the week.
-- Helps to identify peak registration days and weekly trends.
SELECT
  DAYNAME(created_at) AS day,
  COUNT(*) AS total
FROM
  users
GROUP BY
  day
ORDER BY
  total DESC;