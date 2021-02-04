# dreamhome

The dreamhome database from *Database Systems: A Practical Approach to Design, Implementation, and Management (6th Edition).*

*Database Systems: A Practical Approach to Design, Implementation, and Management* (https://www.amazon.com/Database-Systems-Practical-Implementation-Management/dp/0132943263) was my textbook for Baruch College's CIS 9340 course, Database Management Systems. Throughout the text, the dreamhome database is used for nearly all examples.

To practice SQL queries, I manually created this database from the tables in the textbook. Now, instead of typing everything out, you can conveniently download and load this database into your favorite DBMS by cloning this repository.

The database_files directory contains a file of SQL statements that will create the tables, as well as .csv files for all tables. **I have only tested these SQL statements in Postgres.**

Alternatively (and more efficiently), with Postgres, you can just restore the entire database all at once from the dreamhome.sql file.

For more information on using Postgres, see: https://www.postgresqltutorial.com/
