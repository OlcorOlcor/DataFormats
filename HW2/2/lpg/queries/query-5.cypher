// list all university IDs and names with names starting with the letter C

CREATE CONSTRAINT FOR (u:University)
REQUIRE u.id IS UNIQUE;

MATCH (u:University) WHERE u.Name STARTS WITH 'C' RETURN u.id, u.Name