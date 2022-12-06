/*2. Consider the following schema: 
STUDENT (USN, name, date_of_birth, branch, mark1, mark2, mark3, total, GPA) 
Execute the following queries: 
i. Update the column total by adding the columns mark1, mark2, mark3. 
ii. Find the GPA score of all the students. 
iii. Find the students who born on a particular year of birth from the date_of_birth column. 
iv. List the students who are studying in a particular branch of study. 
v. Find the maximum GPA score of the student branch-wise. 
vi. Find the students whose name starts with the alphabet “S”. 
vii. Find the students whose name ends with the alphabets “AR”. 
viii. Delete the student details whose USN is given as 1001.mysql> create database VP21MC030_stud;*/

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| VP21MC030_college  |
| VP21MC030_sports   |
| VP21MC030_stud     |
| information_schema |
+--------------------+

mysql> create table student(USN varchar(10) primary key not null,
    -> Name varchar(40) not null,
    -> Date_Of_Birth date not null,
    -> Branch varchar(20) not null,
    -> Mark1 int(3),
    -> Mark2 int(3),
    -> Mark3 int(3),
    -> Total int(3),
    -> GPA decimal(3,2));

mysql> desc student;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| USN           | varchar(10)  | NO   | PRI | NULL    |       |
| Name          | varchar(40)  | NO   |     | NULL    |       |
| Date_Of_Birth | date         | NO   |     | NULL    |       |
| Branch        | varchar(20)  | NO   |     | NULL    |       |
| Mark1         | int          | YES  |     | NULL    |       |
| Mark2         | int          | YES  |     | NULL    |       |
| Mark3         | int          | YES  |     | NULL    |       |
| Total         | int          | YES  |     | NULL    |       |
| GPA           | decimal(3,2) | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+

mysql> insert into student(USN,Name,Date_Of_Birth,Branch)values("4VP21MC030","Puneeth Raj","2000-06-11","MCA");
mysql> insert into student(USN,Name,Date_Of_Birth,Branch)values("4VP21MC045","Shruthi","1997-01-02","MBA");
mysql> insert into student(USN,Name,Date_Of_Birth,Branch)values("4VP21MC025","Shreya","2001-04-07","Civil");
mysql> insert into student(USN,Name,Date_Of_Birth,Branch)values("4VP21MC002","Akshay","2001-09-04","Mechanical");
mysql> insert into student(USN,Name,Date_Of_Birth,Branch)values("4VP21MC033","Raashi","1999-08-02","ENC");
mysql> select *from student;
+------------+-------------+---------------+------------+-------+-------+-------+-------+------+
| USN        | Name        | Date_Of_Birth | Branch     | Mark1 | Mark2 | Mark3 | Total | GPA  |
+------------+-------------+---------------+------------+-------+-------+-------+-------+------+
| 4VP21MC002 | Akshay      | 2001-09-04    | Mechanical |  NULL |  NULL |  NULL |  NULL | NULL |
| 4VP21MC025 | Shreya      | 2001-04-07    | Civil      |  NULL |  NULL |  NULL |  NULL | NULL |
| 4VP21MC030 | Puneeth Raj | 2000-06-11    | MCA        |  NULL |  NULL |  NULL |  NULL | NULL |
| 4VP21MC033 | Raashi      | 1999-08-02    | ENC        |  NULL |  NULL |  NULL |  NULL | NULL |
| 4VP21MC045 | Shruthi     | 1997-01-02    | MBA        |  NULL |  NULL |  NULL |  NULL | NULL |
+------------+-------------+---------------+------------+-------+-------+-------+-------+------+

mysql> update student set Mark1="90",Mark2="70",Mark3="90" where USN="4VP21MC002";
mysql> update student set Mark1="90",Mark2="70",Mark3="90" where USN="4VP21MC025";
mysql> update student set Mark1="100",Mark2="100",Mark3="100" where USN="4VP21MC030";
mysql> update student set Mark1="70",Mark2="60",Mark3="25" where USN="4VP21MC033";
mysql> update student set Mark1="55",Mark2="60",Mark3="70" where USN="4VP21MC045";

mysql> insert into student values("4VP21MC034","Rashmi","2001-04-08","CS","78","89","69",NULL,NULL);
mysql> select *from student;
+------------+-------------+---------------+------------+-------+-------+-------+-------+------+
| USN        | Name        | Date_Of_Birth | Branch     | Mark1 | Mark2 | Mark3 | Total | GPA  |
+------------+-------------+---------------+------------+-------+-------+-------+-------+------+
| 4VP21MC002 | Akshay      | 2001-09-04    | Mechanical |    90 |    70 |    90 |  NULL | NULL |
| 4VP21MC025 | Shreya      | 2001-04-07    | Civil      |    90 |    70 |    90 |  NULL | NULL |
| 4VP21MC030 | Puneeth Raj | 2000-06-11    | MCA        |   100 |   100 |   100 |  NULL | NULL |
| 4VP21MC033 | Raashi      | 1999-08-02    | ENC        |    70 |    60 |    25 |  NULL | NULL |
| 4VP21MC034 | Rashmi      | 2001-04-08    | CS         |    78 |    89 |    69 |  NULL | NULL |
| 4VP21MC045 | Shruthi     | 1997-01-02    | MBA        |    55 |    60 |    70 |  NULL | NULL |
+------------+-------------+---------------+------------+-------+-------+-------+-------+------+

i. Update the column total by adding the columns mark1, mark2, mark3.

mysql> update student set Total=Mark1+Mark2+Mark3;
mysql> select *from student;
+------------+-------------+---------------+------------+-------+-------+-------+-------+------+
| USN        | Name        | Date_Of_Birth | Branch     | Mark1 | Mark2 | Mark3 | Total | GPA  |
+------------+-------------+---------------+------------+-------+-------+-------+-------+------+
| 4VP21MC002 | Akshay      | 2001-09-04    | Mechanical |    90 |    70 |    90 |   250 | NULL |
| 4VP21MC025 | Shreya      | 2001-04-07    | Civil      |    90 |    70 |    90 |   250 | NULL |
| 4VP21MC030 | Puneeth Raj | 2000-06-11    | MCA        |   100 |   100 |   100 |   300 | NULL |
| 4VP21MC033 | Raashi      | 1999-08-02    | ENC        |    70 |    60 |    25 |   155 | NULL |
| 4VP21MC034 | Rashmi      | 2001-04-08    | CS         |    78 |    89 |    69 |   236 | NULL |
| 4VP21MC045 | Shruthi     | 1997-01-02    | MBA        |    55 |    60 |    70 |   185 | NULL |
+------------+-------------+---------------+------------+-------+-------+-------+-------+------+

ii. Find the GPA score of all the students.

mysql> alter table student modify column GPA Float;
mysql> desc student;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| USN           | varchar(10) | NO   | PRI | NULL    |       |
| Name          | varchar(40) | NO   |     | NULL    |       |
| Date_Of_Birth | date        | NO   |     | NULL    |       |
| Branch        | varchar(20) | NO   |     | NULL    |       |
| Mark1         | int         | YES  |     | NULL    |       |
| Mark2         | int         | YES  |     | NULL    |       |
| Mark3         | int         | YES  |     | NULL    |       |
| Total         | int         | YES  |     | NULL    |       |
| GPA           | float       | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+

mysql> update student set GPA=Total/3;
mysql> select *from student;
+------------+-------------+---------------+------------+-------+-------+-------+-------+---------+
| USN        | Name        | Date_Of_Birth | Branch     | Mark1 | Mark2 | Mark3 | Total | GPA     |
+------------+-------------+---------------+------------+-------+-------+-------+-------+---------+
| 4VP21MC002 | Akshay      | 2001-09-04    | Mechanical |    90 |    70 |    90 |   250 | 83.3333 |
| 4VP21MC025 | Shreya      | 2001-04-07    | Civil      |    90 |    70 |    90 |   250 | 83.3333 |
| 4VP21MC030 | Puneeth Raj | 2000-06-11    | MCA        |   100 |   100 |   100 |   300 |     100 |
| 4VP21MC033 | Raashi      | 1999-08-02    | ENC        |    70 |    60 |    25 |   155 | 51.6667 |
| 4VP21MC034 | Rashmi      | 2001-04-08    | CS         |    78 |    89 |    69 |   236 | 78.6667 |
| 4VP21MC045 | Shruthi     | 1997-01-02    | MBA        |    55 |    60 |    70 |   185 | 61.6667 |
+------------+-------------+---------------+------------+-------+-------+-------+-------+---------+

iii. Find the students who born on a particular year of birth from the date_of_birth column.

mysql> select Name from student where year(Date_Of_Birth)="2001";

+--------+
| Name   |
+--------+
| Akshay |
| Shreya |
+--------+

iv. List the students who are studying in a particular branch of study.

mysql> select * from student where Branch="MCA";

+------------+-------------+---------------+--------+-------+-------+-------+-------+------+
| USN        | Name        | Date_Of_Birth | Branch | Mark1 | Mark2 | Mark3 | Total | GPA  |
+------------+-------------+---------------+--------+-------+-------+-------+-------+------+
| 4VP21MC030 | Puneeth Raj | 2000-06-11    | MCA    |   100 |   100 |   100 |   300 |  100 |
+------------+-------------+---------------+--------+-------+-------+-------+-------+------+

vi. Find the students whose name starts with the alphabet “S”.

mysql> select name from student where name like "S%";

+---------+
| name    |
+---------+
| Shreya  |
| Shruthi |
+---------+

vii. Find the students whose name ends with the alphabets “AR”.

mysql> insert into student values("4VP21MC001","Amar","1998-07-18","Civil","60","88","59","207","69");
mysql> insert into student values("4VP21MC003","Axar","1997-02-01","","60","88","59","207","69");
mysql> select *from student;
+------------+-------------+---------------+------------+-------+-------+-------+-------+---------+
| USN        | Name        | Date_Of_Birth | Branch     | Mark1 | Mark2 | Mark3 | Total | GPA     |
+------------+-------------+---------------+------------+-------+-------+-------+-------+---------+
| 4VP21MC001 | Amar        | 1998-07-18    | Civil      |    60 |    88 |    59 |   207 |      69 |
| 4VP21MC002 | Akshay      | 2001-09-04    | Mechanical |    90 |    70 |    90 |   250 | 83.3333 |
| 4VP21MC003 | Axar        | 1997-02-01    |            |    60 |    88 |    59 |   207 |      69 |
| 4VP21MC025 | Shreya      | 2001-04-07    | Civil      |    90 |    70 |    90 |   250 | 83.3333 |
| 4VP21MC030 | Puneeth Raj | 2000-06-11    | MCA        |   100 |   100 |   100 |   300 |     100 |
| 4VP21MC033 | Raashi      | 1999-08-02    | ENC        |    70 |    60 |    25 |   155 | 51.6667 |
| 4VP21MC034 | Rashmi      | 2001-04-08    | CS         |    78 |    89 |    69 |   236 | 78.6667 |
| 4VP21MC045 | Shruthi     | 1997-01-02    | MBA        |    55 |    60 |    70 |   185 | 61.6667 |
+------------+-------------+---------------+------------+-------+-------+-------+-------+---------+

mysql> select name from student where name like "%AR";

+------+
| name |
+------+
| Amar |
| Axar |
+------+

viii. Delete the student details whose USN is given as 1001.

mysql> delete from student where USN="4VP21MC002";
mysql> select *from student;
+------------+-------------+---------------+--------+-------+-------+-------+-------+---------+
| USN        | Name        | Date_Of_Birth | Branch | Mark1 | Mark2 | Mark3 | Total | GPA     |
+------------+-------------+---------------+--------+-------+-------+-------+-------+---------+
| 4VP21MC001 | Amar        | 1998-07-18    | Civil  |    60 |    88 |    59 |   207 |      69 |
| 4VP21MC003 | Axar        | 1997-02-01    |        |    60 |    88 |    59 |   207 |      69 |
| 4VP21MC025 | Shreya      | 2001-04-07    | Civil  |    90 |    70 |    90 |   250 | 83.3333 |
| 4VP21MC030 | Puneeth Raj | 2000-06-11    | MCA    |   100 |   100 |   100 |   300 |     100 |
| 4VP21MC033 | Raashi      | 1999-08-02    | ENC    |    70 |    60 |    25 |   155 | 51.6667 |
| 4VP21MC034 | Rashmi      | 2001-04-08    | CS     |    78 |    89 |    69 |   236 | 78.6667 |
| 4VP21MC045 | Shruthi     | 1997-01-02    | MBA    |    55 |    60 |    70 |   185 | 61.6667 |
+------------+-------------+---------------+--------+-------+-------+-------+-------+---------+
