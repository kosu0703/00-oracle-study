
    --  내장 함수 : 출력 결과를 보기 위해 오라클에서 제공하는 가상 테이블 dual 
    
    --  1. 숫자 관련 내장 함수
    
    --      1) 절대값 : ABS(숫자)
            select abs(-78), abs(75), abs(-3.14), abs(3.14) 
            from dual;
            
    --      2) 올림 : ceil(숫자), 자릿수 지정이 없고 소수점 기준
    --              가까운 큰 정수로 간다.
    --              음수일때는 현재정수값 그대로 / 양수일때는 현재정수값 + 1
            select ceil(-75.41), ceil(75.31), ceil(-6.41), ceil(6.31)
            from dual;
            
    --      3) 버림 : floor(숫자), 자릿수 지정이 없고 소수점 기준
    --              가까운 작은 정수로 간다.
    --              음수일때 현재정수값 - 1 / 양수일때는 현재정수값 그대로
            select floor(-75.41), floor(75.31), floor(-6.41), floor(6.31)
            from dual;
        
    --      4) 진짜 버림 : trunc(숫자), 자릿수 지정이 있다. trunc(숫자, 자릿수)
    --                      소숫점 자리이하 잘라버림
            select trunc(-75.41), trunc(75.31), trunc(-6.41), trunc(6.31)
            from dual;
            select trunc(-75.41, 1), trunc(75.31, 1), trunc(-6.41, 1), trunc(6.31, 1)
            from dual;
            select trunc(-75.41, -1), trunc(75.31, -1), trunc(-76.41, -1), trunc(76.31, -1)
            from dual;
       
    --      5) 반올림 : round(숫자), round(숫자, 자릿수)     
            select round(-13.444), round(13.444), round(-13.544), round(13.544)
            from dual;
            select round(-13.444, 1), round(13.444, 1), round(-13.544, 1), round(13.544, 1)
            from dual;
            select round(-144.4, -1), round(144.4, -1), round(-145.4, -1), round(145.4, -1)
            from dual;
            
    --      6) power(숫자, 숫자) : n의 제곱승   /   root(숫자, 숫자) : n의 제곱근
            select power(2, 3), power(3, 2)
            from dual;
            
    --      7) sign(숫자) : 음수이면 -1, 양수이면 1
            select sign(-24), sign(27), sign(-2.175), sign(3.1455)
            from dual;
            
    --      8) mod(a, b) : a를 b로 나눈 나머지
            select mod(27, 2), mod(27, 3), mod(27, 4), mod(27, 5)
            from dual;
            
    --  고객별 평균 주문 금액을 백원 단위로 반올림한 값을 구하시오 
        select custid, round(avg(saleprice), -2) cust_avg   -- **별칭을 사용하여 VO 에 컬럼명을 맞춰줘야한다.
        from orders
        group by custid;
            
    -----------------------------------------------------------------------------
    
    --  2. 문자 관련 내장 함수
    
    --      1) chr(아스키코드숫자) : 아스키코드 숫자를 받아서 문자로 표시
            select chr(65), chr(97), chr(48)
            from dual;
            
    --      2) concat('문자열', '문자열') : 두 문자열 결합
            select concat('ict', '개발원')
            from dual;
            
    --      3) initcap('문자열') : 첫글자를 대문자로, 나머지를 소문자로      
    --      4) lower('문자열') : 모든 글자를 소문자로 
    --      5) upper('문자열') : 모든 글자를 대문자로
    --          **주의사항) 숫자나 한글은 무시한다.
            select initcap('KoReA'), lower('KoReA'), upper('KoReA'), 
                    initcap('대한민국123'), lower('대한민국123'), upper('대한민국123')
            from dual;
    
    --      6) trim('문자열') : 양쪽 공백 제거
    --      7) ltrim('문자열') : 왼쪽 공백 제거
    --      8) rtrim('문자열') : 오른쪽 공백 제거
    --      9) length('문자열') : 문자열의 길이(공백 포함)
            select trim('  oracle xe 18  '), ltrim('  oracle xe 18  '), 
                    rtrim('  oracle xe 18  '), length('  oracle xe 18  ')
            from dual;
            select length(trim('  oracle xe 18  ')), length(ltrim('  oracle xe 18  ')), 
                    length(rtrim('  oracle xe 18  ')), length('  oracle xe 18  ')
            from dual;
            
    --      10) lpad('문자열', 자릿수, '왼쪽공백 메울 문자열') 
    --      11) rpad('문자열', 자릿수, '오른쪽공백 메울 문자열')
    --          ** 주의사항) 자리가 남으면 채우고, 모자르면 잘린다.
            select lpad('oracle xe 18', 30, '!@#'), rpad('oracle xe 18', 30, '!@#')
            from dual;
            select lpad('oracle xe 18', 13, '!@#'), rpad('oracle xe 18', 13, '!@#')
            from dual;
            select lpad('oracle xe 18', 5, '!@#'), rpad('oracle xe 18', 5, '!@#')
            from dual;
            
    --      12) substr('문자열', 시작위치, 갯수) : 시작위치에서 갯수만큼 ( 자바와 다르다 )
    --                     **주의사항) 왼쪽에서 1 부터 시작, - 는 오른쪽 출발
            select substr('abcdefgh', 2, 4), 
                   substr('abcdefgh', -5, 4), 
                   substr('abcdefgh', -2, 4)    --  개수가 모자라면 있는거 까지만
            from dual;
    
    --      13) replace('문자열', '변경할 문자열', '변경 문자열') : 문자 치환
            select replace('ict 대한 민국 인재개발원', '대한', '大韓')
            from dual;
    
    --      14) ASCII('아스키문자') : 문자를 아스키코드 숫자로 나타냄 (chr 과 반대개념)
            select ascii('A'), ascii('a'), ascii('0')
            from dual;
    
    --      15) instr('문자열', '찾는 문자열') : 문자열 안에서 찾는 문자의 위치표시 (처음 하나만)
    --          instr('문자열', '찾는 문자열', 시작위치)    왼쪽에서 1부터 시작 
            select instr('770707-1077999', '0')     
            from dual;                              --  첫번째 0
            select instr('770707-1077999', '0', 4)
            from dual;                              --  두번째 0
            select instr('770707-1077999', '0', (select instr('770707-1077999', '0') from dual) + 1 )
            from dual;  --  자바식
    --     **instr('문자열', '찾는 문자열', 1, n) : 찾는 문자의 n 번째 위치 표시
            select instr('770707-1077999', '0', 1, 1) 첫번째 from dual;
            select instr('770707-1077999', '0', 1, 2) 두번째 from dual;
            select instr('770707-1077999', '0', 1, 3) 세번째 from dual;
            
    --  도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서목록을 출력하자 ( 치환 replace 사용 )
    --  ** select 는 실제 DB 가 변하지 않는다
        select bookid, bookname, publisher, price, replace(bookname, '야구', '농구')
        from book;
    
    --  굿스포츠에서 출판한 도서의 제목과 제목의 글자수를 확인하시오.
        select bookname, length(bookname)
        from book
        where publisher like '굿스포츠';
        
    --  고객 중에서 같은 성을 가진 사람이 몇명이나 되는지 성별 인원수를 구하시오
        select substr(name, 1, 1), count(*)
        from customer
        group by substr(name, 1, 1);
        
    -----------------------------------------------------------------------------
    
    --  3. 날짜/시간 관련 내장 함수
    
    --      1) sysdate : 시스템 상의 오늘 날짜/시간 반환하는 인자없는 함수
            select sysdate, sysdate + 10
            from dual;
            --  날짜만 나오게
            select substr(sysdate, 0, 10), substr(sysdate + 10, 0, 10)
            from dual;
            
    --      2) to_date('문자열') : 문자열 데이터를 날짜형 데이터로 변경
            select trunc(sysdate) - to_date('2024-02-01')
            from dual;
            select to_date('2024-12-31') - trunc(sysdate)
            from dual;
            
    --      3) to_char('날짜', '날짜형') : 날짜형 데이터를 문자열 데이터로 변경
            select to_char(sysdate, 'yyyy-mm-dd')
            from dual;
            select to_char(to_date('2024-02-07'), 'yymmdd')
            from dual;
        
    --      4) add_months(date, 숫자) : 날짜형의 날짜에서 지정한 달 만큼 연산 
    --                                  ( 1 : 다음달, -1 : 지난달 )
            select sysdate, add_months(sysdate, 4), add_months(sysdate, -4)
            from dual;
            
    --      5) last_day(date) : 해당 달의 마지막 날짜 
            select sysdate, last_day(sysdate)
            from dual;
            
    --      6) next_day(date, 요일) : 해당 요일의 가장 가까운 날짜(미래) **과거, 현재 X
            select sysdate, next_day(sysdate, '화요일'), next_day(sysdate, '수요일'),
                            next_day(sysdate, '목요일'), next_day(sysdate, '금요일')
            from dual;
            
    --      7) months_between(끝날짜, 시작날짜) : 월 단위 기간 구하기
            select months_between(sysdate, '2023-07-07')
            from dual;
            
    --  주문일자로 부터 10일 후에 주문이 확정된다.
        select orderid, substr(orderdate, 0, 10) 주문일, substr(orderdate + 10, 0, 10) 확정
        from orders;
        
-----------------------------------------------------------------------------------

    --  null 값 처리
    --      : 아직 지정되지 않은 값
    --        '0', ''(빈문자), ' '(공백) 등과는 다르다.
    --        **비교연산자로 비교가 불가능하다.
    --        연산을 수행하면 결과 역시 null 값으로 반환된다.
    
    --      1. is null : 조건식에서 null 을 찾을때 사용
    --      2. is not null : 조건식에서 null 이 아닌 것을 찾을때 사용
    --      3. nvl(컬럼명, null 대신 가져가는 값) 
    
    --  고객테이블에서 phone 이 없는 고객의 정보를 출력하시오
        select * from customer3 where phone = null;      -- null 을 못 찾음
        select * from customer3 where phone is null;     -- null 을 찾음
        select * from customer3 where phone is not null; -- null 이 아닌 것을 찾음
        -- null 대신 '없음' 을 가져옴
        select name, phone, nvl(phone, '없음') from customer3; 
    
    --  rownum : 오라클 내부에서 생성되는 가상 컬럼, SQL 조회 결과의 순번을 나타낸다.
        select rownum, c.*
        from (select * from customer order by custid desc) c;
        --  ** 페이징 기법을 사용할때 필요하다.
        select * 
        from (select rownum r_num, a.*  -- rownum 을 별칭 r_num 으로
              from (select * from bbs_t order by b_idx desc) a ) -- select 문이 별칭 a 테이블으로  
        where r_num between #{begin} and #{end};
        --  내림차순으로 정렬한 데이터를 rownum 을 이용하여 지정한 사이구간 처음값부터 끝값까지만 가져온다.
        --  1000개의 데이터면 1페이지는 1부터 10까지, 2페이지는 11부터 20까지 ...
    
----------------------------------------------------------------------------------- 
    
    --  뷰(view) : 가상 테이블, 실제 메모리에 존재하지 않는다.
    --              즉, 물리적으로 저장되어 있는 테이블이 아니다.
                  
    --          일반적인 사용자는 뷰를 만들 수 없다.
    --          뷰는 insert, update, delete 가 목적이 아니라 select 가 목적이다.
    --          즉, 뷰의 목적은 검색이다.
    --          여러 테이블을 하나로 합쳐서 하나의 뷰로 만들수도 있고,
    --          하나의 테이블을 이용해서 여러개의 뷰를 만들수도 있다.
    
    --  뷰 생성 
    --      1) 같은 이름의 뷰가 존재하면 오류 발생
    --      create view 뷰이름
    --      as select 문 ;
    
    --      2) 같은 이름의 뷰가 존재하면 해당 뷰를 삭제하고 새로 만든다.(비추천)
    --      ** 뷰는 되도록 수정하지 말자, 그냥 삭제하고 다시 만들자.
    --      create or replace view 뷰이름
    --      as select 문 ;
    
    --  뷰 삭제 
    --  drop view 뷰이름 ;
    
    
    --  1. 주소에 대한민국을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오
    --      1) select 문을 먼저 만들고
            select * from customer3 where address like '%대한민국%';
    --      2) 뷰를 만들자    
            create view v_test01
            as select * from customer3 where address like '%대한민국%';
    --      3) 호출
            select * from v_test01;
        
    --  2. 주문 테이블에서 고객번호를 고객이름으로, 도서번호를 도서명으로 수정해서 
    --      v_order 뷰를 만들자
    --      1) select 문을 먼저 만들자
            select o.orderid, c.name, b.bookname, o.saleprice, substr(o.orderdate, 0, 10)
            from customer3 c, orders3 o, book3 b
            where c.custid = o.custid and o.bookid = b.bookid
            order by o.orderid;
    --      2) 뷰를 만들자
            create view v_order
            as select o.orderid orderid, c.name name, b.bookname bookname, 
                      o.saleprice saleprice, substr(o.orderdate, 0, 10) orderdate
            from customer3 c, orders3 o, book3 b
            where c.custid = o.custid and o.bookid = b.bookid
            order by o.orderid;
    --      3) 뷰를 이용해서 김연아 고객의 주문내용을 출력하시오
            select *
            from v_order
            where name like '김연아';
            
    --  연습문제
    --  (1) 판매가격이 20,000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 
    --      보여주는 highorders 뷰를 생성하시오.
            select b.bookid, b.bookname, c.name, b.publisher, o.saleprice
            from customer3 c, orders3 o, book3 b
            where c.custid = o.custid and o.bookid = b.bookid and o.saleprice >= 20000;
            
            create view highorders as 
            select b.bookid, b.bookname, c.name, b.publisher, o.saleprice
            from customer3 c, orders3 o, book3 b
            where c.custid = o.custid and o.bookid = b.bookid and o.saleprice >= 20000;
            
    --  (2) 생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 
    --      출력하는 SQL 문을 작성하시오.
            select bookname, name
            from highorders;
    
    --  (3) highorders 뷰를 변경하고자 한다. 
    --      판매가격 속성을 삭제하는 명령을 수행하시오. 
    --      삭제 후 (2)번 SQL 문을 다시 수행하시오.
    --      ** 변경 비추천!!
    --      뷰 변경 => 뷰 삭제 후 다시 뷰 생성 
            drop view highorders;
            
            create view highorders as 
            select b.bookid, b.bookname, c.name, b.publisher
            from customer3 c, orders3 o, book3 b
            where c.custid = o.custid and o.bookid = b.bookid and o.saleprice >= 20000;
            
    --  ** 원본 테이블 데이터를 수정(변경)하면 뷰의 데이터도 자동으로 수정(변경)된다.
    --  주문 테이블에서 김연아(custid=2)가 구매한 도서들을 10000원씩 더하자    
        select * from orders3;
        --  원본 테이블 수정하면
        update orders3 set saleprice = saleprice + 10000 where custid = 2;
        --  뷰는 원본을 가져와서 만드므로, 자동 수정 됨 
        select * from v_order where name like '%김연아%';
        
--------------------------------------------------------------------------------       
        
    --  인덱스 : 검색할때 빨리 찾기 위해서 인덱스를 부여한다.
    --          즉, 검색을 쉽고 빠르게 하기 위한 기법
        
--------------------------------------------------------------------------------

    --  시퀀스 : 오라클에서 자동으로 **고유 숫자값을 생성해주며, 주로 기본키에 이용된다.
    
    --  시퀀스 생성    
    --      create sequence 시퀀스이름 (보통 테이블이름_seq 이라고 만든다.)
    --      increment by 증가값
    --      start with 시작값
    --      nocycle (다시 시작하지 않는다. 주로 기본키에 사용되기 때문에)
    
        create sequence customer3_seq
        increment by 1
        start with 9 -- 원래는 1 인데 기본데이터가 8 까지 있어서 9 부터 시작
        nocycle;
        
    --  시퀀스 사용
    --      보통 pk 가 숫자일때, 그 자리에 시퀀스이름.nextval => 숫자가 자동으로 부여됨
    
        insert into customer3(custid, name, address, phone)
         values(customer3_seq.nextval, '차두리', '대한민국 수원', '000-7979-9797');
        insert into customer3(custid, name, address, phone)
         values(customer3_seq.nextval, '차두리', '대한민국 수원', '000-7979-9797');
        
        select * from customer3;

    --  연습문제
    --  도서 테이블에 사용할 시퀀스를 만들어서 데이터를 넣어보자
        select * from book3;
        
        create sequence book3_seq
        increment by 1
        start with 11
        nocycle;
        
        insert into book3(bookid, bookname, publisher, price)
         values(book3_seq.nextval, '아시안컵 탈락', '클린스만', 1000);
        
---------------------------------------------------------------------------------
