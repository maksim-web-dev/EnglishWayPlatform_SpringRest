CREATE TABLE menu_types
(
    id   bigserial PRIMARY KEY,
    name varchar(255) NOT NULL UNIQUE
);

CREATE TABLE menu_items
(
    id      bigserial PRIMARY KEY,
    name    varchar(255) NOT NULL,
    sort    bigint       DEFAULT NULL,
    url     varchar(255) DEFAULT NULL,
    img     varchar(255) DEFAULT NULL,
    title   varchar(255) DEFAULT NULL,
    type_id bigint       DEFAULT NULL,
    role_id bigint       DEFAULT NULL,
    unit_id bigint       DEFAULT NULL
);

INSERT INTO menu_items (id, name, sort, url, img, title, type_id, role_id, unit_id)
VALUES
    -- Student
    (1, '-Dashboard', 1, '/cabinet/', '', 'Dashboard', 1, 1, NULL),
    (2, 'Course', 2, '/cabinet/courses', '', 'Show courses for Student', 1, 1, NULL),
    (3, '-Calendar', 3, '/cabinet/courses', '', 'Show courses for Student', 1, 1, NULL),
    (4, '-History', 4, '/cabinet/courses', '', 'Show courses for Student', 1, 1, NULL),
    (5, '-Rating', 5, '/cabinet/courses', '', 'Show courses for Student', 1, 1, NULL),
    -- Manager
    (6, 'Activity', 1, '/admin/activity', '', 'Show students activity', 1, 2, NULL),
    (7, '-Teachers', 2, '/admin/teachers', '', 'Show students activity', 1, 2, NULL),
    -- Admin
    (8, '-Dashboard', 1, '/admin/', '', 'Dashboard', 1, 3, NULL),
    (9, 'Course*', 2, '/admin/edit-courses', '', 'Show and edit courses for Admin', 1, 3, NULL),
    (10, 'Activity', 3, '/admin/activity', '', 'Show students activity', 1, 3, NULL),
    (11, 'Settings', 4, '/admin/settings', '', 'Show settings for Admin', 1, 3, NULL),
    -- Teacher
    (12, '-Students', 1, '/cabinet/students', '', 'Show students for Teacher', 1, 4, NULL),
    (13, 'Course', 2, '/cabinet/courses', '', 'Show courses for Teacher', 1, 4, NULL),
    (14, '-Calendar', 3, '/cabinet/courses', '', 'Show courses for Student', 1, 4, NULL),
    (15, '-History', 4, '/cabinet/courses', '', 'Show courses for Student', 1, 4, NULL),
    -- Content Manager
    (16, 'Course*', 1, '/admin/edit-courses', '', 'Show and edit courses for ContentManager', 1, 5, NULL),
    -- CONTENT_LT
    (17, 'Level Test*', 4, '/admin/level-test', '', 'Edit level test for CONTENT_LT', 1, 6, NULL);

SELECT setval('menu_items_id_seq', (SELECT MAX(id) FROM menu_items));

CREATE INDEX idx_menu_items_type_id ON menu_items (type_id);
CREATE INDEX idx_menu_items_role_id ON menu_items (role_id);

INSERT INTO menu_types (id, name)
VALUES (1, 'main'),
       (2, 'lesson');

SELECT setval('menu_types_id_seq', (SELECT MAX(id) FROM menu_types));

ALTER TABLE menu_items
    ADD CONSTRAINT fk_menu_items_type_id FOREIGN KEY (type_id) REFERENCES menu_types (id),
    ADD CONSTRAINT fk_menu_items_role_id FOREIGN KEY (role_id) REFERENCES roles (id);