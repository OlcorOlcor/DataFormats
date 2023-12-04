{
    "students-university-ids": [(.DormRooms[] | .Students[] | .Universities[] | .id)],
    "dorm-university-id": .University.id
} | ."dorm-university-id" as $dormuniid | {"all-students-at-the-dorm-uni": all (."students-university-ids".[]; . == $dormuniid)}