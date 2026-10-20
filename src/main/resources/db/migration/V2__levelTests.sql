CREATE TABLE `levels`
(
    `id`         bigint(20) NOT NULL,
    `name`       varchar(255) DEFAULT NULL UNIQUE,
    `code`       varchar(255) DEFAULT NULL UNIQUE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE `levels`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `levels`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

#########################
CREATE TABLE `level_tests`
(
    `id`       bigint(20)   NOT NULL,
    `num`      int(4)      DEFAULT 0,
    `question` varchar(255) NOT NULL,
    `case1`    varchar(20) DEFAULT NULL,
    `case2`    varchar(20) DEFAULT NULL,
    `case3`    varchar(20) DEFAULT NULL,
    `correct`  int(1)      DEFAULT 0,
    `level_id` bigint(20)  DEFAULT 0
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE `level_tests`
    ADD PRIMARY KEY (`id`);
ALTER TABLE `level_tests`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `level_tests`
    ADD KEY `level_tests_level_id` (`level_id`);

ALTER TABLE `level_tests`
    ADD CONSTRAINT `level_tests_level_id` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`)
;

#########################

CREATE TABLE `level_test_results`
(
    `id`             bigint(20)   NOT NULL,
    `user_id`        bigint(20)   NOT NULL,
    `answers`        varchar(255) NOT NULL,
    `score`          int(4)       DEFAULT 0,
    `level_id`       bigint(20)   DEFAULT NULL,
    `recommendation` varchar(255) DEFAULT NULL,
    `time`           timestamp    NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE `level_test_results`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `level_test_results`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


ALTER TABLE `level_test_results`
    ADD KEY `level_test_results_level_id` (`level_id`),
    ADD KEY `level_test_results_user_id` (`user_id`);

ALTER TABLE `level_test_results`
    ADD CONSTRAINT `level_test_results_level_id` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`),
    ADD CONSTRAINT `level_test_results_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

#########################

INSERT INTO `levels` (id, name, code)
VALUES
(1, 'Starter', 'A0'), (2, 'Beginner', 'A1'), (3, 'Pre-intermediate','A2')
     , (4, 'Intermediate', 'B1'), (5, 'Upper-intermediate', 'B2'), (6, 'Advanced', 'C1')
;
INSERT INTO `level_tests` (id, num, question, case1,case2,case3, correct, level_id)
VALUES
       (1, 1, '1.How many books _ you have?', 'do', 'does', 'are', 1, 2),
       (2, 2, '2.Dima _ a big dog', 'have', 'has', 'had', 2, 2),
       (3, 3, '3.Valera and his sister _ a car', 'have', 'has', 'had', 1, 2),
       (4, 4, '4.Ben _ to visit him', 'wants', 'want', 'wantes', 1, 2),


       (5, 5, '5.He _ her mam yesterday.', 'look', 'looks', 'looked', 3, 3),
       (6, 6, '6.I regret _ a lot food yesterday.', 'eating', 'to ate', 'eated', 1, 3),
       (7, 7, '7.Did he _ about it?', 'heard', 'hear', 'hears', 2, 3),
       (8, 8, '8.Did you go shopping?', '- Yes, I was','- Yes, I am', '- Yes, I did', 3, 3),

       (9, 9, '9.I adore _ my dog.', 'to walk', 'walking', 'walk', 2, 4),
       (10, 10, '10.It will be great _ a meeting', 'to have', 'to has', 'having', 1, 4)
;
