create database bookstoredbm;
use bookstoredbm;
create table books(
bookid int,
booktitle varchar(50),
authorname varchar(50),
publisheraddress varchar(50),
category varchar(50),
price decimal (10,2)
);

insert into books(bookid, booktitle, authorname, publisheraddress, category, price)
values
(1, 'Database Design', 'Aryan Gopal', '123 Tech st.', 'Education', 50.00),
(2, 'web development', 'Jyoti chirag', '456 code ave.', 'programming', 40.50),
(3, 'Database Design', 'Aryan Gopal', '123 Tech st.', 'Education', 50.00);

select *from books;

create table books_1NF(
bookid int,
booktitle varchar(50),
authorname varchar(50),
publisheraddress varchar(50),
category varchar(50),
price decimal (10,2),
primary key (bookid, authorname) -- composite primary key
);

insert into books_1NF (bookid,booktitle, authorname, publisheraddress, category, price)
values
 (1, 'Database Design', 'Aryan Gopal', '123 Tech st.', 'Education', 50.00),
(2, 'web development','Jyoti Chirag', '456 code ave.', 'programming', 40.50);

select* from books_1NF;

create table books_2NF(
bookid int primary key,
book_title varchar(50),
category varchar (50),
price decimal(10,2)
);
insert into books_2NF(bookid, book_title, category, price)
values 
(1, 'Database Design', 'Education', 50.00),
(2, 'web development', 'programming', 40.00);
select * from books_2NF;
create table author_2NF(
Author_id int auto_increment primary key,
author_name varchar (50),
bookid int,
foreign key (bookid) references books_2NF (bookid)
);
drop table author_2NF;
insert into author_2NF( bookid, author_name)
values
(1, 'Aryan Gopal'), 
(2, 'Jyoti Chirag');
select * from Author_2NF; 

create table publisher_2NF( 
publisher_id int auto_increment primary key,
publisher_address varchar (255),
bookid int,
foreign key (bookid) references books_2NF (bookid)
);

insert into publisher_2NF (publisher_address, bookid)
values
('123 tech st.', 1),
('456 code st.', 2);

select * from publisher_2NF;

create table books_3NF(
bookid int primary key,
book_title varchar(50),
category varchar (50),
price decimal(10,2)
);
insert into books_3NF(bookid, book_title, category, price)
values 
(1, 'Database Design', 'Education', 50.00),
(2, 'web development', 'programming', 40.00);
create table author_3NF(
Author_id int auto_increment primary key,
author_name varchar (50),
bookid int,
foreign key (bookid) references books_3NF (bookid)
);

insert into author_3NF( bookid, author_name)
values
(1, 'Aryan Gopal'), 
(2, 'Jyoti Chirag');
select * from Author_3NF; 
create table publisher_3NF( 
publisher_id int auto_increment primary key,
publisher_address varchar (255),
bookid int,
foreign key (bookid) references books_3NF (bookid)
);

insert into publisher_3NF (publisher_address, bookid)
values
('123 tech st.', 1),
('456 code st.', 2);
select * from publisher_3NF;

create table book_publishers(
bookid int, 
publisher_id int,
primary key (bookid),
foreign key (bookid) references books_3NF (bookid),
foreign key (publisher_id) references publisher_3NF (publisher_id)
);
insert into book_publishers (bookid, publisher_id)
values
(1, 1),
(2,2);