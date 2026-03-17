-- Finding 5 Oldest Users
-- Retrieves the first 5 users who registered on the platform.
-- Useful to analyze early adopters and registration history.
SELECT
  *
FROM
  users
ORDER BY
  created_at
LIMIT
  5;