// list all janitors that work in more than one dormitory and do not own a broom

MATCH (j:Janitor)-[:WORKS_IN]->(d:Dormitory)
WITH j, count(d) AS dormitoryCount
WHERE (j.OwnsBroom=0) AND dormitoryCount > 1
RETURN j
