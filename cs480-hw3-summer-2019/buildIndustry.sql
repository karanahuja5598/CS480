DROP DATABASE IF EXISTS Industry;

-- Your code starts here
CREATE DATABASE Industry;
USE Industry;

CREATE TABLE Employee (
	PERSON_NAME 	VARCHAR(40) NOT NULL,
	STREET 			VARCHAR(40),
	CITY			VARCHAR(40),
	PRIMARY KEY (PERSON_NAME)
);

CREATE TABLE Company (
	COMPANY_NAME 	VARCHAR(40) NOT NULL,
  CITY			VARCHAR(40),
	PRIMARY KEY (COMPANY_NAME)
);

CREATE TABLE Employment (
	PERSON_NAME 	VARCHAR(40) NOT NULL,
	COMPANY_NAME 	VARCHAR(40),
	SALARY			  NUMERIC(9,2),
	PRIMARY KEY (PERSON_NAME, COMPANY_NAME)
);


-- Your code ends here 

show tables;
