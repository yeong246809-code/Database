#날짜 : 2026-05-06
#이름 : 이찬영
#내용 : 3장 제약 조건

#실습 3-1 기본키 실습하기
CREATE TABLE user2 (
userid VARCHAR(10) PRIMARY KEY,
name VARCHAR(10),
birth CHAR(10),
addr VARCHAR(50)
);
SELECT * FROM user2;
INSERT INTO user2 VALUES ("A101", "김유신", "1968-05-09", "경남 김해시");
INSERT INTO user2 VALUES ("A102", "김춘추", "1972-05-09", "경남 경주시");
INSERT INTO user2 VALUES ("A103", "장보고", "1978-05-09", "전남 완도군");
INSERT INTO user2 VALUES ("A104", "강감찬", "1979-05-09", "서울 관악구");
INSERT INTO user2 VALUES ("A105", "이순신", "1981-05-09", "부산 부산진구");


#실습 3-3 고유키 실습
CREATE TABLE user3(
	userid VARCHAR(10) PRIMARY KEY,
    name VARCHAR(10),
    birth CHAR(10),
    hp CHAR(13) UNIQUE,
    addr VARCHAR(50)
    );
    SELECT * FROM user3;
    INSERT INTO user3 VALUES ("A101", "김유신", "1968-05-09","010-1234-1001", "경남 김해시");
	INSERT INTO user3 VALUES ("A102", "김춘추", "1972-05-09","010-1234-1002", "경남 경주시");	
	INSERT INTO user3 VALUES ("A103", "장보고", "1978-05-09","010-1234-1003", "전남 완도군");
	INSERT INTO user3 VALUES ("A104", "강감찬", "1979-05-09","010-1234-1004", "서울 관악구");
	INSERT INTO user3 VALUES ("A105", "이순신", "1981-05-09","010-1234-1005", "부산 부산진구");
	INSERT INTO user3 VALUES ("A106", "정약용", "1981-05-09",NULL, "부산 부산진구");
	INSERT INTO user3 (userid, name, birth, addr)
    VALUES ("A107", "을지문덕", "1981-05-09", "부산 ");
	INSERT INTO user3 (userid, birth, addr,  name)
    VALUES ("A108", "1983-02-22", "부산 동래구", "송상현");
	INSERT INTO user3 SET
						userid = "B101",
                        name = "홍길동",
                        birth = "1951-08-18",
                        addr = "부산 연제구";
                        
	# 실습 3-5 외래키 실습
    CREATE TABLE parent(
		pid VARCHAR(10) PRIMARY KEY,
        name VARCHAR(10),
        birth CHAR(10),
        addr VARCHAR(100)
);    
	CREATE TABLE child(
		cid VARCHAR(10) PRIMARY KEY,
        name VARCHAR(10),
        hp CHAR(13) UNIQUE,
        parent VARCHAR(10),
        FOREIGN KEY(parent) REFERENCES parent (pid)
);
	SELECT * FROM parent;
    SELECT * FROM child;
    
    INSERT INTO parent VALUE ('P101','김유신','1968-05-09','경남 김해시');
    INSERT INTO parent VALUE ('P102','김춘추','1972-11-23','경남 진주시');
    INSERT INTO parent VALUE ('P103','장보고','1978-03-01','전남 완도시');
    INSERT INTO parent VALUE ('P104','강감찬','1979-08-16','서울 관악구');
    INSERT INTO parent VALUE ('P105','이순신','1981-05-23','부산 부산진구');
    
    
    
    INSERT INTO child VALUE ('C101','김설수','010-1234-1001','P101');
    INSERT INTO child VALUE ('C102','이순신','010-1234-1002','P101');
    INSERT INTO child VALUE ('C103','강철수','010-1234-1003','P103');
    INSERT INTO child VALUE ('C104','이철수','010-1234-1004','P105');
    INSERT INTO child VALUE ('C105','이수영','010-1234-1005','P100');
    INSERT INTO child VALUE ('C106','최영','010-1234-1006',NULL);
    
    #3-7 실습 DEFAULT와 NOT NULL 실습
    CREATE TABLE user4 (
		userid VARCHAR(10) PRIMARY KEY,
        name VARCHAR(10)   NOT NULL,
        gender CHAR(1),
        age INT 		   DEFAULT 1,
        hp CHAR(13) UNIQUE,
        addr VARCHAR(20)
	);
SELECT * FROM user4;
DROP TABLE user4;

INSERT INTO user4 VALUES ('A101','김유신','M',25,'010-1234-1111','경남 김해시');
INSERT INTO user4 VALUES ('A102','김춘추','M',23,'010-1234-2222','경남 경주시');
INSERT INTO user4 VALUES ('A103','장보고','M',35,'010-1234-3333','전남 완도시');
INSERT INTO user4 VALUES ('A104','강감찬','M',42,'010-1234-4444','서울시 관악구');
INSERT INTO user4(userid, name, gender, hp, addr) 
	VALUES ('A105','이순신','M','010-1234-5555','부산시 진구');
INSERT INTO user4 VALUES ('A106','신사임당','F',32,NULL,'강릉시');
INSERT INTO user4 VALUES ('A107','허난설현','F',27,NULL,'경기도 광주시');


# 3-9 AUTO_INCREMENT와 CHECK 실습    
CREATE TABLE user5 (
	seq INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(10) NOT NULL,
	gender CHAR(1) CHECK(gender IN ('M','F')),
	age INT DEFAULT 1 CHECK (age > 0 AND age < 100),
	addr VARCHAR(20)
 );
 
 SELECT * FROM user5;
 
 INSERT INTO user5 (name, gender, age, addr) VALUES ('김유신','M',25,'경남 김해시');
 INSERT INTO user5 (name, gender, age, addr) VALUES ('김춘추','M',23,'경남 경주시');
 INSERT INTO user5 (name, gender, age, addr) VALUES ('장보고','M',35,'전남 완도시');
 INSERT INTO user5 (name, gender, age, addr) VALUES ('강감찬','M',42,'서울시 관악구');
 INSERT INTO user5 (name, gender, age, addr) VALUES ('이순신','M',51,'부산시');
 INSERT INTO user5 (name, gender, age, addr) VALUES ('신사임당','F',21,'강릉시');