/*3. Design an ER-diagram for the following scenario, Convert the same into a relational model 
and then solve the following queries. 
Consider a Cricket Tournament “ABC CUP” organized by an organization. In the tournament 
there are many teams are contesting each having a Teamid,Team_Name, City, a coach. Each 
team is uniquely identified by using Teamid. A team can have many Players and a captain. 
Each player is uniquely identified by Playerid, having a Name, and multiple phone 
numbers,age. A player represents only one team. There are many Stadiums to conduct 
matches. Each stadium is identified using Stadiumid, having a stadium_name,Address ( 
involves city,area_name,pincode). A team can play many matches. Each match played 
between the two teams in the scheduled date and time in the predefined Stadium. Each 
match is identified uniquely by using Matchid. Each match won by any of the one team that 
also wants to record in the database. For each match man_of_the match award given to a 
player. 
Execute the following Queries: 
i. Display the youngest player (in terms of age) Name, Team name, age in which he belongs of 
the tournament. 
ii. List the details of the stadium where the maximum number of matches were played. 
iii. List the details of the player who is not a captain but got the man_of _match award at least 
in two matches. 
iv. Display the Team details who won the maximum matches. 
v. Display the team name where all its won matches played in the same stadium.*/

mysql> create table team(TID varchar(10) primary key not null,
    -> TNAME varchar(30) not null,
    -> COACH varchar(40) not null,
    -> CAPTAIN_ID varchar(10) not null,
    -> CITY varchar(30) not null);

mysql> desc team;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| TID        | varchar(10) | NO   | PRI | NULL    |       |
| TNAME      | varchar(30) | NO   |     | NULL    |       |
| COACH      | varchar(40) | NO   |     | NULL    |       |
| CAPTAIN_ID | varchar(10) | NO   |     | NULL    |       |
| CITY       | varchar(30) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+

alter table team add foreign key(CAPTAIN_ID) references player(PID);

mysql> desc team;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| TID        | varchar(10) | NO   | PRI | NULL    |       |
| TNAME      | varchar(30) | NO   |     | NULL    |       |
| COACH      | varchar(40) | NO   |     | NULL    |       |
| CAPTAIN_ID | varchar(10) | NO   | MUL | NULL    |       |
| CITY       | varchar(30) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
mysql> alter table team modify column CAPTAIN_ID varchar(10);

mysql> desc team;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| TID        | varchar(10) | NO   | PRI | NULL    |       |
| TNAME      | varchar(30) | NO   |     | NULL    |       |
| COACH      | varchar(40) | NO   |     | NULL    |       |
| CAPTAIN_ID | varchar(10) | YES  | MUL | NULL    |       |
| CITY       | varchar(30) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+

mysql> insert into team values("123","csk","laxman",NULL,"chennai");
mysql> insert into team values("124","rcb","sunil",NULL,"bangalore");
mysql> insert into team values("125","royals","singh",NULL,"rajasthan");
mysql> insert into team values("126","derdevils","sehwag",NULL,"delhi");

mysql> select *from team;
+-----+-----------+--------+------------+-----------+
| TID | TNAME     | COACH  | CAPTAIN_ID | CITY      |
+-----+-----------+--------+------------+-----------+
| 123 | csk       | laxman | NULL       | chennai   |
| 124 | rcb       | sunil  | NULL       | bangalore |
| 125 | royals    | singh  | NULL       | rajasthan |
| 126 | derdevils | sehwag | NULL       | delhi     |
+-----+-----------+--------+------------+-----------+
mysql> update team set CAPTAIN_ID="3" where TID="123";
mysql> select *from team;
+-----+-----------+--------+------------+-----------+
| TID | TNAME     | COACH  | CAPTAIN_ID | CITY      |
+-----+-----------+--------+------------+-----------+
| 123 | csk       | laxman | 3          | chennai   |
| 124 | rcb       | sunil  | 1          | bangalore |
| 125 | royals    | singh  | 4          | rajasthan |
| 126 | derdevils | sehwag | 2          | delhi     |
+-----+-----------+--------+------------+-----------+

mysql> create table player(PID varchar(10) primary key not null,
    -> PNAME varchar(30) not null,
    -> AGE int(2) not null,
    -> TID varchar(10),foreign key(TID)references team(TID));

mysql> desc player;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| PID   | varchar(10) | NO   | PRI | NULL    |       |
| PNAME | varchar(30) | NO   |     | NULL    |       |
| AGE   | int         | NO   |     | NULL    |       |
| TID   | varchar(10) | YES  | MUL | NULL    |       |
+-------+-------------+------+-----+---------+-------+

mysql> insert into player values("1","sachin",33,"123");;
mysql> insert into player values("2","dravid",32,"124");
mysql> insert into player values("3","dhoni",30,"124");
mysql> insert into player values("4","raina",30,"125");
mysql> insert into player values("5","jadeja",23,"126");

mysql> select *from player;
+-----+--------+-----+------+
| PID | PNAME  | AGE | TID  |
+-----+--------+-----+------+
| 1   | sachin |  33 | 123  |
| 2   | dravid |  32 | 124  |
| 3   | dhoni  |  30 | 124  |
| 4   | raina  |  30 | 125  |
| 5   | jadeja |  23 | 126  |
+-----+--------+-----+------+
mysql> update player set TID="123" where PID="3";

mysql> select *from player;
+-----+--------+-----+------+
| PID | PNAME  | AGE | TID  |
+-----+--------+-----+------+
| 1   | sachin |  33 | 123  |
| 2   | dravid |  32 | 124  |
| 3   | dhoni  |  30 | 123  |
| 4   | raina  |  30 | 125  |
| 5   | jadeja |  23 | 126  |
+-----+--------+-----+------+


mysql> create table stadium(SID varchar(10) primary key not null,
    -> SNAME varchar(30) not null,
    -> PINCODE int(6) not null,
    -> CITY varchar(20) not null,
    -> AREA varchar(20) not null);

mysql> desc stadium;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| SID     | varchar(10) | NO   | PRI | NULL    |       |
| SNAME   | varchar(30) | NO   |     | NULL    |       |
| PINCODE | int         | NO   |     | NULL    |       |
| CITY    | varchar(20) | NO   |     | NULL    |       |
| AREA    | varchar(20) | NO   |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
mysql> insert into stadium values("111","chinnaswamy",56001,"bangalore","mgroad");
mysql> insert into stadium values("222","kotla",56001,"delhi","highway");
mysql> insert into stadium values("333","international",88801,"chennai","Tr nagar");
mysql> insert into stadium values("444","ksca",56098,"bangalore","peenya");
mysql> insert into stadium values("555","csca",609035,"coachin","beach road");

mysql> select *from stadium;
+-----+---------------+---------+-----------+------------+
| SID | SNAME         | PINCODE | CITY      | AREA       |
+-----+---------------+---------+-----------+------------+
| 111 | chinnaswamy   |   56001 | bangalore | mgroad     |
| 222 | kotla         |   56001 | delhi     | highway    |
| 333 | international |   88801 | chennai   | Tr nagar   |
| 444 | ksca          |   56098 | bangalore | peenya     |
| 555 | csca          |  609035 | coachin   | beach road |
+-----+---------------+---------+-----------+------------+

mysql> create table matches(MID varchar(10) primary key not null,
    -> MDATE date,
    -> TIME time,
    -> SID varchar(10),foreign key(SID)references stadium(SID),
    -> TEAM1_ID varchar(10),foreign key(TEAM1_ID)references team(TID),TEAM2_ID varchar(10),foreign key(TEAM2_ID)references team(TID),
    -> WINNING_TEAM_ID varchar(10),foreign key(WINNING_TEAM_ID)references team(TID),
    -> MAN_OF_MATCH varchar(20),foreign key(MAN_OF_MATCH)references player(PID));

mysql> desc matches;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| MID             | varchar(10) | NO   | PRI | NULL    |       |
| MDATE           | date        | YES  |     | NULL    |       |
| TIME            | time        | YES  |     | NULL    |       |
| SID             | varchar(10) | YES  | MUL | NULL    |       |
| TEAM1_ID        | varchar(10) | YES  | MUL | NULL    |       |
| TEAM2_ID        | varchar(10) | YES  | MUL | NULL    |       |
| WINNING_TEAM_ID | varchar(10) | YES  | MUL | NULL    |       |
| MAN_OF_MATCH    | varchar(20) | YES  | MUL | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
mysql> insert into matches values("101","2010-01-17","10","111","123","124","123","1");
mysql> insert into matches values("102","2010-01-17","10","222","124","126","126","5");
mysql> insert into matches values("103","2012-07-18","11","111","125","126","126","5");
mysql> insert into matches values("104","2015-06-17","2","111","125","123","123","1");

mysql> select *from matches;
+-----+------------+----------+------+----------+----------+-----------------+--------------+
| MID | MDATE      | TIME     | SID  | TEAM1_ID | TEAM2_ID | WINNING_TEAM_ID | MAN_OF_MATCH |
+-----+------------+----------+------+----------+----------+-----------------+--------------+
| 101 | 2010-01-17 | 00:00:10 | 111  | 123      | 124      | 123             | 1            |
| 102 | 2010-01-17 | 00:00:10 | 222  | 124      | 126      | 126             | 5            |
| 103 | 2012-07-18 | 00:00:11 | 111  | 125      | 126      | 126             | 5            |
| 104 | 2015-06-17 | 00:00:02 | 111  | 125      | 123      | 123             | 1            |
+-----+------------+----------+------+----------+----------+-----------------+--------------+
mysql> update matches set TIME="10:00:00" where MID= "102";

mysql> select *from matches;
+-----+------------+----------+------+----------+----------+-----------------+--------------+
| MID | MDATE      | TIME     | SID  | TEAM1_ID | TEAM2_ID | WINNING_TEAM_ID | MAN_OF_MATCH |
+-----+------------+----------+------+----------+----------+-----------------+--------------+
| 101 | 2010-01-17 | 10:00:00 | 111  | 123      | 124      | 123             | 1            |
| 102 | 2010-01-17 | 10:00:00 | 222  | 124      | 126      | 126             | 5            |
| 103 | 2012-07-18 | 11:00:00 | 111  | 125      | 126      | 126             | 5            |
| 104 | 2015-06-17 | 02:00:00 | 111  | 125      | 123      | 123             | 1            |
+-----+------------+----------+------+----------+----------+-----------------+--------------+

mysql> insert into matches values("105","2018-03-09","07:30:00","333","123","126","123","3");

mysql> select *from matches;
+-----+------------+----------+------+----------+----------+-----------------+--------------+
| MID | MDATE      | TIME     | SID  | TEAM1_ID | TEAM2_ID | WINNING_TEAM_ID | MAN_OF_MATCH |
+-----+------------+----------+------+----------+----------+-----------------+--------------+
| 101 | 2010-01-17 | 10:00:00 | 111  | 123      | 124      | 123             | 1            |
| 102 | 2010-01-17 | 10:00:00 | 222  | 124      | 126      | 126             | 5            |
| 103 | 2012-07-18 | 11:00:00 | 111  | 125      | 126      | 126             | 5            |
| 104 | 2015-06-17 | 02:00:00 | 111  | 125      | 123      | 123             | 1            |
| 105 | 2018-03-09 | 07:30:00 | 333  | 123      | 126      | 123             | 3            |
+-----+------------+----------+------+----------+----------+-----------------+--------------+
mysql> create table player_phone(PID varchar(10),foreign key(PID)references player(PID),
    -> phone varchar(10) primary key not null);

mysql> desc player_phone;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| PID   | varchar(10) | YES  | MUL | NULL    |       |
| phone | varchar(10) | NO   | PRI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
mysql> insert into player_phone values("1","9874563210");
mysql> insert into player_phone values("2","9103265475");
mysql> insert into player_phone values("3","9876543210");

mysql> select *from player_phone;
+------+------------+
| PID  | phone      |
+------+------------+
| 1    | 9874563210 |
| 2    | 9103265475 |
| 3    | 9876543210 |
+------+------------+

i. Display the youngest player (in terms of age) Name, Team name, age in which he belongs of
the tournament.

mysql> select PNAME,TNAME,AGE
    -> from player p,team t
    -> where p.TID=t.TID and AGE in(select min(AGE)
    ->                              from player);
+--------+-----------+-----+
| PNAME  | TNAME     | AGE |
+--------+-----------+-----+
| jadeja | derdevils |  23 |
+--------+-----------+-----+

ii. List the details of the stadium where the maximum number of matches were played.

mysql> select * from stadium where SID =(select SID              
    ->                                   from matches              
    ->                                   group by SID              
    ->                                   order by count(*) desc limit 1);
    ->                                     
+-----+-------------+---------+-----------+--------+
| SID | SNAME       | PINCODE | CITY      | AREA   |
+-----+-------------+---------+-----------+--------+
| 111 | chinnaswamy |   56001 | bangalore | mgroad |
+-----+-------------+---------+-----------+--------+

iii. List the details of the player who is not a captain but got the man_of _match award at least in two matches.

mysql> select *
    -> from player
    -> where PID not in(select CAPTAIN_ID
    ->                  from team)and PID in(select MAN_OF_MATCH 
    ->                                       from matches
    ->                                       group by MAN_OF_MATCH having count(*)>=2);
    
+-----+--------+-----+------+
| PID | PNAME  | AGE | TID  |
+-----+--------+-----+------+
| 5   | jadeja |  23 | 126  |
+-----+--------+-----+------+

iv. Display the Team details who won the maximum matches.

mysql> select *
    -> from team
    -> where TID=(select WINNING_TEAM_ID
    ->              from matches
    ->              group by WINNING_TEAM_ID
    ->              order by count(WINNING_TEAM_ID) desc limit 1);
+-----+-------+--------+------------+---------+
| TID | TNAME | COACH  | CAPTAIN_ID | CITY    |
+-----+-------+--------+------------+---------+
| 123 | csk   | laxman | 3          | chennai |
+-----+-------+--------+------------+---------+

mysql> select *
    -> from team
    -> where TID in (select WINNING_TEAM_ID
    ->               from matches
                     group by WINNING_TEAM_ID
                     having count(WINNING_TEAM_ID)=(select count(*)
                                                    from matches
                                                    group by WINNING_TEAM_ID
                                                    order by count(WINNING_TEAM_ID) desc limit 1));
                                                    
v. Display the team name where all its won matches played in the same stadium.

mysql> select m.WINNING_TEAM_ID
    -> from matches m,team t,stadium s
    -> where m.WINNING_TEAM_ID=t.TID and m.SID=s.SID
    -> group by WINNING_TEAM_ID
    -> having count(distinct m.SID)>1;
+-----------------+
| WINNING_TEAM_ID |
+-----------------+
| 123             |
| 126             |
+-----------------+
