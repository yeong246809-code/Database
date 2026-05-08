# 날짜 : 2026-05-08
# 이름 : 이찬영
# 내용 : SQL 실습문제

use shop;

# 실습 1-1
create database shop;
create user 'shop'@'%' identified by '1234';
grant all privileges on shop.* to 'shop'@'%';
flush privileges;    
# 실습 1-2
create table Customer(
	custid varchar(10) primary key,
    name varchar(10) not null,
    hp char(13) unique default null,
    addr varchar(100) default null,
    rdate date not null
    );
drop table Customer;
create table Product(
	prodNo int primary key,
    prodName varchar(10) not null,
    stock int not null default 0,
    price int default null,
    company varchar(20) not null
    );
create table `Order`(
	orderNo int primary key auto_increment,
    orderid varchar(10) not null,
    orderProduct int not null,
    orderCount int not null default 1,
    orderDate datetime not null
    );
# 실습 1-3
select * from customer;
insert into customer value('c101','김유신','010-1234-1001','김해시 봉황동','2022-01-01');
insert into customer value('c102','김춘추','010-1234-1002','경주시 보문동','2022-01-02');
insert into customer value('c103','장보고','010-1234-1003','완도군 청산면','2022-01-03');
insert into customer value('c104','강감찬','010-1234-1004','서울시 마포구','2022-01-04');
insert into customer value('c105','이성계',null,null,'2022-01-05');
insert into customer value('c106','정철','010-1234-1006','경기도 용인시','2022-01-06');
insert into customer value('c107','허준',null,null,'2022-01-07');
insert into customer value('c108','이순신','010-1234-1008','서울시 영등포구','2022-01-08');
insert into customer value('c109','송상현','010-1234-1009','부산시 동래구','2022-01-09');
insert into customer value('c110','정약용','010-1234-1010','경기도 광주시','2022-01-10');

insert into Product  value(1,'새우깡',5000,1500,'농심');
insert into Product  value(2,'초코파이',2500,2500,'오리온');
insert into Product  value(3,'포카칩',3600,1700,'오리온');
insert into Product  value(4,'양파링',1250,1800,'농심');
insert into Product  value(5,'죠리퐁',2200,null,'크라운');
insert into Product  value(6,'마카렛트',3500,3500,'롯데');
insert into Product  value(7,'뿌셔뿌셔',1650,1200,'오뚜기');
select * from product;

select * from `Order`;
insert into `Order`(orderId, orderProduct, orderCount, orderDate) values('c102',3,2,'2022-07-01 13:15:10');
insert into `Order`(orderId, orderProduct, orderCount, orderDate) values('c101',4,1,'2022-07-01 14:16:11');
insert into `Order`(orderId, orderProduct, orderCount, orderDate) values('c108',1,1,'2022-07-01 17:23:10');
insert into `Order`(orderId, orderProduct, orderCount, orderDate) values('c109',6,5,'2022-07-02 10:46:36');
insert into `Order`(orderId, orderProduct, orderCount, orderDate) values('c102',2,1,'2022-07-03 09:15:37');
insert into `Order`(orderId, orderProduct, orderCount, orderDate) values('c101',7,3,'2022-07-03 12:35:12');
insert into `Order`(orderId, orderProduct, orderCount, orderDate) values('c110',1,2,'2022-07-03 16:55:36');
insert into `Order`(orderId, orderProduct, orderCount, orderDate) values('c104',2,4,'2022-07-04 14:23:23');
insert into `Order`(orderId, orderProduct, orderCount, orderDate) values('c102',1,3,'2022-07-04 21:54:34');
insert into `Order`(orderId, orderProduct, orderCount, orderDate) values('c107',6,1,'2022-07-05 14:21:03');


# 실습 1-4
# 실습 1-5
# 실습 1-6
# 실습 1-7
# 실습 1-8
# 실습 1-9
# 실습 1-10
# 실습 1-11
# 실습 1-12
# 실습 1-13
# 실습 1-14
# 실습 1-15
# 실습 1-16
# 실습 1-17
# 실습 1-18
# 실습 1-19
# 실습 1-20
# 실습 1-21
# 실습 1-22
# 실습 1-23
# 실습 1-24
# 실습 1-25
# 실습 1-26
# 실습 1-27
# 실습 1-29
# 실습 1-30

