/*5. A country wants to conduct an election for the parliament. A country having many
constituencies. Each constituency is identified uniquely by Constituency_id, having the
Name, belongs to a state,Number_of_voters. A constituency can have many voters. Each voter
is uniquely identified by using Voter_id, having the Name, age, address (involves
Houseno,city,state,pincode). Each voter belongs to only one constituency. There are many
candidates contesting in the election. Each candidates are uniquely identified by using
candidate_id, having Name, phone_no, age, state. A candidate belongs to only one
party.Thereare many parties. Each party is uniquely identified by using Party_id, having
Party_Name,Party_symbol. A candidate can contest from many constituencies under a same
party. A party can have many candidates contesting from different constituencies. No
constituency having the candidates from the same party. A constituency can have many
contesting candidates belongs to different parties. Each voter votes only one candidate of
his/her constituencty.
Queries:
i. List the details of the candidates who are contesting from more than one constituencies
which are belongs to different states.
ii. Display the state name having maximum number of constituencies.
iii. Create a stored procedure to insert the tuple into the voter table by checking the voter
age. If voter’s age is at least 18 years old, then insert the tuple into the voter else display the
“Not an eligible voter msg” .
iv. Create a stored procedure to display the number_of_voters in the specified constituency.
Where the constituency name is passed as an argument to the stored procedure.
v. Create a TRIGGER to UPDATE the count of “ Number_of_voters” of the respective
constituency in “CONSTITUENCY” table , AFTER inserting a tuple into the “VOTERS” table.*/

mysql> create table CONSTITUENCY(const_id varchar(10) primary key,
    -> const_name varchar(30) not null,
    -> state varchar(30) not null,
    -> No_of_voters int(3));
    
mysql> desc CONTITUENCY;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| const_id     | varchar(10) | NO   | PRI | NULL    |       |
| const_name   | varchar(30) | NO   |     | NULL    |       |
| state        | varchar(30) | NO   |     | NULL    |       |
| No_of_voters | int         | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+

mysql> insert into CONSTITUENCY values("co1","Mangalore","Karnataka",75);
mysql> insert into CONSTITUENCY values("co2","Bangalore","Karnataka",120);
mysql> insert into CONSTITUENCY values("co3","Puducheri","Tamilnadu",100);
mysql> insert into CONSTITUENCY values("co4","Thrishul","Kerala",55);
mysql> insert into CONSTITUENCY values("co5","Pune","Maharashtra",133);
mysql> select *from CONSTITUENCY;
+----------+------------+-------------+--------------+
| const_id | const_name | state       | No_of_voters |
+----------+------------+-------------+--------------+
| co1      | Mangalore  | Karnataka   |           75 |
| co2      | Bangalore  | Karnataka   |          120 |
| co3      | Puducheri  | Tamilnadu   |          100 |
| co4      | Thrishul   | Kerala      |           55 |
| co5      | Pune       | Maharashtra |          133 |
+----------+------------+-------------+--------------+

mysql> alter table CONSTITUENCY add cand_id varchar(10),add foreign key(cand_id) references CANDIDATES(cand_id);
mysql> select *from CONSTITUENCY;
+----------+------------+-------------+--------------+---------+
| const_id | const_name | state       | No_of_voters | cand_id |
+----------+------------+-------------+--------------+---------+
| co1      | Mangalore  | Karnataka   |           75 | NULL    |
| co2      | Bangalore  | Karnataka   |          120 | NULL    |
| co3      | Puducheri  | Tamilnadu   |          100 | NULL    |
| co4      | Thrishul   | Kerala      |           55 | NULL    |
| co5      | Pune       | Maharashtra |          133 | NULL    |
+----------+------------+-------------+--------------+---------+

mysql> update CONSTITUENCY set cand_id="ca2" where const_id="co1";
mysql> update CONSTITUENCY set cand_id="ca4" where const_id="co2";
mysql> update CONSTITUENCY set cand_id="ca5" where const_id="co3";
mysql> update CONSTITUENCY set cand_id="ca2" where const_id="co4";
mysql> update CONSTITUENCY set cand_id="ca1" where const_id="co5";
mysql> select *from CONSTITUENCY;
+----------+------------+-------------+--------------+---------+
| const_id | const_name | state       | No_of_voters | cand_id |
+----------+------------+-------------+--------------+---------+
| co1      | Mangalore  | Karnataka   |           75 | ca2     |
| co2      | Bangalore  | Karnataka   |          120 | ca4     |
| co3      | Puducheri  | Tamilnadu   |          100 | ca5     |
| co4      | Thrishul   | Kerala      |           55 | ca2     |
| co5      | Pune       | Maharashtra |          133 | ca1     |
+----------+------------+-------------+--------------+---------+

mysql> create table PARTY(party_id varchar(10) primary key,
    -> pname varchar(40) not null,
    -> psymbol varchar(50) not null,
    -> const_id varchar(10),foreign key(const_id) references CONSTITUENCY(const_id));

mysql> desc PARTY;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| party_id | varchar(10) | NO   | PRI | NULL    |       |
| pname    | varchar(40) | NO   |     | NULL    |       |
| psymbol  | varchar(50) | NO   |     | NULL    |       |
| const_id | varchar(10) | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+

mysql> insert into PARTY values("p1","RS","Rose","co2");
mysql> insert into PARTY values("p2","PRK","Bike","co1");
mysql> insert into PARTY values("p3","SP","Cycle","co3");
mysql> insert into PARTY values("p4","PBM","Apple","co5");
mysql> insert into PARTY values("p5","GKS","Jeep","co4");
mysql> select *from PARTY;
+----------+-------+---------+----------+
| party_id | pname | psymbol | const_id |
+----------+-------+---------+----------+
| p1       | RS    | Rose    | co2      |
| p2       | PRK   | Bike    | co1      |
| p3       | SP    | Cycle   | co3      |
| p4       | PBM   | Apple   | co5      |
| p5       | GKS   | Jeep    | co4      |
+----------+-------+---------+----------+

mysql> create table CANDIDATES(cand_id varchar(10) primary key,
    -> cname varchar(10) not null,
    -> phone int(10) not null,
    -> age int(3) not null,
    -> state varchar(30) not null,
    -> party_id varchar(10),foreign key(party_id) references PARTY(party_id),
    -> const_id varchar(10),foreign key(const_id) references CONSTITUENCY(const_id));
    
mysql> desc CANDIDATES;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| cand_id  | varchar(10) | NO   | PRI | NULL    |       |
| cname    | varchar(10) | NO   |     | NULL    |       |
| phone    | int         | NO   |     | NULL    |       |
| age      | int         | NO   |     | NULL    |       |
| state    | varchar(30) | NO   |     | NULL    |       |
| party_id | varchar(10) | YES  | MUL | NULL    |       |
| const_id | varchar(10) | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+

mysql> insert into CANDIDATES values("ca1","Manohara",963258,30,"Karnataka","p1","co1");
mysql> insert into CANDIDATES values("ca2","Vani",965846,33,"Maharashtra","p3","co4");
mysql> insert into CANDIDATES values("ca3","Gopal",965846,33,"Tamilnadu","p2","co5");
mysql> insert into CANDIDATES values("ca4","Shiva",954784,40,"Kerala","p5","co3");
mysql> insert into CANDIDATES values("ca5","Jayanthi",958644,39,"Tamilnadu","p4","co2");
mysql> select *from CANDIDATES;
+---------+----------+--------+-----+-------------+----------+----------+
| cand_id | cname    | phone  | age | state       | party_id | const_id |
+---------+----------+--------+-----+-------------+----------+----------+
| ca1     | Manohara | 963258 |  30 | Karnataka   | p1       | co1      |
| ca2     | Vani     | 965846 |  33 | Maharashtra | p3       | co4      |
| ca3     | Gopal    | 965846 |  33 | Tamilnadu   | p2       | co5      |
| ca4     | Shiva    | 954784 |  40 | Kerala      | p5       | co3      |
| ca5     | Jayanthi | 958644 |  39 | Tamilnadu   | p4       | co2      |
+---------+----------+--------+-----+-------------+----------+----------+

mysql> create table VOTER(voter_id varchar(10) primary key,
    -> vname varchar(50) not null,
    -> age int(3) not null,
    -> const_id varchar(10),foreign key(const_id) references CONSTITUENCY(const_id),
    -> cand_id varchar(10),foreign key(cand_id) references CANDIDATES(cand_id));

mysql> desc VOTER;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| voter_id | varchar(10) | NO   | PRI | NULL    |       |
| vname    | varchar(50) | NO   |     | NULL    |       |
| age      | int         | NO   |     | NULL    |       |
| const_id | varchar(10) | YES  | MUL | NULL    |       |
| cand_id  | varchar(10) | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
mysql> insert into VOTER values("v1","Rashmi",20,"co1","ca1");
mysql> insert into VOTER values("v2","PuneethRaj",21,"co3","ca4");
mysql> insert into VOTER values("v3","Shruthi",25,"co5","ca2");
mysql> insert into VOTER values("v4","Geetha",25,"co2","ca3");
mysql> insert into VOTER values("v5","Pratheeksha",22,"co4","ca5");
mysql> insert into VOTER values("v6","Vineeth",17,"co1","ca4");
mysql> select *from VOTER;
+----------+-------------+-----+----------+---------+
| voter_id | vname       | age | const_id | cand_id |
+----------+-------------+-----+----------+---------+
| v1       | Rashmi      |  20 | co1      | ca1     |
| v2       | PuneethRaj  |  21 | co3      | ca4     |
| v3       | Shruthi     |  25 | co5      | ca2     |
| v4       | Geetha      |  25 | co2      | ca3     |
| v5       | Pratheeksha |  22 | co4      | ca5     |
| v6       | Vineeth     |  17 | co1      | ca4     |
+----------+-------------+-----+----------+---------+

mysql> create table ADDRESS(voter_id varchar(10),foreign key(voter_id)references VOTER(voter_id),
    -> house_no int(3) not null,
    -> city varchar(30) not null,
    -> state varchar(30) not null,
    -> pincode int(10) not null);

mysql> desc ADDRESS;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| voter_id | varchar(10) | YES  | MUL | NULL    |       |
| house_no | int         | NO   |     | NULL    |       |
| city     | varchar(30) | NO   |     | NULL    |       |
| state    | varchar(30) | NO   |     | NULL    |       |
| pincode  | int         | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

mysql> create table CONTEST(const_id varchar(10),foreign key(const_id) references CONSTITUENCY(const_id),
    -> cand_id varchar(10),foreign key(cand_id) references CANDIDATES(cand_id));

mysql> desc CONTEST;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| const_id | varchar(10) | YES  | MUL | NULL    |       |
| cand_id  | varchar(10) | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+

mysql> insert into CONTEST values("co1","ca1");
mysql> insert into CONTEST values("co3","ca5");
mysql> insert into CONTEST values("co2","ca3");
mysql> insert into CONTEST values("co4","ca2");
mysql> insert into CONTEST values("co5","ca4");
mysql> insert into CONTEST values("co2","ca1");
mysql> insert into CONTEST values("co5","ca1");
mysql> select *from CONTEST;
+----------+---------+
| const_id | cand_id |
+----------+---------+
| co1      | ca1     |
| co3      | ca5     |
| co2      | ca3     |
| co4      | ca2     |
| co5      | ca4     |
| co2      | ca1     |
| co5      | ca1     |
+----------+---------+

i. List the details of the candidates who are contesting from more than one constituencies which are belongs to different states.

mysql> select *
    -> from CANDIDATES
    -> where cand_id in(select CONTEST.cand_id
    ->                  from CONTEST,CONSTITUENCY
    ->                  where CONTEST.const_id=CONSTITUENCY.const_id
    ->                  group by cand_id 
    ->                  having count(distinct(state))>1);
    
+---------+----------+--------+-----+-----------+----------+----------+
| cand_id | cname    | phone  | age | state     | party_id | const_id |
+---------+----------+--------+-----+-----------+----------+----------+
| ca1     | Manohara | 963258 |  30 | Karnataka | p1       | co1      |
+---------+----------+--------+-----+-----------+----------+----------+


ii. Display the state name having maximum number of constituencies.

mysql> select state from CONSTITUENCY group by state having count(state) limit 1;
+-----------+
| state     |
+-----------+
| Karnataka |
+-----------+

iii. Create a stored procedure to insert the tuple into the voter table by checking the voter
age. If voter’s age is at least 18 years old, then insert the tuple into the voter else display the
“Not an eligible voter msg” .

Go through the file proc.sql for run this query

mysql> source proc.sql;

mysql> call proc("v7","Gagan",16,"co3","ca2");
+--------------------+
| display_msg        |
+--------------------+
| Voter not eligible |
+--------------------+

mysql> call proc("v8","Nayana",26,"co4","ca2");
+--------------+
| display_msg  |
+--------------+
| Row inserted |
+--------------+

mysql> select *from VOTER;
+----------+-------------+-----+----------+---------+
| voter_id | vname       | age | const_id | cand_id |
+----------+-------------+-----+----------+---------+
| v1       | Rashmi      |  20 | co1      | ca1     |
| v2       | PuneethRaj  |  21 | co3      | ca4     |
| v3       | Shruthi     |  25 | co5      | ca2     |
| v4       | Geetha      |  25 | co2      | ca3     |
| v5       | Pratheeksha |  22 | co4      | ca5     |
| v6       | Nayana      |  26 | co4      | ca2     |
+----------+-------------+-----+----------+---------+

iv. Create a stored procedure to display the number_of_voters in the specified constituency. Where the constituency name is passed as an argument to 
the stored procedure.

Go through the file abc.sql for run this query

mysql> source abc.sql;

mysql> call abc("Mangalore");
+--------------+
| No_of_voters |
+--------------+
|           75 |
+--------------+

v. Create a TRIGGER to UPDATE the count of “ Number_of_voters” of the respective constituency in “CONSTITUENCY” table , AFTER inserting a tuple into 
the “VOTERS” table.

Go through the file trigg.sql for run this query

mysql> source trigg.sql;

mysql> insert into VOTER values("v7","Gagan",33,"co4","ca2");
    -> $$

mysql> select *from CONSTITUENCY;
    -> $$
+----------+------------+-------------+--------------+---------+
| const_id | const_name | state       | No_of_voters | cand_id |
+----------+------------+-------------+--------------+---------+
| co1      | Mangalore  | Karnataka   |           75 | ca2     |
| co2      | Bangalore  | Karnataka   |          120 | ca4     |
| co3      | Puducheri  | Tamilnadu   |          100 | ca5     |
| co4      | Thrishul   | Kerala      |           65 | ca2     |
| co5      | Pune       | Maharashtra |          133 | ca1     |
+----------+------------+-------------+--------------+---------+

mysql> select *from VOTER;
    -> $$
+----------+-------------+-----+----------+---------+
| voter_id | vname       | age | const_id | cand_id |
+----------+-------------+-----+----------+---------+
| v1       | Rashmi      |  20 | co1      | ca1     |
| v2       | PuneethRaj  |  21 | co3      | ca4     |
| v3       | Shruthi     |  25 | co5      | ca2     |
| v4       | Geetha      |  25 | co2      | ca3     |
| v5       | Pratheeksha |  22 | co4      | ca5     |
| v7       | Gagan       |  33 | co4      | ca2     |
| v8       | Nayana      |  26 | co4      | ca2     |
+----------+-------------+-----+----------+---------+
