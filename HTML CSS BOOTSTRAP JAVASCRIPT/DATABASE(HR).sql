
--------------CREATING THE DATABASE HR--------------

MariaDB [(none)]> create database hr;
Query OK, 1 row affected (0.003 sec)

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| classicmodels      |
| hr                 |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| railways           |
| sakila             |
| test               |
+--------------------+
9 rows in set (0.002 sec)

MariaDB [(none)]> use hr;
Database changed




------------CREATING THE REGIONS TABLE----------------

MariaDB [hr]> create table REGIONS (REGION_ID int not null primary key, REGION_NAME varchar(25));
Query OK, 0 rows affected (0.077 sec)

MariaDB [hr]> desc REGIONS;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| REGION_ID   | int(11)     | NO   | PRI | NULL    |       |
| REGION_NAME | varchar(25) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
2 rows in set (0.161 sec)





---------------CREATING THE COUNTRIES TABLE---------------------

MariaDB [hr]> create table COUNTRIES ( COUNTRY_ID char(2) not null primary key, COUNTRY_NAME varchar(40), REGION_ID int, foreign key(REGION_ID) references REGIONS(REGION_ID));
Query OK, 0 rows affected (0.122 sec)

MariaDB [hr]> desc COUNTRIES;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| COUNTRY_ID   | char(2)     | NO   | PRI | NULL    |       |
| COUNTRY_NAME | varchar(40) | YES  |     | NULL    |       |
| REGION_ID    | int(11)     | YES  | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.019 sec)





--------------CREATING THE LOCATIONS TABLE-------------------

MariaDB [hr]> create table LOCATIONS ( LOCATION_ID int not null primary key, STREET_ADDRESS varchar(40), POSTAL_CODE varchar(12), CITY varchar(30) not null, STATE_PROVINCE varchar(25), COUNTRY_ID char(2), foreign key(COUNTRY_ID) references COUNTRIES(COUNTRY_ID));
Query OK, 0 rows affected (0.120 sec)

MariaDB [hr]> desc LOCATIONS;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| LOCATION_ID    | int(11)     | NO   | PRI | NULL    |       |
| STREET_ADDRESS | varchar(40) | YES  |     | NULL    |       |
| POSTAL_CODE    | varchar(12) | YES  |     | NULL    |       |
| CITY           | varchar(30) | NO   |     | NULL    |       |
| STATE_PROVINCE | varchar(25) | YES  |     | NULL    |       |
| COUNTRY_ID     | char(2)     | YES  | MUL | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
6 rows in set (0.021 sec)




--------------CREATING THE DEPARTMENTS TABLE----------------------

MariaDB [hr]> create table DEPARTMENTS( DEPARTMENT_ID int not null primary key, DEPARTMENT_NAME varchar(30) not null, MANAGER_ID int, LOCATION_ID int, foreign key (LOCATION_ID) references LOCATIONS(LOCATION_ID));
Query OK, 0 rows affected (0.118 sec)

MariaDB [hr]> desc DEPARTMENTS;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| DEPARTMENT_ID   | int(11)     | NO   | PRI | NULL    |       |
| DEPARTMENT_NAME | varchar(30) | NO   |     | NULL    |       |
| MANAGER_ID      | int(11)     | YES  | UNI | NULL    |       |
| LOCATION_ID     | int(11)     | YES  | MUL | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
4 rows in set (0.154 sec)





----------------------CREATING THE JOBS TABLE-------------------------

MariaDB [hr]> create table JOBS( JOB_ID varchar(10) not null primary key, JOB_TITLE varchar(35) not null, MIN_SALARY int, MAX_SALARY int);
Query OK, 0 rows affected (1.697 sec)

MariaDB [hr]> desc JOBS;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| JOB_ID     | varchar(10) | NO   | PRI | NULL    |       |
| JOB_TITLE  | varchar(35) | NO   |     | NULL    |       |
| MIN_SALARY | int(11)     | YES  |     | NULL    |       |
| MAX_SALARY | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.421 sec)





-------------CREATING THE EMPLOYEES TABLE---------------

MariaDB [hr]> create table EMPLOYEES (EMPLOYEE_ID int not null primary key, FIRST_NAME varchar(20)not null, LAST_NAME varchar(25) not null, EMAIL varchar(20) not null,PHONE_NUMBER varchar(20), HIRE_DATE date not null, JOB_ID varchar(10) not null, SALARY float(8,2),check (SALARY>0), COMMISSION_PCT float(2,2), MANAGER_ID int, DEPARTMENT_ID int,foreign key(JOB_ID) references JOBS(JOB_ID), foreign key(DEPARTMENT_ID) references DEPARTMENTS(DEPARTMENT_ID), foreign key(MANAGER_ID) references DEPARTMENTS(MANAGER_ID));
Query OK, 0 rows affected (0.318 sec)

MariaDB [hr]> desc EMPLOYEES;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| EMPLOYEE_ID    | int(11)     | NO   | PRI | NULL    |       |
| FIRST_NAME     | varchar(20) | NO   |     | NULL    |       |
| LAST_NAME      | varchar(25) | NO   |     | NULL    |       |
| EMAIL          | varchar(20) | NO   |     | NULL    |       |
| PHONE_NUMBER   | varchar(20) | YES  |     | NULL    |       |
| HIRE_DATE      | date        | NO   |     | NULL    |       |
| JOB_ID         | varchar(10) | NO   | MUL | NULL    |       |
| SALARY         | float(8,2)  | YES  |     | NULL    |       |
| COMMISSION_PCT | float(2,2)  | YES  |     | NULL    |       |
| MANAGER_ID     | int(11)     | YES  | MUL | NULL    |       |
| DEPARTMENT_ID  | int(11)     | YES  | MUL | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
11 rows in set (0.099 sec)





---------------------CREATING THE JOB_HISTORY TABLE--------------------

MariaDB [hr]> create table JOB_HISTORY( EMPLOYEE_ID int not null primary key, START_DATE date not null, END_DATE date not null, JOB_ID varchar(10) not null, DEPARTMENT_ID int,foreign key (DEPARTMENT_ID) references DEPARTMENTS(DEPARTMENT_ID), foreign key (JOB_ID) references JOBS(JOB_ID), foreign key (EMPLOYEE_ID) references EMPLOYEES(EMPLOYEE_ID), check (START_DATE<END_DATE), check(END_DATE>START_DATE));
Query OK, 0 rows affected (0.124 sec)

MariaDB [hr]> desc JOB_HISTORY;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| EMPLOYEE_ID   | int(11)     | NO   | PRI | NULL    |       |
| START_DATE    | date        | NO   |     | NULL    |       |
| END_DATE      | date        | NO   |     | NULL    |       |
| JOB_ID        | varchar(10) | NO   | MUL | NULL    |       |
| DEPARTMENT_ID | int(11)     | YES  | MUL | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
5 rows in set (0.021 sec)





-------------------SHOWING  ALL THE TABLES IN HR DATABASE-----------

MariaDB [hr]> show tables;
+--------------+
| Tables_in_hr |
+--------------+
| countries    |
| departments  |
| employees    |
| job_history  |
| jobs         |
| locations    |
| regions      |
+--------------+
7 rows in set (0.101 sec)





------------INSERTING VALUES IN REGIONS TABLE-----------------

MariaDB [hr]> insert into REGIONS values(001, 'North-East');
Query OK, 1 row affected (0.456 sec)

MariaDB [hr]> insert into REGIONS values(002, 'East');
Query OK, 1 row affected (0.004 sec)

MariaDB [hr]> insert into REGIONS values(003, 'South-West');
Query OK, 1 row affected (0.026 sec)

MariaDB [hr]> insert into REGIONS values(004, 'North-West');
Query OK, 1 row affected (0.112 sec)

MariaDB [hr]> insert into REGIONS values(005, 'West');
Query OK, 1 row affected (0.005 sec)

MariaDB [hr]> select * from REGIONS;
+-----------+-------------+
| REGION_ID | REGION_NAME |
+-----------+-------------+
|         1 | North-East  |
|         2 | East        |
|         3 | South-West  |
|         4 | North-West  |
|         5 | West        |
+-----------+-------------+
5 rows in set (0.029 sec)





------------INSERTING VALUES IN COUNTRIES TABLE-------------

MariaDB [hr]> insert into COUNTRIES values('IN', 'India', 2);
Query OK, 1 row affected (0.102 sec)

MariaDB [hr]> insert into COUNTRIES values('BG', 'Bangladesh', 2);
Query OK, 1 row affected (0.052 sec)

MariaDB [hr]> insert into COUNTRIES values('AF', 'Afghanistan', 1);
Query OK, 1 row affected (0.046 sec)

MariaDB [hr]> insert into COUNTRIES values('ML', 'Malaysia', 3);
Query OK, 1 row affected (0.059 sec)

MariaDB [hr]> insert into COUNTRIES values('SG', 'Singapore', 4);
Query OK, 1 row affected (0.014 sec)

MariaDB [hr]> select * from COUNTRIES;
+------------+--------------+-----------+
| COUNTRY_ID | COUNTRY_NAME | REGION_ID |
+------------+--------------+-----------+
| AF         | Afghanistan  |         1 |
| BG         | Bangladesh   |         2 |
| IN         | India        |         2 |
| ML         | Malaysia     |         3 |
| SG         | Singapore    |         4 |
+------------+--------------+-----------+
5 rows in set (0.001 sec)




------------INSERTING THE VALUES IN LOCATIONS TABLE----------

MariaDB [hr]> insert into LOCATIONS values( 21, '42A/2/1 Sarat Bose Road','KOL-700031', 'Kolkata', 'West Bengal', 'IN');
Query OK, 1 row affected (0.119 sec)

MariaDB [hr]> insert into LOCATIONS values( 31, '35B Block-C Gulshan Road','Dhaka-1206', 'Thana', 'Dhaka', 'BG');
Query OK, 1 row affected (0.076 sec)

MariaDB [hr]> insert into LOCATIONS values( 41, '2A/1 Sector-VI Pahang Road','Kelantan-18500', ' Cheras', 'Kelantan ', 'ML');
Query OK, 1 row affected, 1 warning (0.099 sec)

MariaDB [hr]> insert into LOCATIONS values( 51, 'Blk 252 Ang Mo Kio Ave 4','Geylang-339696', 'Geylang', 'Bahru', 'SG');
Query OK, 1 row affected, 1 warning (0.023 sec)

MariaDB [hr]> insert into LOCATIONS values( 61, '18CD Qara Bagh','Nangarhar-2601', 'Nangarhar', 'Kabul', 'AF');
Query OK, 1 row affected, 1 warning (0.072 sec)

MariaDB [hr]> select * from LOCATIONS;
+-------------+----------------------------+--------------+-----------+----------------+------------+
| LOCATION_ID | STREET_ADDRESS             | POSTAL_CODE  | CITY      | STATE_PROVINCE | COUNTRY_ID |
+-------------+----------------------------+--------------+-----------+----------------+------------+
|          21 | 42A/2/1 Sarat Bose Road    | KOL-700031   | Kolkata   | West Bengal    | IN         |
|          31 | 35B Block-C Gulshan Road   | Dhaka-1206   | Thana     | Dhaka          | BG         |
|          41 | 2A/1 Sector-VI Pahang Road | Kelantan-185 |  Cheras   | Kelantan       | ML         |
|          51 | Blk 252 Ang Mo Kio Ave 4   | Geylang-3396 | Geylang   | Bahru          | SG         |
|          61 | 18CD Qara Bagh             | Nangarhar-26 | Nangarhar | Kabul          | AF         |
+-------------+----------------------------+--------------+-----------+----------------+------------+
5 rows in set (0.001 sec)




--------------INSERTING VALUES IN JOBS TABLE------------------------

MariaDB [hr]> insert into JOBS values (801, 'AD_VP', 25000,55000);
Query OK, 1 row affected (0.179 sec)

MariaDB [hr]> insert into JOBS values (802, 'FI_ACCOUNTANT', 30000,70000);
Query OK, 1 row affected (0.108 sec)

MariaDB [hr]> insert into JOBS values (803, 'MARKETING', 20000,50000);
Query OK, 1 row affected (0.033 sec)

MariaDB [hr]> insert into JOBS values (804, 'FINANCE', 35000,85000);
Query OK, 1 row affected (0.037 sec)

MariaDB [hr]> insert into JOBS values (805, 'DRU_PHP', 40000,85000);
Query OK, 1 row affected (0.088 sec)

MariaDB [hr]> select * from JOBS;
+--------+---------------+------------+------------+
| JOB_ID | JOB_TITLE     | MIN_SALARY | MAX_SALARY |
+--------+---------------+------------+------------+
| 801    | AD_VP         |      25000 |      55000 |
| 802    | FI_ACCOUNTANT |      30000 |      70000 |
| 803    | MARKETING     |      20000 |      50000 |
| 804    | FINANCE       |      35000 |      85000 |
| 805    | DRU_PHP       |      40000 |      85000 |
+--------+---------------+------------+------------+
5 rows in set (0.003 sec)




-----------INSERTING VALUES IN DEPARTMENTS TABLE----------------------

MariaDB [hr]> insert into DEPARTMENTS values( 9001, 'Marketing (including the selling function)', 5501,21);
Query OK, 1 row affected, 1 warning (0.083 sec)

MariaDB [hr]> insert into DEPARTMENTS values( 9002, 'Accounting and Finance.', 5502,31);
Query OK, 1 row affected (0.056 sec)

MariaDB [hr]> insert into DEPARTMENTS values( 9003, 'Purchasing.', 5503,41);
Query OK, 1 row affected (0.049 sec)

MariaDB [hr]>  insert into DEPARTMENTS values( 9004, 'Production.', 5504,51);
Query OK, 1 row affected (0.054 sec)

MariaDB [hr]> insert into DEPARTMENTS values( 9005, 'Research and Development', 5505,61);
Query OK, 1 row affected (0.039 sec)

MariaDB [hr]> select * from DEPARTMENTS;
+---------------+--------------------------------+------------+-------------+
| DEPARTMENT_ID | DEPARTMENT_NAME                | MANAGER_ID | LOCATION_ID |
+---------------+--------------------------------+------------+-------------+
|          9001 | Marketing (including the selli |       5501 |          21 |
|          9002 | Accounting and Finance.        |       5502 |          31 |
|          9003 | Purchasing.                    |       5503 |          41 |
|          9004 | Production.                    |       5504 |          51 |
|          9005 | Research and Development       |       5505 |          61 |
+---------------+--------------------------------+------------+-------------+
5 rows in set (0.002 sec)




-----------INSERTING VALUES IN EMPLOYEES TABLE----------------------

MariaDB [hr]>  insert into EMPLOYEES values( 8571, 'Shreyashi', 'Kundu', 'shreyashi97@gmail.com', '+918335989167', "2017-06-15", 805, 45000, null, 5505, 9005);
Query OK, 1 row affected, 1 warning (0.073 sec)

MariaDB [hr]> insert into EMPLOYEES values( 8572, 'Shreya', 'Sen', 'shrey7@gmail.com', '+918335009167', "2017-06-19", 805, 40000, null, 5503, 9001);
Query OK, 1 row affected (0.050 sec)

MariaDB [hr]>  insert into EMPLOYEES values( 8573, 'Rahul', 'Sharma', 'rahul789@gmail.com', '+918455009167', "2017-05-19", 805, 34000, null, 5501, 9003);
Query OK, 1 row affected (0.035 sec)

MariaDB [hr]> insert into EMPLOYEES values( 8574, 'Moumita', 'Biswas', 'moumita4789@gmail.com', '+918455012167', "2017-05-16", 801, 30000, null, 5502, 9004);
Query OK, 1 row affected, 1 warning (0.067 sec)

MariaDB [hr]>  insert into EMPLOYEES values( 8575, 'Sritama', 'Bose', 'sritama1789@gmail.com', '+918234012167', "2017-05-16", 802, 30000, null, 5502, 9004);
Query OK, 1 row affected, 1 warning (0.075 sec)

MariaDB [hr]> select * from EMPLOYEES;
+-------------+------------+-----------+----------------------+---------------+------------+--------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME | LAST_NAME | EMAIL                | PHONE_NUMBER  | HIRE_DATE  | JOB_ID | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+------------+-----------+----------------------+---------------+------------+--------+----------+----------------+------------+---------------+
|        8571 | Shreyashi  | Kundu     | shreyashi97@gmail.co | +918335989167 | 2017-06-15 | 805    | 45000.00 |           NULL |       5505 |          9005 |
|        8572 | Shreya     | Sen       | shrey7@gmail.com     | +918335009167 | 2017-06-19 | 805    | 40000.00 |           NULL |       5503 |          9001 |
|        8573 | Rahul      | Sharma    | rahul789@gmail.com   | +918455009167 | 2017-05-19 | 805    | 34000.00 |           NULL |       5501 |          9003 |
|        8574 | Moumita    | Biswas    | moumita4789@gmail.co | +918455012167 | 2017-05-16 | 801    | 30000.00 |           NULL |       5502 |          9004 |
|        8575 | Sritama    | Bose      | sritama1789@gmail.co | +918234012167 | 2017-05-16 | 802    | 30000.00 |           NULL |       5502 |          9004 |
+-------------+------------+-----------+----------------------+---------------+------------+--------+----------+----------------+------------+---------------+
5 rows in set (0.001 sec)




--------------INSERTING VALUES INTO JOB_HISTORY TABLE-------------------

MariaDB [hr]> insert into JOB_HISTORY values(8571, "2017-06-15", "2024-06-15", 805, 9005);
Query OK, 1 row affected (0.048 sec)

MariaDB [hr]> insert into JOB_HISTORY values(8572, "2017-06-19", "2024-09-19", 805, 9001);
Query OK, 1 row affected (0.016 sec)

MariaDB [hr]> insert into JOB_HISTORY values(8573, "2017-05-19", "2028-09-19", 805, 9003);
Query OK, 1 row affected (0.017 sec)

MariaDB [hr]> insert into JOB_HISTORY values(8574, "2017-05-16", "2028-09-30", 801, 9004);
Query OK, 1 row affected (0.013 sec)

MariaDB [hr]> insert into JOB_HISTORY values(8575, "2017-05-16", "2028-12-30", 802, 9004);
Query OK, 1 row affected (0.041 sec)

MariaDB [hr]> select * from JOB_HISTORY;
+-------------+------------+------------+--------+---------------+
| EMPLOYEE_ID | START_DATE | END_DATE   | JOB_ID | DEPARTMENT_ID |
+-------------+------------+------------+--------+---------------+
|        8571 | 2017-06-15 | 2024-06-15 | 805    |          9005 |
|        8572 | 2017-06-19 | 2024-09-19 | 805    |          9001 |
|        8573 | 2017-05-19 | 2028-09-19 | 805    |          9003 |
|        8574 | 2017-05-16 | 2028-09-30 | 801    |          9004 |
|        8575 | 2017-05-16 | 2028-12-30 | 802    |          9004 |
+-------------+------------+------------+--------+---------------+
5 rows in set (0.001 sec)



