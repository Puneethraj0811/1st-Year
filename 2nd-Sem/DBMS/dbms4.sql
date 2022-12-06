/*4. Design an ER-diagram for the following scenario, Convert the same into a relational model,
normalize Relations into a suitable Normal form and then solve the following queries. A
country can have many Tourist places . Each Tourist place is identified by using
tourist_place_id, having a name, belongs to a state, Number of kilometers away from the
capital city of that state,history. There are many Tourists visits tourist places every year.
Each tourist is identified uniquely by using Tourist_id, having a Name, age, Country and
multiple emailids. A tourist visits many Tourist places, it is also required to record the
visted_date in the database. A tourist can visit a Tourist place many times at different dates.
A Tourist place can be visited by many tourists either in the same date or at different dates.
Queries:
i. List the state name which is having maximum number of tourist places.
ii. List details of Tourist place where maximum number of tourists visited.
iii. List the details of tourists visited all tourist places of the state “KARNATAKA”.
iv. Display the details of the tourists visited at least one tourist place of the state, but visited
all states tourist places.
v. Display the details of the tourist place visited by the tourists of all country.*/

mysql> create table TOURIST_PLACE(tpid varchar(10) primary key,
    -> tplace varchar(40) not null,
    -> state varchar(20) not null,
    -> kilometers int(4) not null,
    -> history varchar(30));

mysql> desc TOURIST_PLACE;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| tpid       | varchar(10) | NO   | PRI | NULL    |       |
| tplace     | varchar(40) | NO   |     | NULL    |       |
| state      | varchar(20) | NO   |     | NULL    |       |
| kilometers | int         | NO   |     | NULL    |       |
| history    | varchar(30) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+

mysql> insert into TOURIST_PLACE values("tp1","Hampi","Karnataka",250,"Temples");
mysql> insert into TOURIST_PLACE values("tp2","Mangalore","Karnataka",75,"Fishes");
mysql> insert into TOURIST_PLACE values("tp3","Bijapura","Karnataka",450,"Golgumbaz");
mysql> update TOURIST_PLACE set kilometers=650 where tpid="tp2";
mysql> insert into TOURIST_PLACE values("tp4","Goa","Goa",350,"Beach");
mysql> insert into TOURIST_PLACE values("tp5","Kodagu","Karntaka",80,"Goldan Temple");
mysql> insert into TOURIST_PLACE values("tp6","Ooty","Tamilnadu",200,"Waterfalls");

mysql> select *from TOURIST_PLACE;
+------+-----------+-----------+------------+---------------+
| tpid | tplace    | state     | kilometers | history       |
+------+-----------+-----------+------------+---------------+
| tp1  | Hampi     | Karnataka |        250 | Temples       |
| tp2  | Mangalore | Karnataka |        650 | Fishes        |
| tp3  | Bijapura  | Karnataka |        450 | Golgumbaz     |
| tp4  | Goa       | Goa       |        350 | Beach         |
| tp5  | Kodagu    | Karntaka  |         80 | Goldan Temple |
| tp6  | Ooty      | Tamilnadu |        200 | Waterfalls    |
+------+-----------+-----------+------------+---------------+

mysql> create table TOURIST(tid varchar(10) primary key,
    -> tname varchar(40) not null,
    -> age int(3) not null,
    -> country varchar(30));

mysql> desc TOURIST;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| tid     | varchar(10) | NO   | PRI | NULL    |       |
| tname   | varchar(40) | NO   |     | NULL    |       |
| age     | int         | NO   |     | NULL    |       |
| country | varchar(30) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+

mysql> insert into TOURIST values("t1","Yashwin",45,"India");
mysql> insert into TOURIST values("t2","Ben Stokes",30,"India");
mysql> update TOURIST set country="Australia" where tid="t2";
mysql> insert into TOURIST values("t3","Jos Butler",33,"England");
mysql> insert into TOURIST values("t4","Smrithi",25,"India");
mysql> insert into TOURIST values("t5","Chris Gayle",43,"West Indies");
mysql> select *from TOURIST;
+-----+-------------+-----+-------------+
| tid | tname       | age | country     |
+-----+-------------+-----+-------------+
| t1  | Yashwin     |  45 | India       |
| t2  | Ben Stokes  |  30 | Australia   |
| t3  | Jos Butler  |  33 | England     |
| t4  | Smrithi     |  25 | India       |
| t5  | Chris Gayle |  43 | West Indies |
+-----+-------------+-----+-------------+


mysql> create table EMAIL(tid varchar(10),foreign key(tid) references TOURIST(tid), 
    -> emailid varchar(50) primary key);
    
mysql> desc EMAIL;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| tid     | varchar(10) | YES  | MUL | NULL    |       |
| emailid | varchar(50) | NO   | PRI | NULL    |       |
+---------+-------------+------+-----+---------+-------+

mysql> create table VISIT(vdate date,
    -> tid varchar(10),foreign key(tid) references TOURIST(tid),
    -> tpid varchar(10),foreign key(tpid) references TOURIST_PLACE(tpid));

mysql> desc VISIT;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| vdate | date        | YES  |     | NULL    |       |
| tid   | varchar(10) | YES  | MUL | NULL    |       |
| tpid  | varchar(10) | YES  | MUL | NULL    |       |
+-------+-------------+------+-----+---------+-------+

mysql> insert into VISIT values("2018-09-25","t1","tp1");
mysql> insert into VISIT values("2020-07-31","t4","tp1");
mysql> insert into VISIT values("2021-06-17","t2","tp1");
mysql> insert into VISIT values("2017-07-10","t2","tp2");
mysql> insert into VISIT values("2018-03-28","t2","tp5");
mysql> insert into VISIT values("2016-01-22","t2","tp3");
mysql> insert into VISIT values("2020-06-24","t5","tp3");
mysql> insert into VISIT values("2012-08-29","t4","tp4");
mysql> insert into VISIT values("2016-08-30","t3","tp1");
mysql> insert into VISIT values("2015-02-14","t5","tp1");
mysql> select *from VISIT;
+------------+------+------+
| vdate      | tid  | tpid |
+------------+------+------+
| 2018-09-25 | t1   | tp1  |
| 2020-07-31 | t4   | tp1  |
| 2021-06-17 | t2   | tp1  |
| 2017-07-10 | t2   | tp2  |
| 2018-03-28 | t2   | tp5  |
| 2016-01-22 | t2   | tp3  |
| 2020-06-24 | t5   | tp3  |
| 2012-08-29 | t4   | tp4  |
| 2016-08-30 | t3   | tp1  |
| 2015-02-14 | t5   | tp1  |
+------------+------+------+

i. List the state name which is having maximum number of tourist places.

mysql> select state
    -> from TOURIST_PLACE
    -> group by state 
    -> order by count(state) desc limit 1;
+-----------+
| state     |
+-----------+
| Karnataka |
+-----------+

or

mysql> select state,count(tpid)
    -> from TOURIST_PLACE
    -> group by state
    -> order by count(tpid) desc limit 1;
+-----------+-------------+
| state     | count(tpid) |
+-----------+-------------+
| Karnataka |           3 |
+-----------+-------------+

or

mysql> select state 
    -> from TOURIST_PLACE
    -> group by state
    -> having count(*)=(select count(*)
    ->                  from TOURIST_PLACE
    ->                  group by state
    ->                  order by count(state)
    ->                  desc limit 1);
+-----------+
| state     |
+-----------+
| Karnataka |
+-----------+


ii. List details of Tourist place where maximum number of tourists visited.

mysql> select * 
    -> from TOURIST_PLACE 
    -> where tpid =(select tpid               
    ->              from VISIT               
    ->              group by tpid               
    ->              order by count(tpid) desc limit 1);
+------+--------+-----------+------------+---------+
| tpid | tplace | state     | kilometers | history |	
+------+--------+-----------+------------+---------+
| tp1  | Hampi  | Karnataka |        250 | Temples |
+------+--------+-----------+------------+---------+

mysql> select TOURIST_PLACE.tpid,tplace,state,count(tid)
    -> from TOURIST_PLACE,VISIT 
    -> where VISIT.tpid=TOURIST_PLACE.tpid
    -> group by VISIT.tpid
    -> order by count(VISIT.tpid)desc limit 1;
+------+--------+-----------+------------+
| tpid | tplace | state     | count(tid) |
+------+--------+-----------+------------+
| tp1  | Hampi  | Karnataka |          5 |
+------+--------+-----------+------------+

iii. List the details of tourists visited all tourist places of the state “KARNATAKA”.

mysql> select * 
    -> from TOURIST 
    -> where tid in(select tid              
    ->              from VISIT,TOURIST_PLACE              
    ->              where VISIT.tpid=TOURIST_PLACE.tpid and state="Karnataka"                
    ->              group by tid               
    ->              having count(state) in (select count(state)                
    ->                                      from TOURIST_PLACE                  
    ->                                      where state="Karnataka"));
+-----+------------+-----+-----------+
| tid | tname      | age | country   |
+-----+------------+-----+-----------+
| t2  | Ben Stokes |  30 | Australia |
+-----+------------+-----+-----------+

mysql> select *
    -> from VISIT;
+------------+------+------+
| vdate      | tid  | tpid |
+------------+------+------+
| 2018-09-25 | t1   | tp1  |
| 2020-07-31 | t4   | tp1  |
| 2021-06-17 | t2   | tp1  |
| 2017-07-10 | t2   | tp2  |
| 2018-03-28 | t2   | tp5  |
| 2016-01-22 | t2   | tp3  |
| 2020-06-24 | t5   | tp3  |
| 2012-08-29 | t4   | tp4  |
| 2016-08-30 | t3   | tp1  |
| 2015-02-14 | t5   | tp1  |
| 2020-08-30 | t1   | tp2  |
| 2017-08-08 | t1   | tp3  |
| 2019-03-10 | t1   | tp5  |
+------------+------+------+

mysql> select * 
    -> from TOURIST 
    -> where tid in(select tid              
    ->              from VISIT,TOURIST_PLACE              
    ->              where VISIT.tpid=TOURIST_PLACE.tpid and state="Karnataka"                
    ->              group by tid               
    ->              having count(state) in (select count(state)                
    ->                                      from TOURIST_PLACE                  
    ->                                      where state="Karnataka"));
+-----+------------+-----+-----------+
| tid | tname      | age | country   |
+-----+------------+-----+-----------+
| t1  | Yashwin    |  45 | India     |
| t2  | Ben Stokes |  30 | Australia |
+-----+------------+-----+-----------+
(/*do not repeat the entry in the table for above query.*/)

(/*we can repeat the entry in tables for below query*/)

mysql> select * 
    -> from TOURIST 
    -> where tid in(select tid              
    ->              from VISIT,TOURIST_PLACE              
    ->              where VISIT.tpid=TOURIST_PLACE.tpid and state="Karnataka"                
    ->              group by tid               
    ->              having count(distinct TOURIST_PLACE.tpid) in (select count(tpid)                
    ->                                                            from TOURIST_PLACE                                      
    ->                                                            where state="Karnataka"));
+-----+------------+-----+-----------+
| tid | tname      | age | country   |
+-----+------------+-----+-----------+
| t1  | Yashwin    |  45 | India     |
| t2  | Ben Stokes |  30 | Australia |
+-----+------------+-----+-----------+

iv. Display the details of the tourists visited at least one tourist place of the state, but visited
all states tourist places.

mysql> select * 
    -> from TOURIST 
    -> where tid in(select tid              
    ->              from VISIT,TOURIST_PLACE              
    ->              where VISIT.tpid=TOURIST_PLACE.tpid
    ->              group by tid           
    ->              having count(distinct state) in (select count(distinct state)                
    ->                                               from TOURIST_PLACE));
+-----+---------+-----+---------+
| tid | tname   | age | country |
+-----+---------+-----+---------+
| t1  | Yashwin |  45 | India   |
+-----+---------+-----+---------+

v. Display the details of the tourist place visited by the tourists of all country.

mysql> select *
    -> from TOURIST_PLACE
    -> where tpid in(select tpid
    ->               from VISIT,TOURIST
    ->               where VISIT.TID=TOURIST.tid
    ->               group by tpid
    ->               having count(distinct country) in (select  count(distinct country)
    ->                                                  from TOURIST));
+------+--------+-----------+------------+---------+
| tpid | tplace | state     | kilometers | history |
+------+--------+-----------+------------+---------+
| tp1  | Hampi  | Karnataka |        250 | Temples |
+------+--------+-----------+------------+---------+
