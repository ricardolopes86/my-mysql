CREATE SCHEMA `journals` DEFAULT CHARACTER SET utf8 ;
USE journals;
CREATE TABLE user
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    enabled BIT(1) NOT NULL,
    login_name VARCHAR(255) NOT NULL,
    pwd VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL
);
CREATE TABLE item
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE journal
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    publish_date DATETIME NOT NULL,
    uuid VARCHAR(255),
    publisher_id BIGINT(20) NOT NULL,
    category_id BIGINT(20) NOT NULL
);
CREATE INDEX FK_c7picib39dl7kxro2349cnpn9 ON journal (publisher_id);
CREATE INDEX FK_sdfpoiuq9874rf98jqpijabv5 ON journal (category_id);
CREATE TABLE publisher
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    user_id BIGINT(20) NOT NULL
);
CREATE UNIQUE INDEX UK_ml1xc0aovqkkm2p1lssgjkfas ON publisher (user_id);
CREATE TABLE subscription
(
    id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date DATETIME NOT NULL,
    user_id BIGINT(20) NOT NULL,
    category_id BIGINT(20) NOT NULL
);
CREATE TABLE category
(
	id BIGINT(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
CREATE UNIQUE INDEX UK_tq3cq3gmsss8jjyb2l5sb1o6k ON subscription (user_id);

ALTER TABLE journal
    ADD CONSTRAINT FK_c7picib39dl7kxro2349cnpn9 FOREIGN KEY (publisher_id) REFERENCES publisher (id);

ALTER TABLE journal
    ADD CONSTRAINT FK_sdfpoiuq9874rf98jqpijabv5 FOREIGN KEY (category_id) REFERENCES category (id);

ALTER TABLE publisher
		ADD CONSTRAINT FK_ml1xc0aovqkkm2p1lssgjkfas FOREIGN KEY (user_id) REFERENCES user (id)