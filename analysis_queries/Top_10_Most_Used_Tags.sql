-- Top 10 Most Used Tags
-- Retrieves the 10 tags most frequently applied to photos on the platform.
-- Useful to identify trending topics and popular content themes.
SELECT
  t.tag_name,
  COUNT(*) AS total_used
FROM
  tags t
  JOIN photo_tags pt ON pt.tag_id = t.id
GROUP BY
  t.tag_name
ORDER BY
  total_used DESC
LIMIT
  10;