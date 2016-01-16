create database EduNext;


show databases;

use EduNext;

create table teacher ( teacher_id int primary key auto_increment, email_id nvarchar(30) NOT NULL, pwd nvarchar(15) NOT NULL, age nvarchar(2) not null, phone nvarchar(10) not null , gender nvarchar(10)  not null, permission int default '2', status char(20) default 'Not Activated' );


create table student ( stud_id int primary key auto_increment, email_id nvarchar(30) NOT NULL, pwd nvarchar(15) NOT NULL, age nvarchar(2) not null, phone nvarchar(10) not null, gender nvarchar(10) not null, permission int default '2',  status char(20) default 'Not Activated' );


create table feedback(id int(2) NOT NULL auto_increment , name nvarchar(20) not null, email nvarchar(50) not null, comment nvarchar(500) not null);


create table  search(cname nvarchar(15) NOT NULL,cperson nvarchar(20) NOT NULL,location nvarchar(20) NOT NULL,phone nvarchar(11) NOT NULL,duration nvarchar(20) not null,cfees nvarchar(10) NOT NULL default "");


create table contact(c_id int primary key auto_increment,fname nvarchar(10) not null, lname nvarchar(10) not null, email_id nvarchar(100) not null, number nvarchar(10) not null, query nvarchar(100) not null);

create table course(course_id int primary key auto_increment, teacher_id int,email_id nvarchar(50),course_name nvarchar(50),file_name nvarchar(50),server_add nvarchar(200) ,FOREIGN KEY (teacher_id) REFERENCES teacher_reg(teacher_id) );

create table admin(adminid nvarchar(10), adminpass nvarchar(10));

insert into admin values ("admin","admin");

create table enrollment(teacher_id int,teacher_email_id nvarchar(50),course_location nvarchar(50),course_name nvarchar(50),stud_id int,stud_email_id nvarchar(50), DATE datetime);

delete from contact where fname is null;

show tables;

describe teacher;
describe student;
describe feedback;
describe search;
describe contact;
describe course;
describe admin; 


drop table teacher;
drop table student;
drop table feedback;
drop table contact;
drop table search;
drop table admin;
drop table course;
drop table enrollment;

alter table teacher add unique key(email_id);


delete from teacher where teacher_id=5;

select * from teacher;
select * from student;	
select *from feedback;
select *from search;
select * from contact;
select * from admin;
select * from course;


delete from student where stud_id =4;


update teacher set permission=1 where teacher_id=4;
update student set permission=1 where stud_id=5;