## beginning of sql 
show databases;
show tables;


create database customers;

#Create table in databases
create table customer_info(id integer, first_name varchar (10),
last_name varchar (10));

select * from customer_info;
insert into customer_info (id,first_name, last_name) 
values 
(1,"krish","naik"),
(2,"deepak","sharma"),
(3,"komal","jain"),
(4,"kashish","jain");

drop table customer_info;

show tables;

drop database customers;

show databases;

use customers;
#Create Customer_info Table
create table customer_info(
id integer auto_increment,
first_name varchar (25),
last_name varchar(25),
salary integer,
primary key (id)
);

select * from customer_info;

##insert records in table
insert into customer_info (fist_name,last_name,salary)
values
("John","Daniel",50000),
("Krish","Naik",60000),
("Darius","Bengali",70000),
("Chandan","Sharma",40000),
("Ankit","Sharma",NULL);

select * from customer_info where salary is null;

##sql update statement to replace null values
select * from customer_info ;
update customer_info set salary = 100000 where id = 4;

##SQL delete statement

delete from customer_info where id = 5;

##SQL alter table
##ADD column in existing table 

alter table customer_info add dob integer ;
alter table customer_info add email varchar(24);
alter table customer_info add age int ;
alter table customer_info add name_ varchar(20);
alter table customer_info add abc varchar (30);
alter table customer_info add dob2 date ;

select * from customer_info ;

##Alter table modify column 

alter table customer_info modify dob year;

desc customer_info;


##AAlter table to drop column 
alter table customer_info drop column email;
alter table customer_info drop column dob;
alter table customer_info drop column dob2;
alter table customer_info drop column age;
alter table customer_info drop column name_;
alter table customer_info drop column abc;

/*SQL Constraints -  SQL Contraints
SQL Contraints are used to specify any rules for the records in a table.
Contraints can be used to limit the type of data that can go into a table.
It ensures the accuracy and reliablity of the records in the table , and 
if there is any violation between the contraint and the record action,
the action is aborted . Contraints can be column level or table level.
Coulmn level contrasints apply to a column , and table-level constraints
apply to the whole table.
 
 1.NOT NULL
 2.Unique
 3.Primary Key
 4.Foreign Key
 5.Check
 6.Default
 7.Index
 */
use customers;
 create table student(
 id int not null,
 first_name varchar (25) not null, 
 last_name varchar (30) not null,
 age int 
 
 );
 
 desc student;
 

 alter table student modify age int not null;
 
 create table person(
 id int not null,
 first_name varchar(25) not null,
 last_name varchar (25) not null,
 age int not null,
 unique (id)
 );
 
 insert into person values (2,"Krish1","Naik1",31);
 
select * from person;
 
 desc person;
 use customers;
 alter table person 
 add unique(first_name);
 
 alter table person
 add constraint uc_person unique (age,first_name);
 
 DESC person ;
 
 alter table person 
 drop index uc_person ;
 
 drop table persom1;
 --- Primary key
 create table person1(
 id int not null, 
first_name varchar (25) not null,
last_name varchar (25),
age int,
constraint pk_person  primary key(id,last_name)
);
desc person1;

alter table person1
drop primary key;

alter table person1
add primary key (id);

create table department (
id int not null ,
department_id int not null,
departmemnt_name varchar(25) not null,
primary key (department_id)
);

desc department;


drop table department;

use customers;

alter table department
add foreign key (id) references person(id);

drop table department;
drop table person;


## check constraints 
create table person(
 id int not null,
 first_name varchar(25) not null,
 last_name varchar (25) not null,
 age int,
 salary int,
 primary key(id),
 check(salary>50000)
 );

desc person;

insert into person values (1,"krish","naik",31,30000);

select * from person;

## Defualt constraint 
drop table person;
create table person(
 id int not null,
 first_name varchar(25) not null,
 last_name varchar (25) not null,
 city_name varchar(25) default "Bangalore"
 );

desc person;

alter table person
alter city_name drop default;




/*My SQL Indexes 
CREATE INDEX statement in SQL is used to create indexes in tables.
The indexes are used to retrieve data from the database more quickly than others.
The user can not see the indexes , and they are just used to speed up queries / searches .
Note: Updating the table with indexes takes a lot of time than updating a table without it.
It is bcoz the indexes also need an update.
So, only create indexes on those columns that will be frequently searched against.
*/


use customers;
select * from person;
desc person;

alter table person add city_name varchar(25);

create index index_city_name 
on person (city_name);

alter table person
drop index index_city_name;

alter table person 
add dob date;

create index index_dob_num
on person (dob);

alter table person 
drop index index_dob_num;

alter table person 
drop column dob;

alter table person 
drop column city_name;

desc person;

alter table person
add age int ;

alter table person
drop column age;

alter table person add age int not null;

#(alter table person add primary key(age);)

