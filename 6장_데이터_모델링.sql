#날짜: 2026-05-20
#내용: shopERD 실습

#실습 6-2
insert into Customer values("c101","김유신","010-1234-1001","경남 김해시","2023-01-01");
insert into Customer values("c102","김춘추","010-1234-1002","경남 광주시","2023-01-02");
insert into Customer values("c103","장보고","010-1234-1003","전남 완도군","2023-01-03");
insert into Customer values("c104","강감찬","010-1234-1004","서울시 관악구","2023-01-04");
insert into Customer values("c105","이순신","010-1234-1005","부산시 금정구","2023-01-05");

insert into Product values(1,"새우깡",5000,1500,"농심");
insert into Product values(2,"초코파이",2500,2500,"농심");
insert into Product values(3,"포카칩",3600,1700,"농심");
insert into Product values(4,"양파링",1250,1800,"농심");
insert into Product values(5,"죠리퐁",2200,null,"농심");

insert into `order`(orderId,orderProduct,orderCount,orderDate) values("c102",3,2,now());
insert into `order`(orderId,orderProduct,orderCount,orderDate) values("c101",4,1,now());
insert into `order`(orderId,orderProduct,orderCount,orderDate) values("c102",1,1,now());
insert into `order`(orderId,orderProduct,orderCount,orderDate) values("c103",5,5,now());
insert into `order`(orderId,orderProduct,orderCount,orderDate) values("c105",2,1,now());

select * from `order`;
select * from `Product`;
select * from `customer`;

#실습 6-3
select 
	o.orderNo,
    c.name,
    p.prodName,
    o.orderCount,
    o.orderdate
    from `order` as o
	join customer as c on o.orderId = c.custId
    join product as p on o.orderProduct = p.prodno;

select
	o.orderNo,
	p.prodNo,
	p.prodName,
	p.price,
	o.orderCount,
	o.orderDate
	from `order` as o
	join customer as c on o.orderId = c.custId
    join product as p on o.orderProduct = p.prodno
    Where c.name = "김유신";
    
select
	sum(price * orderCount)
	from `order` as o
    join product as p on o.orderProduct = p.prodno;
#실습 6-5
-- bank_customer
INSERT INTO bank_customer
(c_no, c_name, c_dist, c_phone, c_addr)
VALUES
('730423-1000001', '김유신', 1, '010-1234-1001', '경남 김해시'),
('730423-1000002', '김춘추', 1, '010-1234-1002', '경남 경주시'),
('750423-1000003', '장보고', 1, '010-1234-1003', '전남 완도군'),
('102-12-51094', '(주)정보산업', 2, '051-500-1004', '부산시 부산진구'),
('930423-1000005', '이순신', 1, '010-1234-1005', '서울 종로구');


-- bank_account
INSERT INTO bank_account
(a_no, a_item_dist, a_item_name, a_c_no, a_balance, a_open_date)
VALUES
('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 1550000, '2011-04-11'),
('101-11-1002', 'S1', '자유저축예금', '930423-1000005', 260000, '2011-05-12'),
('101-11-1003', 'S1', '자유저축예금', '750423-1000003', 75000, '2011-06-13'),
('101-12-1001', 'S2', '기업전용예금', '102-12-51094', 15000000, '2011-07-14'),
('101-13-1001', 'S3', '정기저축예금', '730423-1000002', 1200000, '2011-08-15');


-- bank_transaction
INSERT INTO bank_transaction VALUES (1, '101-11-1001', 1, 50000, '2023-01-01 13:15:10');
INSERT INTO bank_transaction VALUES (2, '101-12-1001', 2, 1000000, '2023-01-02 13:15:12');
INSERT INTO bank_transaction VALUES (3, '101-11-1002', 3, 260000, '2023-01-03 13:15:14');
INSERT INTO bank_transaction VALUES (4, '101-11-1002', 2, 100000, '2023-01-04 13:15:16');
INSERT INTO bank_transaction VALUES (5, '101-11-1003', 3, 75000, '2023-01-05 13:15:18');
INSERT INTO bank_transaction VALUES (6, '101-11-1001', 1, 150000, '2023-01-05 13:15:28');
#실습 6-6
select
	c.c_no,
    c.c_name,
    c.c_phone,
    a.a_no,
    a.a_item_name,
    a.a_balance
    from bank_customer as c
    join bank_account as a on a.a_c_no = c.c_no;

select
	t.t_dist as `거래구분`,
    t.t_amount as `거래금액`,
    t.t_datetime as `거래날짜`
    from bank_transaction as t
    join bank_account as a on t.t_a_no = a.a_no
    join bank_customer as c on a.a_c_no = c.c_no
    where c_name = "이순신";

select
	c.c_no,
    c.c_name,
    a.a_no,
    a.a_balance,
    a.a_open_date
    from bank_transaction as t
    join bank_account as a on t.t_a_no = a.a_no
    join bank_customer as c on a.a_c_no = c.c_no
    where c_dist != 2
    order by a_balance desc
    limit 1;
    
    drop database collegeerd;
    CREATE TABLE IF NOT EXISTS `collegeERD`.`register` (
  `regStdno` CHAR(8) NOT NULL,
  `regLecNo` INT NOT NULL,
  `regMidScore` INT NULL DEFAULT NULL,
  `regFinalScore` INT NULL DEFAULT NULL,
  `regTotalScore` INT NULL DEFAULT NULL,
  `regGrade` CHAR(1) NULL DEFAULT null,
  PRIMARY KEY (`regStdno`, `regLecNo`),
  INDEX `fk_register_Lecture1_idx` (`regLecNo` ASC) VISIBLE,
  CONSTRAINT `fk_register_student`
    FOREIGN KEY (`regStdno`)
    REFERENCES `collegeERD`.`student` (`stdNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_register_Lecture1`
    FOREIGN KEY (`regLecNo`)
    REFERENCES `collegeERD`.`Lecture` (`lecNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

# 실습6-8

-- Student
INSERT INTO Student
(stdNo, stdName, stdHp, stdYear, stdAddress)
VALUES
('20201011', '김유신', '010-1234-1001', 3, '경남 김해시'),
('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시'),
('20210213', '장보고', '010-1234-1003', 2, '전남 완도군'),
('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구'),
('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');


-- Lecture
INSERT INTO Lecture
(lecNo, lecName, lecCredit, lecTime, lecClass)
VALUES
(101, '컴퓨터과학 개론', 2, 40, '본301'),
(102, '프로그래밍 언어', 3, 52, '본302'),
(103, '데이터베이스', 3, 56, '본303'),
(104, '자료구조', 3, 60, '본304'),
(105, '운영체제', 3, 52, '본305');


-- Register
INSERT INTO Register
(regStdNo, regLecNo, regMidScore, regFinalScore, regTotalScore, regGrade)
VALUES
('20220415', 101, 60, 30, NULL, NULL),
('20210324', 103, 54, 36, NULL, NULL),
('20201011', 105, 52, 28, NULL, NULL),
('20220415', 102, 38, 40, NULL, NULL),
('20210324', 104, 56, 32, NULL, NULL),
('20210213', 103, 48, 40, NULL, NULL);

select
	s.stdNo,
    s.stdName,
    s.stdHp,
    s.stdYear
    from student as s
    left join register as r on s.stdno = r.regStdno
    where r.regStdno is null;
    


select
	s.stdno,
    s.stdName,
    s.stdyear,
    l.lecNo,
    r.regmidscore,
    r.regFinalscore,
    r.regtotalscore,
    r.regGrade
    from student as s
    join register as r on r.regStdno = s.stdno
    join lecture as l on l.lecNo = r.regLecNo
    where stdYear = 2;
	
	