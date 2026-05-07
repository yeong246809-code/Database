# 날짜 : 2026-05-06
# 이름 : 이찬영
# 내용 : 4장 SQL 고급 실습


# 실습 4-1
CREATE TABLE Employee(
empno int primary key not null,
name varchar(10) not null,
gender char(1) not null,
hp char(13) not null UNIQUE,
job varchar(10) ,
depno int ,
regdate date not null
);

CREATE TABLE Dept(
depno INT PRIMARY KEY,
dname VARCHAR(10) NOT NULL,
tel VARCHAR(12) NOT NULL
);

CREATE TABLE Sale(
no INT auto_increment PRIMARY KEY,
empno INT NOT NULL,
year YEAR NOT NULL,
month TINYINT NOT NULL,
price INT DEFAULT 0
);
# 실습 4-2
INSERT INTO Employee VALUES (1001,'김유신','M','010-1234-1001','부장',101,'2026-11-19');
INSERT INTO Employee VALUES (1002,'김춘추','M','010-1234-1002','차장',104,'2026-11-19');
INSERT INTO Employee VALUES (1003,'장보고','M','010-1234-1003','사원',NULL,'2026-11-19');
INSERT INTO Employee VALUES (1004,'강감찬','M','010-1234-1004','대리',102,'2026-11-19');
INSERT INTO Employee VALUES (1005,'신사임당','F','010-1234-1005','과장',102,'2026-11-19');
INSERT INTO Employee VALUES (1006,'이황','M','010-1234-1006','차장',103,'2026-11-19');
INSERT INTO Employee VALUES (1007,'이이','M','010-1234-1007','사원',105,'2026-11-19');
INSERT INTO Employee VALUES (1008,'이순신','M','010-1234-1008',NUll,NULL,'2026-11-19');
INSERT INTO Employee VALUES (1009,'허난설현','F','010-1234-1009','사원',104,'2026-11-19');
INSERT INTO Employee VALUES (1010,'정약용','M','010-1234-1010','대리',104,'2026-11-19');


INSERT INTO Dept VALUES (101,'경영지원부','051-512-1001');
INSERT INTO Dept VALUES (102,'영업부','051-512-1002');
INSERT INTO Dept VALUES (103,'개발부','051-512-1003');
INSERT INTO Dept VALUES (104,'인사부','051-512-1004');
INSERT INTO Dept VALUES (105,'기획부','051-512-1005');


INSERT INTO Sale (empno,year,month,price) VALUES (1001,2018,1,98100);
INSERT INTO Sale (empno,year,month,price) VALUES (1002,2018,1,136000);
INSERT INTO Sale (empno,year,month,price) VALUES (1003,2018,1,80000);
INSERT INTO Sale (empno,year,month,price) VALUES (1004,2018,1,78000);
INSERT INTO Sale (empno,year,month,price) VALUES (1005,2018,1,93000);

INSERT INTO Sale (empno,year,month,price) VALUES (1001,2018,2,24000);
INSERT INTO Sale (empno,year,month,price) VALUES (1002,2018,2,126000);
INSERT INTO Sale (empno,year,month,price) VALUES (1003,2018,2,19000);
INSERT INTO Sale (empno,year,month,price) VALUES (1005,2018,2,19000);
INSERT INTO Sale (empno,year,month,price) VALUES (1006,2018,2,53000);

INSERT INTO Sale (empno,year,month,price) VALUES (1001,2019,1,24000);
INSERT INTO Sale (empno,year,month,price) VALUES (1002,2019,1,109000);
INSERT INTO Sale (empno,year,month,price) VALUES (1003,2019,1,101000);
INSERT INTO Sale (empno,year,month,price) VALUES (1004,2019,1,53000);
INSERT INTO Sale (empno,year,month,price) VALUES (1007,2019,1,24000);

INSERT INTO Sale (empno,year,month,price) VALUES (1002,2019,2,160000);
INSERT INTO Sale (empno,year,month,price) VALUES (1003,2019,2,101000);
INSERT INTO Sale (empno,year,month,price) VALUES (1004,2019,2,43000);
INSERT INTO Sale (empno,year,month,price) VALUES (1005,2019,2,24000);
INSERT INTO Sale (empno,year,month,price) VALUES (1006,2019,2,109000);

INSERT INTO Sale (empno,year,month,price) VALUES (1002,2020,1,201000);
INSERT INTO Sale (empno,year,month,price) VALUES (1004,2020,1,63000);
INSERT INTO Sale (empno,year,month,price) VALUES (1005,2020,1,74000);
INSERT INTO Sale (empno,year,month,price) VALUES (1006,2020,1,122000);
INSERT INTO Sale (empno,year,month,price) VALUES (1007,2020,1,111000);

INSERT INTO Sale (empno,year,month,price) VALUES (1002,2020,2,120000);
INSERT INTO Sale (empno,year,month,price) VALUES (1003,2020,2,93000);
INSERT INTO Sale (empno,year,month,price) VALUES (1004,2020,2,84000);
INSERT INTO Sale (empno,year,month,price) VALUES (1005,2020,2,180000);
INSERT INTO Sale (empno,year,month,price) VALUES (1008,2020,2,76000);

INSERT INTO Sale (empno,year,month,price) VALUES (1001,2021,1,56000);
INSERT INTO Sale (empno,year,month,price) VALUES (1002,2021,1,123000);
INSERT INTO Sale (empno,year,month,price) VALUES (1005,2021,1,91000);
INSERT INTO Sale (empno,year,month,price) VALUES (1007,2021,1,78000);
INSERT INTO Sale (empno,year,month,price) VALUES (1002,2021,2,32000);

INSERT INTO Sale (empno,year,month,price) VALUES (1003,2021,2,148000);
INSERT INTO Sale (empno,year,month,price) VALUES (1004,2021,2,106000);
INSERT INTO Sale (empno,year,month,price) VALUES (1005,2021,2,112000);
INSERT INTO Sale (empno,year,month,price) VALUES (1001,2021,3,47000);
INSERT INTO Sale (empno,year,month,price) VALUES (1006,2021,3,36000);

SELECT * FROM sale;
SELECT * FROM Employee;
SELECT * FROM Dept;

# 실습 4-3
SELECT * FROM Employee WHERE name !='김춘추';
SELECT * FROM employee WHERE name <> '김춘추';
SELECT * FROM employee WHERE job IN ('사원','대리');
SELECT * FROM employee WHERE job = '사원' or job = '대리';
SELECT * FROM employee WHERE name LIKE '김%'; -- %:와일드카드,아무 문자열
SELECT * FROM employee WHERE name LIKE '%신';
SELECT * FROM employee WHERE name LIKE '이_';
SELECT * FROM employee WHERE job is NULL; -- job이 NULL인 직원
SELECT * FROM Employee WHERE name = '김유신';
SELECT * FROM Employee WHERE job = '차장' AND depno = 101;
SELECT * FROM Employee WHERE job = '차장' OR depno = 101;
SELECT * FROM Employee WHERE JOB = '사원' AND DEPNO = 105;
SELECT * FROM Employee WHERE depno IN (101, 102, 103);
SELECT * FROM Employee WHERE name LIKE '김__';
SELECT * FROM Employee WHERE name LIKE '_순%';
SELECT * FROM Employee WHERE HP LIKE '010-%';
SELECT * FROM Employee WHERE JOB IS NOT NULL;
SELECT * FROM Employee WHERE DEPNO IS NULL;
SELECT * FROM Employee WHERE DEPNO IS NOT NULL;
SELECT * FROM Employee WHERE EMPNO >= 1005;
SELECT * FROM DEPT WHERE DEPNO = 101;
SELECT * FROM DEPT WHERE DNAME = '개발부';
SELECT * FROM DEPT WHERE TEL LIKE '%30%';
SELECT * FROM DEPT WHERE DEPNO IN (10, 30);
SELECT * FROM DEPT WHERE DNAME LIKE '경영___';
SELECT * FROM SALE WHERE PRICE > 50000;
SELECT * FROM SALE WHERE price >= 50000 AND price < 100000 AND month = 1;
SELECT * FROM SALE WHERE price BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE price NOT BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE year = 2024;
SELECT * FROM SALE WHERE YEAR = 2024 AND MONTH = 2;
SELECT * FROM SALE WHERE MONTH IN (1, 2);


# 실습 4-4
select * from sale order by price;
select * from sale order by price desc;
SELECT * FROM Sale ORDER BY price;
SELECT * FROM Sale ORDER BY price ASC;
SELECT * FROM Sale ORDER BY price DESC;
SELECT * FROM Employee ORDER BY name;
SELECT * FROM Employee ORDER BY name DESC;
SELECT * FROM Employee ORDER BY regdate ASC;

select * from sale where price > 50000 order by year desc, month, price desc;

# 실습 4-5
SELECT * FROM Sale LIMIT 3;
SELECT * FROM Sale LIMIT 0, 3;
SELECT * FROM Sale LIMIT 1, 2;
SELECT * FROM Sale LIMIT 5, 3;
SELECT * FROM Sale ORDER BY price DESC LIMIT 3, 5;
SELECT * FROM Sale WHERE price < 50000 ORDER BY price DESC LIMIT 3;
SELECT * FROM Sale WHERE price > 50000 ORDER BY year DESC, month, price DESC LIMIT 5;

# 실습 4-6
SELECT SUM(price) AS 합계 FROM Sale;
SELECT AVG(price) AS 평균 FROM Sale;
SELECT MAX(price) AS 최대값 FROM Sale;
SELECT MIN(price) AS 최소값 FROM Sale;
SELECT CEILING(1.2);
SELECT CEILING(1.8);
SELECT FLOOR(1.2);
SELECT FLOOR(1.8);
SELECT ROUND(1.2);
SELECT ROUND(1.8);
SELECT RAND();
SELECT CEILING(RAND() * 10);
SELECT COUNT(price) AS 갯수 FROM Sale;
SELECT COUNT(*) AS 갯수 FROM Sale;
update sale set price = 80000 where no=3;
SELECT LEFT('HelloWorld', 5);
SELECT RIGHT('HelloWorld', 5);
SELECT SUBSTRING('HelloWorld', 6, 5);
SELECT CONCAT('Hello', 'World');
SELECT CONCAT(empno, name, hp) FROM Employee WHERE empno='1008';
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
INSERT INTO Employee SET
empno = '1012',
name = '을지문덕',
gender = 'F',
hp = '010-1234-1012',
regdate = NOW();
select * from Employee;

# 실습 4-7
SELECT SUM(price) as 2018년합계 from sale where year =2018 and month = 1 ;



# 실습 4-8
select sum(price) as 2019년합계, avg(price) as 2019년평균 from sale where year = 2019 and month = 2 and price > 50000;
# 실습 4-9
select price as 최고 from sale where year = 2020 order by price desc limit 1,1;
select price as 최저 from sale where year = 2020 order by price limit 1,1;
select min(price) as 최저매출 , max(price) as 최고매출 from sale where year = 2020;

# 실습 4-10
select empno from sale group by empno; -- group by 절에서 사용한 컴멀을 select 조회
select empno, year from sale group by empno, year;
select empno, count(*) as 건수 from sale group by empno;
select empno, year, sum(price) as 합계 from  sale where price >= 100000 group by empno, year having 합계 >= 200000 order by 합계 desc;

# 실습 4-11


# 실습 4-12
create table sale2 like sale;
select * from sale2;
insert into sale2 select *from sale;
update sale2 set year = year + 4;
select * from sale
union
select * from sale2;
SELECT * FROM Sale UNION SELECT * FROM Sale2;
SELECT * FROM Sale WHERE price >= 100000
UNION
SELECT * FROM Sale2 WHERE price >= 100000;
SELECT empno, year, price FROM Sale
UNION
SELECT empno, year, price FROM Sale2;
SELECT empno, year, SUM(price) AS 합계 FROM Sale
GROUP BY empno, year
UNION
SELECT empno, year, SUM(price) AS 합계 FROM Sale2
GROUP BY empno, year
ORDER BY year ASC, 합계 DESC;

# 실습 4-13
SELECT * FROM Sale INNER JOIN Employee ON Sale.empno = Employee.empno;
select * from sale;
select * from employee;

SELECT * FROM Employee JOIN Dept ON Employee.depno = Dept.depno;

SELECT * FROM Sale AS a JOIN Employee AS b ON a.empno = b.empno;

SELECT * FROM Employee AS a JOIN Dept AS b ON a.depno = b.depno;

SELECT * FROM Sale AS a, Employee AS b WHERE a.empno = b.empno;

SELECT * FROM Employee AS a, Dept AS b WHERE a.depno = b.depno;

SELECT a.no, a.empno, price, name, job FROM Sale AS a
JOIN Employee AS b ON a.empno = b.empno;

SELECT a.no, a.empno, price, name, job FROM Sale AS a
JOIN Employee AS b USING (empno); -- 두테이블의 컬럼명이 동일한 경우 using 사용

SELECT a.no, a.empno, price, name, job FROM Sale AS a
JOIN Employee AS b ON a.empno = b.empno
WHERE price >= 100000;

SELECT  a.empno, b.name, b.job, year, SUM(price) AS 합계 FROM Sale AS a
JOIN Employee AS b ON a.empno = b.empno
GROUP BY a.empno, a.year HAVING 합계 >= 100000
ORDER BY  a.year ASC, 합계 DESC;


SELECT * FROM Sale AS a
JOIN Employee AS b ON a.empno = b.empno
JOIN Dept AS c ON b.depno = c.depNo;

SELECT a.no, a.empno, a.price, b.name, b.job, c.dname FROM Sale AS a
JOIN Employee AS b ON a.empno = b.empno
JOIN Dept AS c ON b.depno = c.depNo;

SELECT a.no, a.empno, a.price, b.name, b.job, c.dname FROM Sale AS a
JOIN Employee AS b ON a.empno = b.empno
JOIN Dept AS c ON b.depno = c.depNo
WHERE price > 100000
ORDER BY price DESC;

# 실습 4-14
select * from sale as a
			left join employee as b
				on a.empno = b.empno;
select * from sale as a
			right join employee as b
				on a.empno = b.empno;
# 실습 4-15
select * from employee;
select a.empno, a.name, a.depno, a.job from employee as a;
select a.empno, a.name, a.job, b.dname
			from employee as a
				left join dept as b
					on a.depno = b.depno;

# 실습 4-16
select * from employee;
select * from sale;
select a.empno, a.name, b.empno, sum(price) from employee as a
						join sale as b on a.empno = b.empno
							where year = 2019;
select sum(price) as 매출합
		 from employee as a
		 join sale as b
         on a.empno = b.empno
         where a.name = '김유신' and b.year = 2019;

# 실습 4-17
select a.empno,b.name,c.dname,b.job,a.year, sum(price) as 매출합
		from sale as a
        join employee as b on a.empno = b.empno
        join dept as c on b.depno = c. depno
        where year = 2019 and price >= 50000
		group by empno
        having 매출합 >= 100000
        order by 매출합 desc;