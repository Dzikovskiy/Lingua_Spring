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
--
-- INSERT INTO courses (name)
-- VALUES ("Digits");
--
-- INSERT INTO word (lang_first, lang_second)
-- VALUES ("пяць", "five")
--      , ("хлеб", "bread")
--      , ("вада", "water")
--      , ("замак", "castle")
--      , ("зямля", "earth")
--      , ("сонца", "sun")
--      , ("дзіця", "kid")
--      , ("кнiга", "book")
--      , ("тэлефон", "phone")
--      , ("будынак", "building")
--      , ("кот", "cat")
--      , ("сабака", "dog")
--      , ("дзесяць", "ten")
--      , ("дзевяць", "nine")
--      , ("восем", "eight")
--      , ("сем", "seven")
--      , ("шэсць", "four")
--      , ("чатыры", "four")
--      , ("тры", "three")
--      , ("два", "two")
--      , ("адзін", "one");
