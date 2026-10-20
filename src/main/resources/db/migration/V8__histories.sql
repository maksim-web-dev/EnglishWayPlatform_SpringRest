CREATE TABLE histories
(
    id          bigserial PRIMARY KEY,
    user_id     bigint       NOT NULL,
    action_date timestamp    NULL,
    type        varchar(255) DEFAULT NULL,
    info        varchar(255) DEFAULT NULL
);

CREATE INDEX idx_histories_user_id ON histories (user_id);

ALTER TABLE histories
    ADD CONSTRAINT fk_histories_user_id FOREIGN KEY (user_id) REFERENCES users (id);