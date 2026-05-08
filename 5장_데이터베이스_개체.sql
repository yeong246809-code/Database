# 날짜 : 2026-05-08
# 이름 : 이찬영
# 내용 : 5장 데이터베이스 개체
    
    #실습 5 - 1
	show index from user1;
	show index from user2;
	show index from user3;
    select * from user3;
    #실습 5 - 2
    create index idx_user1_userid on user1(userid);
    analyze table user1;
    
    #실습 5 - 3
    drop index idx_user1_userid on user1;
    
    #실습 5 - 4
    create table vw_user1 as (select name, hp, age from user1);
    select * from user1; -- result view
	select * from vw_user1;
    create view vw_user4_age_under30 as (select * from user4 where age < 30);
    select * from vw_user4_age_under30;
    create view vw_employee_with_sales as(
		select
			a.empno as 직원번호,
            b.name as 직원이름,
            c.job as 직급,
            a.year as 매출년도,
            a.month as 월,
            a.price as 매출액
		from sale as a
        join employee as b on a.empno = b.empno
        join dept as c on b.depno = c.depno
        );
    #실습 5 - 5
    
    #실습 5 - 6
    
    #실습 5 - 7
    
    #실습 5 - 8
    
    #실습 5 - 9
    delimiter $$
		create procedure proc_test5(in _name varchar(10))
        begin
			declare _empno int;
            select empno into _empno from employee where name = _name;
            select * from sale where empno = _empno;
		end $$
	call proc_test5('김유신');
    delimiter ;
    #실습 5 - 10 커서를 활용한 프로시저
    delimiter $$
		create procedure proc_test8()
        begin
			#변수 선언
			declare total int default 0;
            declare temp int;
            declare endOfRow boolean default false;
            
            #커서 선언 : 테이블의 특정 컬럼을 포인팅하는 가상개체
            declare saleCursor cursor for 
				select price from sale;
		
			#반복 조건
            declare continue handler for not found set endOfRow = true;
            
            #커서 열기
            open saleCursor;
            
            cursor_loop: loop
            
				-- 커서가 가리키는 현재 행의 값을 temp 변수에 저장, 한번 반복마다 한행씩 이동
				fetch saleCursor into temp;
                
                if endOfRow then
					leave cursor_loop;
				end if;
                
                set total = total + temp;
            end loop;
            
            select total as '전체 합계';
            
            close saleCursor;
		end $$
    delimiter ;
    call proc_test8();
	drop procedure proc_test8;
    
    #실습 5 - 11
    set global log_bin_trust_function_creatro = 1;
    delimiter $$
		create function func_test1(_empno int) returns int
        begin
			declare total int;
            
            select sum(price) into total from sale where empno = _empno;
            
            return total;
		end $$
    delimiter ;
    
    select func_test1(1001);
    
    delimiter $$
		create function func_test2(_price int) returns double
        begin
			declare bonus int;
            
            if(_price >= 100000) then
				set bonus = _price * 0.1;
			else
				set bonus = _price * 0.05;
			end if;
            
	
            
            return bonus;
		end $$
    delimiter ;
    
select empno,year,month,price,func_test2(price) as bonus from sale;