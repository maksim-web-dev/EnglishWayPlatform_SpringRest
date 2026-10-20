CREATE TABLE `roles`
(
    `id`   bigint(20) NOT NULL,
    `name` varchar(255) DEFAULT NULL UNIQUE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE `roles`
    ADD PRIMARY KEY (`id`);
#########################
CREATE TABLE `users`
(
    `id`              bigint(20) NOT NULL,
    `username`        varchar(255) DEFAULT NULL UNIQUE,
    `name`            varchar(255) DEFAULT NULL,
    `email`           varchar(255) DEFAULT NULL UNIQUE,
    `password`        varchar(255) DEFAULT NULL,
    `is_active`       boolean      DEFAULT FALSE,
    `activation_code` varchar(255) DEFAULT NULL,
    `code_expiration` timestamp  NULL

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE `users`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
#####################################
CREATE TABLE `users_roles`
(
    `role_id` bigint(20) NOT NULL,
    `user_id` bigint(20) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

ALTER TABLE `users_roles`
    ADD KEY `users_roles_role_id` (`role_id`),
    ADD KEY `users_roles_user_id` (`user_id`);

ALTER TABLE `users_roles`
    ADD CONSTRAINT `users_roles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    ADD CONSTRAINT `users_roles_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;
#########################
INSERT INTO `roles` (id, name)
VALUES (1, 'ROLE_STUDENT')
     , (2, 'ROLE_MANAGER')
     , (3, 'ROLE_ADMIN')
     , (4, 'ROLE_TEACHER')
     , (5, 'ROLE_CONTENT_MANAGER')
     , (6, 'ROLE_CONTENT_LT');

INSERT INTO `users` (`id`, `username`, `name`, `email`, `password`, `is_active`, `activation_code`, `code_expiration`)
VALUES (1, 'a@admin.com', 'Admin', 'a@admin.com', '$2a$10$0AYdI4orxOoFlH7B8knsMOChcorvxMos/G.Wdlhf3/OyUXhLsy6gW', 1,
        NULL, NULL),
       (2, 'cm@admin.com', 'Content Manager', 'cm@admin.com',
        '$2a$10$y5CFM8.ht0RAvg8uVYPiC.2lndFB8aHqVIuPQMrnnOZ82ndw64hfG', 1, NULL, NULL),
       (3, 'scm@admin.com', 'Super Content Manager', 'scm@admin.com',
        '$2a$10$wZBDwTT7I4CCC.FxicwtrurQ/hD0xx4DJy9Jk/QDZ37ZA.UToaKUu', 1, NULL, NULL),
       (4, 't@admin.com', 'Teacher', 't@admin.com', '$2a$10$FCcpQcGDuUy9RNQRnsh9/ut8d56rt6IxYrA5vYrDxsPFE5nbbwEKS', 1,
        NULL, NULL),
       (5, 'all@admin.com', 'Universal', 'all@admin.com',
        '$2a$10$ZQf1WZ3.s78rSbKhOeoSlO53aqQ.TlvhouiHgVkTuIlQnFCKlco.a', 1, NULL, NULL),
       (6, 'student@admin.com', 'Student', 'student@admin.com',
        '$2a$10$ZQf1WZ3.s78rSbKhOeoSlO53aqQ.TlvhouiHgVkTuIlQnFCKlco.a', 1, NULL, NULL),
       (7, 'm@admin.com', 'Manager', 'm@admin.com',
        '$2a$10$ZQf1WZ3.s78rSbKhOeoSlO53aqQ.TlvhouiHgVkTuIlQnFCKlco.a', 1, NULL, NULL)
;

INSERT INTO `users_roles` (`user_id`, `role_id`)
VALUES (1, 3),
       (2, 5),
       (3, 6),
       (4, 4),
       (5, 1),
       (5, 3),
       (5, 4),
       (5, 5),
       (6, 1),
       (7, 2);
