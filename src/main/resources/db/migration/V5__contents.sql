CREATE TABLE `content_types`
(
    `id`   bigint(20) NOT NULL,
    `name` varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE `content_types`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `content_types`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

-- #######################################################
-- CREATE TABLE `content_options`
-- (
--     `id`   bigint(20) NOT NULL,
--     `content_id`   bigint(20) DEFAULT NULL,
--     `sentence_id`   bigint(20) DEFAULT NULL,
--     `is_for_content`   int(1) DEFAULT TRUE,
--     `text` varchar(255) NOT NULL
-- ) ENGINE = InnoDB
--   DEFAULT CHARSET = utf8mb4
--   COLLATE = utf8mb4_general_ci;
--
-- ALTER TABLE `content_options`
--     ADD PRIMARY KEY (`id`);
--
-- ALTER TABLE `content_options`
--     MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
#######################################################

CREATE TABLE `contents`
(
    `id`           bigint(20) NOT NULL,
    `task`         varchar(255) DEFAULT NULL,
    `text`         varchar(4000) DEFAULT NULL,
    `url`          varchar(255) DEFAULT NULL,
    `code`         varchar(255) DEFAULT NULL,
    `num_value`    bigint(4) DEFAULT NULL,
    `type_id`      bigint(20) NOT NULL,
    `menu_item_id` bigint(20) NOT NULL,
    `sort`        int(4) DEFAULT 0
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE `contents`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `contents`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


#########################

CREATE TABLE `content_sentences`
(
    `id`   bigint(20) NOT NULL,
    `content_id`   bigint(20) NOT NULL,
    `num`   int(4) DEFAULT NULL,
    `sort`   int(4) DEFAULT NULL,
    `text` varchar(1000) DEFAULT NULL,
    `case1` varchar(255) DEFAULT NULL,
    `case2` varchar(255) DEFAULT NULL,
    `case3` varchar(255) DEFAULT NULL,
    `correct_case` int(1) DEFAULT NULL,
    `answer` varchar(255) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE `content_sentences`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `content_sentences`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

#######################################################

-- ALTER TABLE `content_options`
--     ADD KEY `content_options_content_id` (`content_id`),
--     ADD KEY `content_options_sentence_id` (`sentence_id`);
--
-- ALTER TABLE `content_options`
--     ADD CONSTRAINT `content_options_content_id` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`),
--     ADD CONSTRAINT `content_options_sentence_id` FOREIGN KEY (`sentence_id`) REFERENCES `content_sentences` (`id`);

ALTER TABLE `contents`
    ADD KEY `contents_type_id` (`type_id`),
    ADD KEY `contents_menu_id` (`menu_item_id`);

ALTER TABLE `contents`
    ADD CONSTRAINT `contents_type_id` FOREIGN KEY (`type_id`) REFERENCES `content_types` (`id`),
    ADD CONSTRAINT `contents_menu_id` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`);

ALTER TABLE `content_sentences`
    ADD KEY `content_sentences_sentence_id` (`content_id`);

ALTER TABLE `content_sentences`
    ADD CONSTRAINT `content_sentences_sentence_id` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`);

#######################################################

CREATE TABLE `content_sentence_answers`
(
    `id`   bigint(20) NOT NULL,
    `sentence_id`   bigint(20) NOT NULL,
    `text` varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE `content_sentence_answers`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `content_sentence_answers`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `content_sentence_answers`
    ADD KEY `content_sentence_answers_sentence_id` (`sentence_id`);

ALTER TABLE `content_sentence_answers`
    ADD CONSTRAINT `content_sentence_answers_sentence_id` FOREIGN KEY (`sentence_id`) REFERENCES `content_sentences` (`id`);

#######################################################

INSERT INTO `content_types` (id, name)
VALUES (1, 'teacher_info'),
       (2, 'youtube_video'),
       (3, 'tests'),
       (4, 'text-with-input'),
       (5, 'text-with-select'),
       (6, 'text-with-select-from-list'),
       (7, 'sentences-with-text'),
       (8, 'sentences-with-select')
;