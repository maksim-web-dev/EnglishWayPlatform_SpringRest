CREATE TABLE lessons
(
    id               bigserial PRIMARY KEY,
    start_time       timestamp    NULL,
    duration_minutes int          NULL,
    topic            varchar(255) NULL,
    activity_id      bigint       DEFAULT NULL,
    status           varchar(20)  NOT NULL CHECK (status IN ('SCHEDULED', 'COMPLETED', 'CANCELLED', 'MOVED', 'NO_ACTION'))
);

CREATE INDEX idx_lessons_activity_id ON lessons (activity_id);

ALTER TABLE lessons
    ADD CONSTRAINT fk_lessons_activity_id FOREIGN KEY (activity_id) REFERENCES student_activities (id);