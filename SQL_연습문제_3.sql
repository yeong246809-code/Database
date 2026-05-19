#실습 3-1
create database `college`;
create user 'college'@'%' identified by '1234';
grant all privileges on college.* to 'college'@'%';
flush privileges;

#실습 3-2
create table Student(
	stdNo char(8) primary key,
	stdName varchar(20) not null,
	stdHp char(13) unique key not null,
	stdYear int not null,
	stdAddress varchar(100) default null
    );
    drop table sudent;
create table Lecture(
	lecNo int primary key,
	lecName varchar(20) not null,
	lecCredit int not null,
	lecTime int not null,
	lecClass varchar(20) default null
    );
create table Register(
	regStdNo char(8) not null,
	regLecNo int not null,
	regMidScore int default null,
	regFinalScore int default null,
	regTotalScore int default null,
	regGrade char(1) default null
    );
#실습 3-3
insert into Student values('20201016', '김유신', '010-1234-1001', 3, null);
insert into Student values('20201126', '김춘추', '010-1234-1002', 3, '경상북도 경주시');
insert into Student values('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도군');
insert into Student values('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
insert into Student values('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
insert into Student values('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

insert into Lecture values(159, '인지행동심리학', 3, 40, '본304');
insert into Lecture values(167, '운영체제론', 3, 25, '본305');
insert into Lecture values(234, '중급 영문법', 3, 20, '본201');
insert into Lecture values(239, '세법개론', 3, 40, '본204');
insert into Lecture values(248, '빅데이터 개론', 3, 20, '본101');
insert into Lecture values(253, '컴퓨터사고와 코딩', 2, 10, '본202');
insert into Lecture values(349, '사회복지 마케팅', 2, 50, '본301');

insert into Register values('20201126', 234, NULL, NULL, NULL, NULL);
insert into Register values('20201016', 248, NULL, NULL, NULL, NULL);
insert into Register values('20201016', 253, NULL, NULL, NULL, NULL);
insert into Register values('20201126', 239, NULL, NULL, NULL, NULL);
insert into Register values('20210216', 349, NULL, NULL, NULL, NULL);
insert into Register values('20210326', 349, NULL, NULL, NULL, NULL);
insert into Register values('20201016', 167, NULL, NULL, NULL, NULL);
insert into Register values('20220416', 349, NULL, NULL, NULL, NULL);
#실습 3-4
select * from Lecture;
#실습 3-5
select * from student;
#실습 3-6
select * from register;
#실습 3-7
select * from Student where stdYear = 3;
#실습 3-8
select * from lecture where lecCredit = 2;
#실습 3-9
UPDATE Register
SET
    regMidScore = 36,
    regFinalScore = 42
WHERE
    regStdNo = '20201126'
    AND regLecNo = 234;


UPDATE Register
SET
    regMidScore = 24,
    regFinalScore = 62
WHERE
    regStdNo = '20201016'
    AND regLecNo = 248;


UPDATE Register
SET
    regMidScore = 28,
    regFinalScore = 40
WHERE
    regStdNo = '20201016'
    AND regLecNo = 253;


UPDATE Register
SET
    regMidScore = 37,
    regFinalScore = 57
WHERE
    regStdNo = '20201126'
    AND regLecNo = 239;


UPDATE Register
SET
    regMidScore = 28,
    regFinalScore = 68
WHERE
    regStdNo = '20210216'
    AND regLecNo = 349;


UPDATE Register
SET
    regMidScore = 16,
    regFinalScore = 65
WHERE
    regStdNo = '20210326'
    AND regLecNo = 349;


UPDATE Register
SET
    regMidScore = 18,
    regFinalScore = 38
WHERE
    regStdNo = '20201016'
    AND regLecNo = 167;


UPDATE Register
SET
    regMidScore = 25,
    regFinalScore = 58
WHERE
    regStdNo = '20220416'
    AND regLecNo = 349;
#실습 3-10
update register
set	
	regtotalscore = regmidscore + regfinalscore ,
    reggrade = if(regtotalscore >= 90, 'A',
			   if(regtotalscore >= 80, 'B',
               if(regtotalscore >= 70, 'C',
               if(regtotalscore >= 60, 'D', 'F'))));
select * from register;
#실습 3-11
select * from register order by regtotalscore desc;
#실습 3-12
select * from register where reglecNo = '349' order by regtotalscore desc;
#실습 3-13
select * from lecture where lectime >= 30;
#실습 3-14
select lecName, lecClass from lecture;
#실습 3-15
select stdNo,stdName from student;
#실습 3-16
select * from student where stdAddress is null;
#실습 3-17
select * from student where stdAddress like '부산시%';
#실습 3-18
select * from student as a left join register as b on a.stdNo = b.regstdNo;
#실습 3-19
select
	a.stdNo,
    a.stdName,
    b.regLecNo,
    b.regmidscore,
    b.regfinalscore,
    b.regtotalscore,
    b.reggrade
from student as a, register as b where a.stdNo = b.regStdNo;
#실습 3-20
select stdname, stdno, reglecno
	from student as a
    join register as b
    on a.stdno = b.regstdno where reglecno = '349';
#실습 3-21
select
	stdno,
    stdname,
    count(stdno)as `수강신청 건수`,
    sum(regtotalscore)as `종합점수`,
    sum(regtotalscore) / count(stdno) as `평균`
from student as a
join register as b
on a.stdno = b.regstdno
group by stdno order by `종합점수`desc;
#실습 3-22
select * 
	from register as a
    join lecture as b
	on a.reglecno = b.lecno;
#실습 3-23
select
	regstdno,
    reglecno,
    lecname,
    regmidscore,
    regfinalscore,
    regtotalscore,
    reggrade
from register as a join lecture as b on a.reglecno = b.lecno;
#실습 3-24
select
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(regtotalscore) as `사회복지 마케팅 평균`
from register as a 
join lecture as b 
	on a.reglecno = b.lecno
	where lecname = '사회복지 마케팅'; 
#실습 3-25
select
	regstdno,
    lecname
from register as a 
join lecture as b 
	on a.reglecno = b.lecno
	where reggrade = 'A';
#실습 3-26
select * from student as a
join register as b 
on a.stdno = b.regstdno
join lecture as c
on b.reglecno = c.lecno;
#실습 3-27
select
	stdno,
	stdname,
    lecno,
    lecname,
    regmidscore,
    regfinalscore,
    regtotalscore,
    reggrade
from student as a
join register as b 
on a.stdno = b.regstdno
join lecture as c
on b.reglecno = c.lecno
order by reggrade,regtotalscore desc;
#실습 3-28
select
	stdno,
    stdname,
    lecname,
    regtotalscore,
    reggrade
from student as a
join register as b 
on a.stdno = b.regstdno
join lecture as c
on b.reglecno = c.lecno
where reggrade = 'F';
#실습 3-29
select
	stdno,
    stdname,
    sum(leccredit) as `이수학점`
from student as a
join register as b 
on a.stdno = b.regstdno
join lecture as c
on b.reglecno = c.lecno
where reggrade != 'F'
group by a.stdno
order by a.stdno;
#실습 3-30
select
	stdno,
    stdname,
    group_concat(lecname) as `신청과목`,
    group_concat(if(regtotalscore >= 60, lecname, null)) as `이수과목`
from student as a
join register as b 
on a.stdno = b.regstdno
join lecture as c
on b.reglecno = c.lecno
where reggrade != 'F'
group by a.stdno;