CREATE TABLE results
(
    id          bigserial PRIMARY KEY,
    student_id  bigint       NOT NULL,
    content_id  bigint       NOT NULL,
    unit_id     bigint       NOT NULL,
    is_last     boolean      DEFAULT FALSE,
    date        timestamp    NULL,
    answer      varchar(300) DEFAULT NULL,
    score       int          DEFAULT NULL,
    is_homework boolean      DEFAULT FALSE
);

CREATE INDEX idx_results_student_id ON results (student_id);
CREATE INDEX idx_results_unit_id ON results (unit_id);
CREATE INDEX idx_results_content_id ON results (content_id);

ALTER TABLE results
    ADD CONSTRAINT fk_results_student_id FOREIGN KEY (student_id) REFERENCES users (id),
    ADD CONSTRAINT fk_results_unit_id FOREIGN KEY (unit_id) REFERENCES units (id),
    ADD CONSTRAINT fk_results_content_id FOREIGN KEY (content_id) REFERENCES contents (id);

CREATE TABLE student_activities
(
    id                 bigserial PRIMARY KEY,
    student_id         bigint    NOT NULL,
    teacher_id         bigint    NOT NULL,
    course_id          bigint    NOT NULL,
    payment_summa      bigint    NOT NULL,
    payment_date       timestamp NULL,
    payment_unit_count int       DEFAULT NULL,
    active_unit_num    int       DEFAULT NULL
);

CREATE INDEX idx_student_activities_student_id ON student_activities (student_id);
CREATE INDEX idx_student_activities_teacher_id ON student_activities (teacher_id);
CREATE INDEX idx_student_activities_course_id ON student_activities (course_id);

ALTER TABLE student_activities
    ADD CONSTRAINT fk_student_activities_student_id FOREIGN KEY (student_id) REFERENCES users (id),
    ADD CONSTRAINT fk_student_activities_teacher_id FOREIGN KEY (teacher_id) REFERENCES users (id),
    ADD CONSTRAINT fk_student_activities_course_id FOREIGN KEY (course_id) REFERENCES courses (id);