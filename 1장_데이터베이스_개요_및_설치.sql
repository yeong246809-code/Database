-- 날짜 : 2026-05-04
-- 이름 : 이찬영
-- 내용 : 1장 데이터베이스 개요 및 설치

# MySQL 접속(콘솔환경)
#> mysql -u root -p
#> -u: user,사용자 계정
#> -p: password, 비밀번호

#데이터베이스 생성, 제거
CREATE database mydb;
DROP DATABASE mydb; -- 실행단축키 : Ctrl + enter


# 데이터 베이스 목록 조회
SHOW DATABASES;

#작업 데이터베이스 선택
USE mydb;
USE studydb;

-------------------------------------------------------------
#일반 관리자 생성
CREATE USER 'admin'@'%' identified BY '246809'; -- admin 계성 생성, %는 외부접속 IP를 의미
GRANT ALL PRIVILEGES ON MYDB.* TO 'admin'@'%'; -- admin에게 mydb의 모든권한(읽기/쓰기/수정/삭제)부여
FLUSH PRIVILEGES; -- admin 계정권한 반영

#계정 삭제
DROP USER 'admin'@'%'; -- %는 외부접속 ip를 의미

#비밀번호 수정
ALTER USER 'admin'@'%' IDENTIFIED BY '1234';
