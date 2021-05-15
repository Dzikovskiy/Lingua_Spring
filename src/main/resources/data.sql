INSERT INTO `users` (`email`,
                     `password`,
                     `username`,
                     `active`)
VALUES ("vital.dz@mail.ru",
        "$2a$10$OwRbamFNG6aqVtVmfBUT6eyy2SlOKO0e/Ji28/BqUD40y4SkIwkXS",
        "admin",
        true),
       ("vital.dz1@mail.ru",
        "$2a$10$S3o3d5BfjsARQkvQ5qdhue7R8mCivbZFSQwcrQH3xr8tgX7HALoNC",
        "user",
        true)
;

INSERT INTO user_role (user_id,
                       roles)
VALUES (1, "ADMIN"),
       (2, "USER");

INSERT INTO courses (name)
VALUES ("Starter pack");

INSERT INTO word (lang_first, lang_second,course_id)
VALUES ("пяць", "five",1)
     , ("хлеб", "bread",1)
     , ("вада", "water",1)
     , ("замак", "castle",1)
     , ("зямля", "earth",1)
     , ("сонца", "sun",1)
     , ("дзіця", "kid",1)
     , ("кнiга", "book",1)
     , ("тэлефон", "phone",1)
     , ("будынак", "building",1)
     , ("кот", "cat",1)
     , ("сабака", "dog",1)
     , ("дзесяць", "ten",1)
     , ("дзевяць", "nine",1)
     , ("восем", "eight",1)
     , ("сем", "seven",1)
     , ("шэсць", "six",1)
     , ("чатыры", "four",1)
     , ("тры", "three",1)
     , ("два", "two",1)
     , ("адзін", "one",1);
