CREATE TABLE content_types
(
    id   bigserial PRIMARY KEY,
    name varchar(255) NOT NULL
);

CREATE TABLE contents
(
    id           bigserial PRIMARY KEY,
    task         varchar(255)  DEFAULT NULL,
    text         varchar(4000) DEFAULT NULL,
    url          varchar(255)  DEFAULT NULL,
    code         varchar(255)  DEFAULT NULL,
    num_value    bigint        DEFAULT NULL,
    type_id      bigint        NOT NULL,
    menu_item_id bigint        NOT NULL,
    sort         int           DEFAULT 0
);

CREATE TABLE content_sentences
(
    id           bigserial PRIMARY KEY,
    content_id   bigint        NOT NULL,
    num          int           DEFAULT NULL,
    sort         int           DEFAULT NULL,
    text         varchar(1000) DEFAULT NULL,
    case1        varchar(255)  DEFAULT NULL,
    case2        varchar(255)  DEFAULT NULL,
    case3        varchar(255)  DEFAULT NULL,
    correct_case int           DEFAULT NULL,
    answer       varchar(255)  DEFAULT NULL
);

CREATE TABLE content_sentence_answers
(
    id          bigserial PRIMARY KEY,
    sentence_id bigint       NOT NULL,
    text        varchar(255) NOT NULL
);

CREATE INDEX idx_contents_type_id ON contents (type_id);
CREATE INDEX idx_contents_menu_id ON contents (menu_item_id);

ALTER TABLE contents
    ADD CONSTRAINT fk_contents_type_id FOREIGN KEY (type_id) REFERENCES content_types (id),
    ADD CONSTRAINT fk_contents_menu_id FOREIGN KEY (menu_item_id) REFERENCES menu_items (id);

CREATE INDEX idx_content_sentences_content_id ON content_sentences (content_id);

ALTER TABLE content_sentences
    ADD CONSTRAINT fk_content_sentences_content_id FOREIGN KEY (content_id) REFERENCES contents (id);

CREATE INDEX idx_content_sentence_answers_sentence_id ON content_sentence_answers (sentence_id);

ALTER TABLE content_sentence_answers
    ADD CONSTRAINT fk_content_sentence_answers_sentence_id FOREIGN KEY (sentence_id) REFERENCES content_sentences (id);

INSERT INTO content_types (id, name)
VALUES (1, 'teacher_info'),
       (2, 'youtube_video'),
       (3, 'tests'),
       (4, 'text-with-input'),
       (5, 'text-with-select'),
       (6, 'text-with-select-from-list'),
       (7, 'sentences-with-text'),
       (8, 'sentences-with-select');

SELECT setval('content_types_id_seq', (SELECT MAX(id) FROM content_types));