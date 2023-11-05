// list first 10 dormitories which have dorm rooms in floors 10 and higher (shows just 2, not enough data)

MATCH (r:DormRoom)-[:BELONGS_TO]->(d:Dormitory)
WHERE r.Floor >= 10
RETURN DISTINCT d AS dormitory
LIMIT 10