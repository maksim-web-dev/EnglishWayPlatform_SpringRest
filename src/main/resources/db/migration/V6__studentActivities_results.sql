CREATE TABLE `results`
(
    `id`          bigint(20) NOT NULL,
    `student_id`  bigint(20) NOT NULL,
    `content_id`  bigint(20) NOT NULL,
    `unit_id`     bigint(20) NOT NULL,
    `is_last`     boolean  DEFAULT FALSE,
    `date`        timestamp NULL,
    `answer`      varchar(300) DEFAULT NULL,
    `score`       int(4) DEFAULT NULL,
    `is_homework` boolean  DEFAULT FALSE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE `results`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `results`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

#######################################################

ALTER TABLE `results`
    ADD KEY `results_student_id` (`student_id`),
    ADD KEY `results_unit_id` (`unit_id`),
    ADD KEY `results_content_id` (`content_id`);

ALTER TABLE `results`
    ADD CONSTRAINT `results_student_id` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
    ADD CONSTRAINT `results_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`),
    ADD CONSTRAINT `results_content_id` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`);

#######################################################

CREATE TABLE `student_activities`
(
    `id`                   bigint(20) NOT NULL,
    `student_id`              bigint(20) NOT NULL,
    `teacher_id`              bigint(20) NOT NULL,
    `course_id`            bigint(20) NOT NULL,
    `payment_summa`              bigint(20) NOT NULL,
    `payment_date`         timestamp NULL,
    `payment_unit_count` int(4) DEFAULT NULL,
    `active_unit_num`    int(4) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE `student_activities`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `student_activities`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


ALTER TABLE `student_activities`
    ADD KEY `student_activities_student_id` (`student_id`),
    ADD KEY `student_activities_teacher_id` (`teacher_id`),
    ADD KEY `student_activities_course_id` (`course_id`);

ALTER TABLE `student_activities`
    ADD CONSTRAINT `student_activities_student_id` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
    ADD CONSTRAINT `student_activities_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`),
    ADD CONSTRAINT `student_activities_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

