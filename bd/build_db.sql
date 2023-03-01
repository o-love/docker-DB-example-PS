CREATE TABLE USERS (
    user_name varchar(20) CONSTRAINT users_pk PRIMARY KEY,
    email varchar(320) NOT NULL,
    CONSTRAINT email_unique UNIQUE (email)
);