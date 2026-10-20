CREATE TABLE levels
(
    id   bigserial PRIMARY KEY,
    name varchar(255) DEFAULT NULL UNIQUE,
    code varchar(255) DEFAULT NULL UNIQUE
);

CREATE TABLE level_tests
(
    id       bigserial PRIMARY KEY,
    num      int          DEFAULT 0,
    question varchar(255) NOT NULL,
    case1    varchar(20)  DEFAULT NULL,
    case2    varchar(20)  DEFAULT NULL,
    case3    varchar(20)  DEFAULT NULL,
    correct  int          DEFAULT 0,
    level_id bigint       DEFAULT 0
);

CREATE INDEX idx_level_tests_level_id ON level_tests (level_id);

ALTER TABLE level_tests
    ADD CONSTRAINT fk_level_tests_level_id FOREIGN KEY (level_id) REFERENCES levels (id);

CREATE TABLE level_test_results
(
    id             bigserial PRIMARY KEY,
    user_id        bigint       NOT NULL,
    answers        varchar(255) NOT NULL,
    score          int          DEFAULT 0,
    level_id       bigint       DEFAULT NULL,
    recommendation varchar(255) DEFAULT NULL,
    time           timestamp    NOT NULL
);

CREATE INDEX idx_level_test_results_level_id ON level_test_results (level_id);
CREATE INDEX idx_level_test_results_user_id ON level_test_results (user_id);

ALTER TABLE level_test_results
    ADD CONSTRAINT fk_level_test_results_level_id FOREIGN KEY (level_id) REFERENCES levels (id),
    ADD CONSTRAINT fk_level_test_results_user_id FOREIGN KEY (user_id) REFERENCES users (id);

INSERT INTO levels (id, name, code)
VALUES (1, 'Starter', 'A0'),
       (2, 'Beginner', 'A1'),
       (3, 'Pre-intermediate', 'A2'),
       (4, 'Intermediate', 'B1'),
       (5, 'Upper-intermediate', 'B2'),
       (6, 'Advanced', 'C1');

SELECT setval('levels_id_seq', (SELECT MAX(id) FROM levels));

INSERT INTO level_tests (id, num, question, case1, case2, case3, correct, level_id)
VALUES (1, 1, '1.How many books _ you have?', 'do', 'does', 'are', 1, 2),
       (2, 2, '2.Dima _ a big dog', 'have', 'has', 'had', 2, 2),
       (3, 3, '3.Valera and his sister _ a car', 'have', 'has', 'had', 1, 2),
       (4, 4, '4.Ben _ to visit him', 'wants', 'want', 'wantes', 1, 2),
       (5, 5, '5.He _ her mam yesterday.', 'look', 'looks', 'looked', 3, 3),
       (6, 6, '6.I regret _ a lot food yesterday.', 'eating', 'to ate', 'eated', 1, 3),
       (7, 7, '7.Did he _ about it?', 'heard', 'hear', 'hears', 2, 3),
       (8, 8, '8.Did you go shopping?', '- Yes, I was', '- Yes, I am', '- Yes, I did', 3, 3),
       (9, 9, '9.I adore _ my dog.', 'to walk', 'walking', 'walk', 2, 4),
       (10, 10, '10.It will be great _ a meeting', 'to have', 'to has', 'having', 1, 4);

SELECT setval('level_tests_id_seq', (SELECT MAX(id) FROM level_tests));