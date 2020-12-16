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