CREATE TABLE `lessons`
(
    `id`                bigint(20) NOT NULL,
    `start_time`        timestamp NULL,
    `duration_minutes`  int(4) NULL,
    `topic`             varchar(255) NULL,
    `activity_id`        bigint(20) DEFAULT NULL,
    `status` VARCHAR(20) NOT NULL CHECK (status IN ('SCHEDULED', 'COMPLETED', 'CANCELLED', 'MOVED', 'NO_ACTION'))
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE `lessons`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `lessons`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `lessons`
    ADD KEY `lessons_activity_id` (`activity_id`);

ALTER TABLE `lessons`
    ADD CONSTRAINT `lessons_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `student_activities` (`id`)
;
