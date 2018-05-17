-- SimpleBank Online Database SQL by Yukyung Jung

create database sbonline;

use sbonline;

create table role (
	role_num int not null auto_increment,
	role_name varchar(50) not null,
	PRIMARY KEY (role_num)
);

create table users (
	user_num int not null auto_increment,
	username varchar(50) not null,
	password varchar(50) not null,
	role_num int not null,
	PRIMARY KEY (user_num),
	FOREIGN KEY (role_num) REFERENCES role(role_num)
);

create table user_info (
	user_info_num int not null auto_increment,
	full_name varchar(50) null,
	address varchar(100) null,
	phone_num varchar(30) null,
	user_num int not null,
	PRIMARY KEY (user_info_num),
	FOREIGN KEY (user_num) REFERENCES users(user_num)
);

create table bank (
	bank_num int not null auto_increment,
	check_acct_num int null,
	save_acct_num int null,
	credit_acct_num int null,
	user_num int not null,
	PRIMARY KEY (bank_num),
	FOREIGN KEY (user_num) REFERENCES users(user_num)
);

create table check_acct (
	check_acct_num int not null auto_increment,
	check_amount Decimal(13, 2) null,
	bank_num int not null,
	PRIMARY KEY (check_acct_num),
	FOREIGN KEY (bank_num) REFERENCES bank(bank_num)
);


create table save_acct (
	save_acct_num int not null auto_increment,
	save_amount Decimal(13, 2) null,
	bank_num int not null,
	PRIMARY KEY (save_acct_num),
	FOREIGN KEY (bank_num) REFERENCES bank(bank_num)
);


create table credit_acct (
	credit_acct_num int not null auto_increment,
	credit_amount Decimal(13, 2) null,
	bank_num int not null,
	PRIMARY KEY (credit_acct_num),
	FOREIGN KEY (bank_num) REFERENCES bank(bank_num)
);

create table transaction (
	trans_num int not null auto_increment,
	check_acct_num int null,
	save_acct_num int null,
	credit_acct_num int null,
	current_amount Decimal(13, 2) null,
	trans_amount Decimal(13, 2) null,
	total_amount Decimal(13, 2) null,
	approval tinyint(1) null,
	trans_type varchar(15),
	bank_num int not null,
	action tinyint(1) null,
	PRIMARY KEY (trans_num),
	FOREIGN KEY (bank_num) REFERENCES bank(bank_num)
);

create table logger (
	logger_num int not null auto_increment,
	username varchar(50) null,
	password varchar(50) null,
	info varchar(50) null,
	ts TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	ipaddress varchar(50) null,
	PRIMARY KEY (logger_num)
);

-- Role Insert
insert into role (role_num, role_name) values (1, "Administrator");
insert into role (role_name) values("Banker");
insert into role (role_name) values("Customer");

-- User Creation
insert into users (user_num, username, password, role_num) values (100, "admin", "password", 1);
insert into users (user_num, username, password, role_num) values (101, "banker", "password", 2);
insert into users (user_num, username, password, role_num) values (102, "customer", "password", 3);

-- User info Creation
insert into user_info (user_num) values (100);
insert into user_info (user_num) values (101);
insert into user_info (user_num) values (102);



