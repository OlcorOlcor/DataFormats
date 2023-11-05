// CREATES DATA AND RELATIONS
CREATE // Dormitories
    (Strahov:Dormitory {address: "Praha Vaníčkova 315/7", Name: "Strahov", hasBedBugs: 1}),
    (seventeen:Dormitory {address: "Praha Pátkova 2136/3", Name: "17. Listopadu", hasBedBugs: 0}),
    (CambridgeDormitory:Dormitory {address: "Cambridge O'Brians street", Name: "Cambridge Dormitory", hasBedBugs: 0})

CREATE // DormRooms
    (d1:DormRoom {Floor: 0, Number: 10, Capacity: 2, HasToilet: 0}),
    (d2:DormRoom {Floor: 100, Number: 1000, Capacity: 3, HasToilet: 1}),
    (d3:DormRoom {Floor: 42, Number: 421, Capacity: 4, HasToilet: 1})

CREATE // Universities
    (Cambridge:University {Name: "Cambridge", id: 1, webPage: "https://www.cam.ac.uk"}),
    (Harvard:University {Name: "Harvard", id: 3, webPage: "https://pll.harvard.edu"}),
    (cuni:University {Name: "Charles University", id: 2, webPage: "https://cuni.cz"})    

CREATE // Janitors
    (Marcela:Janitor {FirstName: "Marcela", LastName: "Vomáčková", id: 1, OwnsBroom: 0})

CREATE //Students
    (David:Student {FirstName: "David", MiddleName: "Honza,Terka,Honza", LastName: "Petera", id: 86})

CREATE //Relations

(Strahov)-[:BELONGS_TO]->(cuni),
(seventeen)-[:BELONGS_TO]->(cuni),
(CambridgeDormitory)-[:BELONGS_TO]->(Cambridge),
(d1)-[:IS_IN]->(Strahov),
(d2)-[:IS_IN]->(seventeen),
(d3)-[:IS_IN]->(CambridgeDormitory),
(David)-[:STUDIES_AT]->(cuni),
(David)-[:STAYS_IN]->(d2),
(Marcela)-[:WORKS_IN]->(CambridgeDormitory),
(Marcela)-[:WORKS_IN]->(Strahov)

