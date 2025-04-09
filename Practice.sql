-- Database Creation
create database testDB;

-- Drop Database/ Delete a Database
create database schoolDB;
drop database schoolDB; 

-- Table Creation
 create table Persons(
	PersonID int,
	FirstName varchar(20),
    LastName varchar(20),
    Address varchar(40),
    City varchar(20)
 );

-- SELECT
Select * from Persons;

-- STRUCTURE OF THE TABLE
describe Persons;

-- ALTER TABLE
	-- ADD COLUMN
	alter table Persons add email varchar(20);
	-- DROP COLUMN
    alter table Persons drop column email;
	-- MODIFY COLUMN
    alter table Persons modify column PersonID varchar(5);


-- NOT NULL CONSTRAINT
alter table Persons modify PersonID int not null;

-- MULTIPLE COLUMN WITH UNIQUE CONSTRAINT
alter table Persons add constraint UC_Person 
UNIQUE (PersonID, FirstName);

-- DROP UNIQUE CONSTRAINT
alter table Persons drop index UC_Person;

-- ADD PRIMARY KEY ON MULTIPLE COLUMNS
alter table Persons add constraint Pk_Person primary key 
(PersonID, LastName);

-- DROP PRIMARY KEY
alter table Persons drop primary key;

-- --------------------------------------------------------------------------------------------------











