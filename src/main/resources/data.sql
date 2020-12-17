INSERT INTO users (id,
                   email,
                   password,
                   username,
                   active)
VALUES (-1,
        'vital.dz@mail.ru',
        '$2a$10$OwRbamFNG6aqVtVmfBUT6eyy2SlOKO0e/Ji28/BqUD40y4SkIwkXS',
        'admin',
        true);

INSERT INTO user_role (user_id,
                       roles)
VALUES (-1,'ADMIN');

INSERT INTO word (id, lang_first, lang_second)
VALUES (1, 'пяць', 'five')
     , (2, 'хлеб', 'bread')
     , (3, 'вада', 'water')
     , (4, 'замак', 'castle')
     , (5, 'зямля', 'earth')
     , (6, 'сонца', 'sun')
     , (7, 'дзіця', 'kid')
     , (8, 'кнiга', 'book')
     , (9, 'тэлефон', 'phone')
     , (10, 'будынак', 'building')
     , (11, 'кот', 'cat')
     , (12, 'сабака', 'dog')
     , (13, 'дзесяць', 'ten')
     , (14, 'дзевяць', 'nine')
     , (15, 'восем', 'eight')
     , (16, 'сем', 'seven')
     , (17, 'шэсць', 'four')
     , (18, 'чатыры', 'four')
     , (19, 'тры', 'three')
     , (20, 'два', 'two')
     , (21, 'адзін', 'one');
