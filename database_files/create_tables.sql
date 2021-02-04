CREATE TABLE branch
(
	branchNo CHAR(4) PRIMARY KEY,
	street VARCHAR(32),
	city VARCHAR(32),
	postcode VARCHAR(8)
);

CREATE TABLE staff
(
	staffno VARCHAR(4) PRIMARY KEY,
	fname VARCHAR(32),
	lname VARCHAR(32),
	position VARCHAR(32),
	sex CHAR(1),
	dob DATE,
	salary INT,
	branchno CHAR(4),
	FOREIGN KEY (branchno) REFERENCES branch (branchno)
);

CREATE TABLE privateowner
(
	ownerno CHAR(4) PRIMARY KEY,
	fname VARCHAR(32),
	lname VARCHAR(32),
	address VARCHAR(50),
	telno VARCHAR(32),
	email VARCHAR(50),
	password VARCHAR(8)
);

CREATE TABLE client
(
	clientno CHAR(4) PRIMARY KEY,
	fname VARCHAR(32),
	lname VARCHAR(32),
	telno VARCHAR(32),
	preftype VARCHAR(5),
	maxrent INT,
	email VARCHAR(50)
);

CREATE TABLE propertyforrent
(
	propertyno CHAR(4) PRIMARY KEY,
	street VARCHAR(32),
	city VARCHAR(32),
	postcode VARCHAR(8),
	type VARCHAR(5),
	rooms INT,
	rent INT,
	ownerno CHAR(4),
	staffno VARCHAR(4),
	branchno CHAR(4),
	FOREIGN KEY (ownerno) REFERENCES privateowner (ownerno),
	FOREIGN KEY (staffno) REFERENCES staff (staffno),
	FOREIGN KEY (branchno) REFERENCES branch (branchno)
);

CREATE TABLE viewing
(
	view_id INT PRIMARY KEY,
	clientno CHAR(4),
	propertyno CHAR(4),
	viewdate DATE,
	comment VARCHAR(32),
	FOREIGN KEY (clientno) REFERENCES client (clientno),
	FOREIGN KEY (propertyno) REFERENCES propertyforrent (propertyno)
);

CREATE TABLE registration
(
	reg_id INT PRIMARY KEY,
	clientno CHAR(4),
	branchno CHAR(4),
	staffno VARCHAR(4),
	datejoined DATE,
	FOREIGN KEY (clientno) REFERENCES client (clientno),
	FOREIGN KEY (branchno) REFERENCES branch (branchno),
	FOREIGN KEY (staffno) REFERENCES staff (staffno)
);
