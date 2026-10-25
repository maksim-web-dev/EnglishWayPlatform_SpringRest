CREATE TABLE settings
(
    id          bigserial PRIMARY KEY,
    code        varchar(255) DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    value       boolean      DEFAULT NULL
);

INSERT INTO settings (id, code, description, value)
VALUES (1, 'show_courses_if_student_activity_exists',
        'Shows courses for students only when studentActivity was created.', true),
       (2, 'always_access_first_lesson',
        'Always access first lesson. When manager or teacher create studentActivity of student, then it open course and allow first lesson for student.',
        true),
       (3, 'show_payment_info', 'Show payment information on Activity pages.', false);

SELECT setval('settings_id_seq', (SELECT MAX(id) FROM settings));