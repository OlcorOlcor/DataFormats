[.DormRooms[] | .Capacity as $capacity | {"roomId": ."@id", "is-full": (.Student | length == $capacity)}]