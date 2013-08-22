DROP DATABASE IF EXISTS mysetup_db;
CREATE DATABASE mysetup_db;
USE mysetup_db;

CREATE TABLE my_setup(
	setup_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	title varchar(255) NOT NULL,
	description varchar(255),
	likes INT NOT NULL DEFAULT 0,
	flags INT DEFAULT 0
	);
CREATE TABLE images(
	setup_id BIGINT NOT NULL REFERENCES my_setup(setup_id),
	img_loc varchar(255) NOT NULL UNIQUE
	);

CREATE TABLE links(
	setup_id BIGINT NOT NULL REFERENCES my_setup(setup_id),
	url varchar(255) NOT NULL
	);

CREATE TABLE tags(
	setup_id BIGINT NOT NULL REFERENCES my_setup(setup_id),
	tag varchar(255) NOT NULL
	);

INSERT INTO my_setup (title, description, likes, flags) VALUES ('test', 'test', '10', '0'); 

INSERT INTO images (setup_id, img_loc) VALUES ('1', 'images/1.png');
/*CREATE TABLE tomcat_users (
	user_id int(64) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email varchar(255) NOT NULL UNIQUE,
	first_name varchar(255) NOT NULL,
	last_name varchar(255) NOT NULL,
	password varchar(255) NOT NULL
		);

CREATE TABLE tomcat_roles (
	role_name varchar(20) NOT NULL UNIQUE 
	);
CREATE TABLE tomcat_users_roles (
	email varchar(255) NOT NULL,
		role_name varchar(20) NOT NULL,
			UNIQUE(email, role_name),
				CONSTRAINT tomcat_users_roles_foreign_key_1 FOREIGN KEY (email) REFERENCES tomcat_users (email),
					CONSTRAINT tomcat_users_roles_foreign_key_2 FOREIGN KEY (role_name) REFERENCES tomcat_roles (role_name)
					);
INSERT INTO tomcat_users (first_name, last_name, email, password) VALUES ('tomcat', 'tomcat', 'tomcat@localhost.com', 'tomcat');
INSERT INTO tomcat_users (first_name, last_name, email, password) VALUES ('user','user', 'user@gmail.com', '123');
INSERT INTO tomcat_roles (role_name) VALUES ('admin');
INSERT INTO tomcat_roles (role_name) VALUES ('user');
INSERT INTO tomcat_users_roles (email, role_name) VALUES ('tomcat@localhost.com', 'user');
INSERT INTO tomcat_users_roles (email, role_name) VALUES ('tomcat@localhost.com', 'admin');
INSERT INTO tomcat_users_roles (email, role_name) VALUES ('user@gmail.com', 'user');
DROP TABLE IF EXISTS tomcat_users;
*/
COMMIT;

