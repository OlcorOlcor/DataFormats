// list all students that stay in the dormitory that belongs to the university they study at

MATCH (s:Student)-[:STAYS_IN]->(:DormRoom)-[:IS_IN]->(d:Dormitory)-[:BELONGS_TO]->(u:University)
WHERE (s)-[:STUDIES_AT]->(u)
RETURN s