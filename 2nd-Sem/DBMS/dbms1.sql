/*1. Create the following tables with properly specifying Primary keys, Foreign keys and solve
the following queries.
BRANCH (Branchid, Branchname, HOD)
STUDENT (USN, Name, Address, Branchid, sem)
BOOK (Bookid, Bookname, Authorid, Publisher, Branchid)
AUTHOR (Authorid, Authorname, Country, age)
BORROW (USN, Bookid, Borrowed_Date)
Execute the following Queries: 
i.List the details of Students who are all studying in 2nd sem MCA. 
ii.List the students who are not borrowed any books. 
iii.Display the USN, Student name, Branch_name, Book_name, Author_name, 
Books_Borrowed_Date of 2nd sem MCA Students who borrowed books. 
iv.Display the number of books written by each Author. 
v.Display the student details who borrowed more than two books. 
vi.Display the student details who borrowed books of more than one Author. 
vii.Display the Book names in descending order of their names. 
viii.List the details of students who borrowed the books which are all published by the same publisher.*/

$mysql -h 192.168.14.71 -u VP21MC030 -p

mysql>create database VP21MC030_college;
mysql>show databases;
mysql>use VP21MC030_college;

mysql>create table branch(branchid varchar(20) primary key not null,
    ->	branchname varchar(30) not null,
    ->	hod varchar(30) not null);
    
mysql> desc branch;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| branchid   | varchar(20) | NO   | PRI | NULL    |       |
| branchname | varchar(30) | NO   |     | NULL    |       |
| hod        | varchar(30) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+

mysql> create table student(usn varchar(10) primary key not null,
    -> name varchar(30) not null,
    -> address varchar(50) not null,
    -> branchid varchar(20),foreign key (branchid) references branch(branchid),
    -> sem varchar(5) not null);

mysql> insert into branch values("b1","MCA","Dr.Vandana");
mysql> insert into branch values("b2","MBA","Dr.Iyer");
mysql> insert into branch values("b3","CS","Dr.Krishna Mohan");
mysql> insert into branch values("b4","Mech","Dr.Manjunath");
mysql> insert into branch values("b5","Civil","Dr.Anand");

mysql> select *from branch;
+----------+------------+------------------+
| branchid | branchname | hod              |
+----------+------------+------------------+
| b1       | MCA        | Dr.Vandana       |
| b2       | MBA        | Dr.Iyer          |
| b3       | CS         | Dr.Krishna Mohan |
| b4       | Mech       | Dr.Manjunath     |
| b5       | Civil      | Dr.Anand         |
+----------+------------+------------------+

mysql> desc student;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| usn      | varchar(10) | NO   | PRI | NULL    |       |
| name     | varchar(30) | NO   |     | NULL    |       |
| address  | varchar(50) | NO   |     | NULL    |       |
| branchid | varchar(20) | YES  | MUL | NULL    |       |
| sem      | varchar(5)  | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

mysql> insert into student values("4VP21MC029","Rithesh","Puttur","b1","2");
mysql> insert into student values("4VP21MC030","Puneethraj","Puttur","b4","4");
mysql> insert into student values("4VP21MC033","Rashmi","Puttur","b3","2");
mysql> insert into student values("4VP21MC046","Mokshith","Puttur","b5","1");
mysql> insert into student values("4VP21MC052","Thushar","Puttur","b2","3");
mysql> select *from student;
+------------+------------+-----------+----------+-----+
| usn        | name       | address   | branchid | sem |
+------------+------------+-----------+----------+-----+
| 4VP21MC029 | Rithesh    | Puttur    | b1       | 2   |
| 4VP21MC030 | Puneethraj | Vittal    | b4       | 4   |
| 4VP21MC033 | Rashmi     | Vittal    | b3       | 2   |
| 4VP21MC046 | Mokshith   | Puttur    | b5       | 1   |
| 4VP21MC052 | Thushar    | Kasargod  | b2       | 3   |
+------------+------------+-----------+----------+-----+

mysql>create table book(bookid varchar(10) primary key not null,
    -> bookname varchar(20) not null,
    -> authorid varchar(10), foreign key (authorid) references author(authorid),
    -> publisher varchar(20) not null,
    -> branchid varchar(20), foreign key (branchid) references branch(branchid));
    
mysql> desc book;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| bookid    | varchar(10) | NO   | PRI | NULL    |       |
| bookname  | varchar(20) | NO   |     | NULL    |       |
| authorid  | varchar(10) | YES  | MUL | NULL    |       |
| publisher | varchar(20) | NO   |     | NULL    |       |
| branchid  | varchar(20) | YES  | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

mysql> insert into book values("BK1","DBMS","A1","PEARSON","b1");
mysql> insert into book values("BK2","Research Methodology","A2","PEARSON","b2");
mysql> insert into book values("BK3","Data Structure","A3","MC Graw Hill");
mysql> insert into book values("BK4","Artificial Intelligence","A4","MC Graw Hill","b4");
mysql> insert into book values("BK5","Thermo Dynamics","A5","Taylor","b5");

mysql> select *from book;
+--------+-------------------------+----------+--------------+----------+
| bookid | bookname                | authorid | publisher    | branchid |
+--------+-------------------------+----------+--------------+----------+
| BK1    | DBMS                    | A1       | PEARSON      | b1       |
| BK2    | Research Methodology    | A2       | PEARSON      | b2       |
| BK3    | Data Structure          | A3       | MC Graw Hill | b3       |
| BK4    | Artificial Intelligence | A4       | MC Graw Hill | b4       |
| BK5    | Thermo Dynamics         | A5       | Taylor       | b5       |
+--------+-------------------------+----------+--------------+----------+

mysql> update book set authorid="A1"
    -> where bookid="BK3";

mysql> select *from book;
+--------+-------------------------+----------+--------------+----------+
| bookid | bookname                | authorid | publisher    | branchid |
+--------+-------------------------+----------+--------------+----------+
| BK1    | DBMS                    | A1       | PEARSON      | b1       |
| BK2    | Research Methodology    | A2       | PEARSON      | b2       |
| BK3    | Data Structure          | A1       | MC Graw Hill | b3       |
| BK4    | Artificial Intelligence | A4       | MC Graw Hill | b4       |
| BK5    | Thermo Dynamics         | A5       | Taylor       | b5       |
+--------+-------------------------+----------+--------------+----------+



mysql>create table author(authorid varchar(10) primary key not null,
    ->	authorname varchar(30) not null,
    ->	country varchar(5) not null,
    ->	age int(2));

mysql> desc author;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| authorid   | varchar(10) | NO   | PRI | NULL    |       |
| authorname | varchar(30) | NO   |     | NULL    |       |
| country    | varchar(5)  | NO   |     | NULL    |       |
| age        | int         | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+

mysql> alter table author modify country varchar(20);

mysql> desc author;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| authorid   | varchar(10) | NO   | PRI | NULL    |       |
| authorname | varchar(30) | NO   |     | NULL    |       |
| country    | varchar(20) | YES  |     | NULL    |       |
| age        | int         | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+

mysql> insert into author values("A1","Remez Elmasrt","Arlinhton",51); 
mysql> insert into author values("A2","Baidyanath Mishra","India",52); 
mysql> insert into author values("A3","Ellis Horowitz","US",41);
mysql> insert into author values("A4","Yunus","Japan",34);
mysql> insert into author values("A5","Deepak Kehamani","India",39);

mysql> select *from author;
+----------+-------------------+-----------+------+
| authorid | authorname        | country   | age  |
+----------+-------------------+-----------+------+
| A1       | Remez Elmasrt     | Arlinhton |   51 |
| A2       | Baidyanath Mishra | India     |   52 |
| A3       | Ellis Horowitz    | US        |   41 |
| A4       | Yunus             | Japan     |   34 |
| A5       | Deepak Kehamani   | India     |   39 |
+----------+-------------------+-----------+------+

mysql> create table borrow(usn varchar(10),foreign key (usn) references student(usn), 
    ->	bookid varchar(10),foreign key (bookid) references book(bookid), 
    ->  borrowed_date date);

mysql> desc borrow;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| usn           | varchar(10) | YES  | MUL | NULL    |       |
| bookid        | varchar(10) | YES  | MUL | NULL    |       |
| borrowed_date | date        | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+

mysql> insert into borrow values("4VP21MC030","BK1","2021-09-20");
mysql> insert into borrow values("4VP21MC033","BK3","2018-12-17");
mysql> insert into borrow values("4VP21MC046","BK4","2019-01-30");
mysql> insert into borrow values("4VP21MC052","BK2","2017-04-12");
mysql> insert into borrow values("4VP21MC033","BK5","2016-05-22");
mysql> insert into borrow values("4VP21MC030","BK4","2014-06-11");

mysql> select *from borrow;
+------------+--------+---------------+
| usn        | bookid | borrowed_date |
+------------+--------+---------------+
| 4VP21MC030 | BK1    | 2021-09-20    |
| 4VP21MC033 | BK3    | 2018-12-17    |
| 4VP21MC046 | BK4    | 2019-01-30    |
| 4VP21MC052 | BK2    | 2017-04-12    |
| 4VP21MC033 | BK5    | 2016-05-22    |
| 4VP21MC030 | BK4    | 2014-06-11    |
+------------+--------+---------------+

mysql> select *from borrow;
+------------+--------+---------------+
| usn        | bookid | borrowed_date |
+------------+--------+---------------+
| 4VP21MC030 | BK1    | 2021-09-20    |
| 4VP21MC033 | BK3    | 2018-12-17    |
| 4VP21MC033 | BK5    | 2016-05-22    |
| 4VP21MC030 | BK4    | 2014-06-11    |
| 4VP21MC029 | BK3    | 2009-09-20    |
| 4VP21MC029 | BK3    | 2009-08-12    |
+------------+--------+---------------+

mysql> update borrow set usn="4VP21MC052"
    -> where bookid="BK5";

mysql> select *from borrow;
+------------+--------+---------------+
| usn        | bookid | borrowed_date |
+------------+--------+---------------+
| 4VP21MC030 | BK1    | 2021-09-20    |
| 4VP21MC033 | BK3    | 2018-12-17    |
| 4VP21MC052 | BK5    | 2016-05-22    |
| 4VP21MC030 | BK4    | 2014-06-11    |
| 4VP21MC029 | BK3    | 2009-09-20    |
| 4VP21MC029 | BK3    | 2009-08-12    |
+------------+--------+---------------+

mysql> insert into borrow values("4VP21MC029","BK5","2009-09-16");

mysql> select *from borrow;
+------------+--------+---------------+
| usn        | bookid | borrowed_date |
+------------+--------+---------------+
| 4VP21MC030 | BK1    | 2021-09-20    |
| 4VP21MC033 | BK3    | 2018-12-17    |
| 4VP21MC052 | BK5    | 2016-05-22    |
| 4VP21MC030 | BK4    | 2014-06-11    |
| 4VP21MC029 | BK3    | 2009-09-20    |
| 4VP21MC029 | BK3    | 2009-08-12    |
| 4VP21MC029 | BK5    | 2009-09-16    |
+------------+--------+---------------+

i.List the details of Students who are all studying in 2nd sem MCA.

mysql> select *
    -> from student
    -> where student.sem="2" and student.branchid=(select branchid
    ->                                             from branch
    ->                                             where branchname="MCA");

or

mysql> select * 
    -> from student where sem="2" and branchid=(select branchid                                             
    ->                                                   from branch
    ->                                                   where branchname="MCA");

+------------+---------+---------+----------+-----+
| usn        | name    | address | branchid | sem |
+------------+---------+---------+----------+-----+
| 4VP21MC029 | Rithesh | Puttur  | b1       | 2   |
+------------+---------+---------+----------+-----+

ii.List the students who are not borrowed any books.

mysql> select name
    -> from student 
    -> where usn not in(select usn
    ->                  from borrow);
+---------+
| name    |
+---------+
| Rithesh |
+---------+

iii.Display the USN, Student name, Branch_name, Book_name,Author_name,Books_Borrowed_Date of 2nd sem MCA Students who borrowed books.

select student.usn,student.name,branch.branchname,book.bookname,author.authorname,borrow.borrowed_date
    -> from student,branch,book,author,borrow
    -> where student.branchid=branch.branchid and branch.branchid=book.branchid and author.authorid=book.authorid and student.usn=borrow.usn and book.bookid=borrow.bookid and student.sem="2" and branch.branchname="MCA";

iv.Display the number of books written by each Author.

mysql> select count(authorid) from book group by authorid;
+-----------------+
| count(authorid) |
+-----------------+
|               2 |
|               1 |
|               1 |
|               1 |
+-----------------+

Along with auhtor

mysql> select author.authorname,count(*) 
    -> from author,book
    -> where author.authorid=book.authorid 
    -> group by author.authorid;
+-------------------+----------+
| authorname        | count(*) |
+-------------------+----------+
| Remez Elmasrt     |        2 |
| Baidyanath Mishra |        1 |
| Yunus             |        1 |
| Deepak Kehamani   |        1 |
+-------------------+----------+

mysql> select author.authorname,count(*) "Number of books" 
    -> from author,book 
    -> where author.authorid=book.authorid 
    -> group by author.authorid;
+-------------------+-----------------+
| authorname        | Number of books |
+-------------------+-----------------+
| Remez Elmasrt     |               2 |
| Baidyanath Mishra |               1 |
| Yunus             |               1 |
| Deepak Kehamani   |               1 |
+-------------------+-----------------+

v.Display the student details who borrowed more than two books.

mysql> select borrow.usn,student.* 
    -> from student,borrow 
    -> where student.usn=borrow.usn 
    -> group by borrow.usn having count(borrow.usn)>1;
+------------+------------+------------+---------+----------+-----+
| usn        | usn        | name       | address | branchid | sem |
+------------+------------+------------+---------+----------+-----+
| 4VP21MC029 | 4VP21MC029 | Rithesh    | Puttur  | b1       | 2   |
| 4VP21MC030 | 4VP21MC030 | Puneethraj | Puttur  | b4       | 4   |
| 4VP21MC033 | 4VP21MC033 | Rashmi     | Puttur  | b3       | 2   |
+------------+------------+------------+---------+----------+-----+

mysql> select borrow.usn,student.* 
    -> from student,borrow 
    -> where student.usn=borrow.usn 
    -> group by borrow.usn having count(borrow.usn)>1;
    
+------------+------------+------------+---------+----------+-----+
| usn        | usn        | name       | address | branchid | sem |
+------------+------------+------------+---------+----------+-----+
| 4VP21MC029 | 4VP21MC029 | Rithesh    | Puttur  | b1       | 2   |
| 4VP21MC030 | 4VP21MC030 | Puneethraj | Puttur  | b4       | 4   |
+------------+------------+------------+---------+----------+-----+

vi.Display the student details who borrowed books of more than one Author.

mysql> select *
    -> from student s
    -> where exists(select br.usn
    ->              from borrow br,book bk
    ->              where br.bookid=bk.bookid and br.usn=s.usn
    ->              group by usn
    ->              having count(distinct authorid)>1);
+------------+------------+---------+----------+-----+
| usn        | name       | address | branchid | sem |
+------------+------------+---------+----------+-----+
| 4VP21MC029 | Rithesh    | Puttur  | b1       | 2   |
| 4VP21MC030 | Puneethraj | Puttur  | b4       | 4   |
+------------+------------+---------+----------+-----+

vii.Display the Book names in descending order of their names.

mysql> select bookname from book order by bookname desc;
+-------------------------+
| bookname                |
+-------------------------+
| Thermo Dynamics         |
| Research Methodology    |
| DBMS                    |
| Data Structure          |
| Artificial Intelligence |
+-------------------------+

viii.List the details of students who borrowed the books which are all published by the same 
publisher.

select * 
from student 
where exists(
             select br.usn 
             from borrow br,book bk
             where br.bookid=bk.bookid
             and br.usn=student.usn
             group by usn
             having count(bk.publisher)=1);
