CREATE TABLE courses
(
    id           bigserial PRIMARY KEY,
    name         varchar(255) NOT NULL,
    img          varchar(255) DEFAULT NULL,
    complication varchar(255) DEFAULT NULL,
    level_id     bigint       DEFAULT 0
);

CREATE INDEX idx_courses_level_id ON courses (level_id);

ALTER TABLE courses
    ADD CONSTRAINT fk_courses_level_id FOREIGN KEY (level_id) REFERENCES levels (id);

CREATE TABLE units
(
    id        bigserial PRIMARY KEY,
    name      varchar(255) NOT NULL,
    num       int          DEFAULT 0,
    course_id bigint       DEFAULT 0
);

CREATE INDEX idx_units_course_id ON units (course_id);

ALTER TABLE units
    ADD CONSTRAINT fk_units_course_id FOREIGN KEY (course_id) REFERENCES courses (id);

INSERT INTO courses (id, name, img, complication, level_id)
VALUES (1, 'Empty Zero English course', '', 'A0', 1),
       (2, 'Empty English begin course', '', 'A1', 2),
       (3, 'Empty Pre Intermediate English course', '', 'A2', 3),
       (4, 'Empty Intermediate English course', '', 'B1', 4),
       (5, 'Empty Upper Intermediate English course', '', 'B2', 5),
       (6, 'Empty Advanced English course', '', 'C1', 6);

SELECT setval('courses_id_seq', (SELECT MAX(id) FROM courses));

INSERT INTO units (id, name, num, course_id)
VALUES (1, 'Zero English-1', 1, 1),
       (2, 'Zero English-2', 2, 1),
       (3, 'Zero English-3', 3, 1),
       (4, 'Zero English-4', 4, 1),
       (5, 'Zero English-5', 5, 1),
       (6, 'Zero English-6', 6, 1),
       (7, 'English begin-1', 1, 2),
       (8, 'English begin-2', 2, 2),
       (9, 'English begin-3', 3, 2),
       (10, 'English begin-4', 4, 2),
       (11, 'English begin-5', 5, 2),
       (12, 'English begin-6', 6, 2),
       (13, 'Pre Intermediate English-1', 1, 3),
       (14, 'Pre Intermediate English-2', 2, 3),
       (15, 'Pre Intermediate English-3', 3, 3),
       (16, 'Pre Intermediate English-4', 4, 3),
       (17, 'Pre Intermediate English-5', 5, 3),
       (18, 'Pre Intermediate English-6', 6, 3),
       (19, 'Intermediate English-1', 1, 4),
       (20, 'Intermediate English-2', 2, 4),
       (21, 'Intermediate English-3', 3, 4),
       (22, 'Intermediate English-4', 4, 4),
       (23, 'Intermediate English-5', 5, 4),
       (24, 'Intermediate English-6', 6, 4),
       (25, 'Upper Intermediate English-1', 1, 5),
       (26, 'Upper Intermediate English-2', 2, 5),
       (27, 'Upper Intermediate English-3', 3, 5),
       (28, 'Upper Intermediate English-4', 4, 5),
       (29, 'Upper Intermediate English-5', 5, 5),
       (30, 'Upper Intermediate English-6', 6, 5),
       (31, 'Advanced English-1', 1, 6),
       (32, 'Advanced English-2', 2, 6),
       (33, 'Advanced English-3', 3, 6),
       (34, 'Advanced English-4', 4, 6),
       (35, 'Advanced English-5', 5, 6),
       (36, 'Advanced English-6', 6, 6);

SELECT setval('units_id_seq', (SELECT MAX(id) FROM units));