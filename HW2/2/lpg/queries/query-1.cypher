// list all janitors with a date when they entered their first job at a dormitory

MATCH (j:Janitor)-[w:WORKS_IN]->(:Dormitory)
RETURN j.FirstName, j.LastName, min(date(w.since))