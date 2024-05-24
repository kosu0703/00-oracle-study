    --  조인(join) : 여러개의 테이블을 사용하여 SQL 을 작성하는 것
    --              여러개의 테이블을 묶어서 하나의 결과를 만들어내기 위한 방법
    
    --      1. 내부 조인 (inner join) : 외래키 fk 를 이용하는 방법
    
    --              형식) select A테이블.컬럼명1 , A테이블.컬럼명2 , B테이블.컬럼명1 , B테이블.컬럼명2 
    --                   from A테이블 , B테이블
    --                   where A테이블.컬럼명 = B테이블.컬럼명
    
    --              ** 두 테이블이 모두 같은 컬럼을 가지고 있고 해당 컬럼으로 조건식을 사용
    --              ** 보통은 테이블이름은 별칭을 사용
    
    
    --  고객과 고객의 주문에 관한 데이터를 모두 보여라
    --  고객 기준으로 주문에 관한 데이터
        select *
        from customer , orders
        where customer.custid = orders.custid;
    --  주문 기준으로 고객에 관한 데이터
        select *
        from orders, customer
        where customer.custid = orders.custid;
    
    --  고객의 이름과 고객이 주문한 도서의 판매가격을 검색
        select c.name, o.saleprice
        from orders o , customer c
        where c.custid = o.custid;        
    --  ** 별칭 사용시 select , where 에 모두 별칭 사용해야된다.
    
    --  고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬
        select c.name , count(*), sum(o.saleprice)
        from customer c , orders o
        where c.custid = o.custid
        group by c.name
        order by c.name;
    
    --  고객의 이름과 고객이 주문한 도서의 이름을 구하라
        select c.name , o.saleprice, b.bookname
        from customer c , book b , orders o
        where c.custid = o.custid and b.bookid = o.bookid ;
    
    --  가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하라
        select c.name , b.bookname
        from customer c , book b , orders o
        where c.custid = o.custid and b.bookid = o.bookid and o.saleprice = 20000;
        
    -------------------------------------------------------------------------------------    
        
    --      2. 외부 조인(outer join) : 조인할 테이블에 데이터가 없어도 기준 테이블의 데이터는 모두 출력
    --                                **데이터가 없으면 null 표시
    
    --          1) **left join : 기준테이블 먼저 , 조인테이블 나중에 
    
    --              형식) select
    --                   from 기준테이블
    --                   left [outer] join 조인테이블
    --                   on 기준테이블.컬럼명 = 조인테이블.컬럼명
    --                   where 조건식
    
    --          2) right join : 조인테이블 먼저 , 기준테이블 나중에
    
    --              형식) select
    --                   from 조인테이블
    --                   right [outer] join 기준테이블
    --                   on 조인테이블.컬럼명 = 기준테이블.컬럼명
    --                   where 조건식

    --           ** left 추천 / right 비추천
    
    --  도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하라
        select c.name, sum(o.saleprice)
        from customer c
        left join orders o
        on c.custid = o.custid
        group by c.name;
        
    -----------------------------------------------------------------------------------
        
        create table AAA(
        id number PRIMARY key ,
        ename VARCHAR2(50)
        );
        
        create table BBB(
        id number PRIMARY key ,
        kname VARCHAR2(50)
        );
        
        insert into AAA values(1,'AAA');
        insert into AAA values(2,'BBB');
        insert into AAA values(3,'CCC');
        
        insert into BBB values(1,'가');
        insert into BBB values(2,'나');
        insert into BBB values(4,'라');
        insert into BBB values(5,'마');
        
        commit;
        
        --  다 보고 싶어
        
        --  aaa 기준이기 때문에 id 가 4 , 5 인 데이터가 없다.
        --  기준 left join 
        select *
        from aaa a
        left join bbb b
        on a.id = b.id;
        
        --  bbb 기준이기 때문에 id 가 3 인 데이터가 없다.
        --  기준 left join 
        select *
        from bbb b
        left join aaa a
        on a.id = b.id;
        
        --  기준 상관없이 다 보기 ( 공통컬럼이 아니면 null 채워진다. )
        --  ** full join
        select *
        from aaa a
        full join bbb b
        on a.id = b.id;
        
        --  공통컬럼 제외하고 다보기 ( 즉, null 인 데이터 보기 )
        --  ** is null
        select *
        from aaa a
        full join bbb b
        on a.id = b.id
        where a.id is null or b.id is null;
        
------------------------------------------------------------------------------------

    --  부속질의 (서브쿼리) : 하나의 SQL 문 안에 포함되어 있는 또 다른 SQL 문을 말한다.
    --                      즉, 메인쿼리 안에 있는 쿼리를 말한다.
    
    --      1) 단일행 연산자 : 결과가 한 줄 => 비교연산자( = , != , <> , >= , <= ) 사용
    
    --      2) 다중행 연산자 : 결과가 여러줄 => in , any , all , exists 사용
    
    
    --  book 테이블에서 가장 비싼 도서의 이름을 검색
    --      1. 먼저 가장 비싼 금액을 찾고
            select max(price)
            from book;
    --      2. 비싼 금액을 가진 책이름을 찾자
            select bookname
            from book
            where price = 35000;
    --      3. 결론 -> 쿼리를 여러번 사용
            select bookname
            from book
            where price = (select max(price) from book);
    --      단일행 연산자는 보통 비교연산자 사용
    
    --  도서를 구매한 적이 있는 고객의 이름을 검색
    --      서브쿼리
    --      1. 구매를 한 고객을 찾자(중복제거)
            select distinct custid
            from orders;
    --      2. 고객 이름을 찾자
            select name 
            from customer 
            where custid in (1,2,3,4);
    --      3. 결과가 여러줄이면 다중행 연산자
            select name
            from customer
            where custid in (select distinct custid from orders);
            
    --      다른방법 (join)
            select distinct c.name
            from customer c, orders o
            where c.custid = o.custid;

    --  대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오
    --      1. 출판사가 대한미디어인 도서를 찾자
            select bookid
            from book
            where publisher = '대한미디어';
    --      2. 도서 번호로 구매한 고객 번호를 찾자
            select custid
            from orders
            where bookid in (3,4);
    --      3. 고객 번호로 고객 이름 찾자
            select name
            from customer
            where custid = 1;
    --      4. 결론 
            select name
            from customer
            where custid = (select custid 
                            from orders 
                            where bookid in (select bookid 
                                             from book 
                                             where publisher = '대한미디어'));
          
            -- 조인으로 하는 방법
            select distinct c.name
            from customer c, orders o, book b
            where c.custid = o.custid and o.bookid = b.bookid and b.publisher = '이상미디어';
    
                 
    --  _구로 시작한 책을 구입한 사람
    --      1. _구로 시작한 책을 찾자
            select bookid
            from book
            where bookname like '_구%';
    --      2. 도서 번호를 가지고 고객 번호를 찾자
            select distinct custid
            from orders
            where bookid in (1,2,3,7,8);
    --      3. 고객 번호를 가지고 이름을 찾자
            select name
            from customer
            where custid in (1,3,4);
    --      4. 결론
            select name
            from customer
            where custid in (select distinct custid 
                             from orders
                             where bookid in (select bookid 
                                              from book 
                                              where bookname like '_구%'));
            
            -- 조인이용
            select distinct c.name
            from customer c, orders o, book b
            where c.custid = o.custid and o.bookid = b.bookid and b.bookname like '_구%';
    
    
    --  평균 도서 가격보다 비싼 도서이름을 구하라
    --      1. 평균 도서 가격을 구하자
            select avg(price)
            from book; 
    --      2. 평균 가격 보다 큰 도서를 찾자
            select bookname
            from book
            where price > 14450;
    --      3. 결론
            select bookname
            from book
            where price > (select avg(price) from book);
    --      ** 집계함수는 select 문에서만 사용 가능하다.
    
    -------------------------------------------------------------------------------
    
    --  합집함 union / 차집합 minus / 교집합 intersect
    --      주의사항) 오라클은 차집합을 minus 로 하지만, SQL 표준에서는 except 를 사용
    
    --  도서를 주문하지 않은 고객의 이름을 보여라
    --  즉, 전체 고객 - 주문한 고객 = 주문하지 않은 고객
    --  1. 전체 고객    
        select name, custid 
        from customer;
    --  2. 주문한 고객번호
        select distinct custid
        from orders;
    --  3. 주문 고객 번호로 고객 이름 구하기
        select name
        from customer
        where custid in (select distinct custid from orders);
    --  4. 결론 (전체 고객 이름 - 주문한 고객 이름)
        select name
        from customer 
        minus 
        select name
        from customer
        where custid in (select distinct custid from orders); 

------------------------------------------------------------------------------------

    (5) 박지성이 구매한 도서의 출판사 수
        --  조인
        select count(distinct b.publisher)  --  **출판사가 중복될 수도 있으므로 distinct 중복제거
        from customer c , orders o , book b
        where c.custid = o.custid and o.bookid = b.bookid and c.name = '박지성';
    
    (6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
        --  조인
        select b.bookname 도서명 , b.price 정가 , o.saleprice 판매가격 , ( b.price - o.saleprice ) as 할인받은금액
        from customer c , orders o , book b
        where c.custid = o.custid and o.bookid = b.bookid and c.name = '박지성';
    
    (7) 박지성이 구매하지 않은 도서의 이름
        select bookname
        from book
        minus
        select b.bookname
        from customer c , orders o , book b
        where c.custid = o.custid and o.bookid = b.bookid and c.name = '박지성';
        
        -- 다른방법
        select bookname
        from book
        where bookname not in (select b.bookname
                               from customer c , orders o , book b
                               where c.custid = o.custid and o.bookid = b.bookid and c.name = '박지성');
  
    (8) 주문하지 않은 고객의 이름(부속질의 사용)
        select name
        from customer
        where custid not in ( select custid from orders );
        
        select name
        from customer
        where name not in ( select name from customer c, orders o where c.custid = o.custid )
    
    (9) 주문 금액의 총액과 주문의 평균 금액
        select sum(saleprice), avg(saleprice)
        from orders;
    
    (10) 고객의 이름과 고객별 구매액 
        select c.name , sum(o.saleprice)
        from customer c , orders o
        where c.custid = o.custid 
        group by c.name;
        
    (11) 고객의 이름과 고객이 구매한 도서 목록
        select c.name , b.bookname
        from customer c , orders o , book b
        where c.custid = o.custid and b.bookid = o.bookid;
    
    (12) 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
        --  1. 차이가 가장 많은 거 찾기
        select max(b.price - o.saleprice)
        from book b , orders o
        where b.bookid = o.bookid;
        --  2. 그 주문 전체 정보 뽑아내기
        select b.bookname , b.publisher, b.price , o.saleprice
        from book b , orders o
        where b.bookid = o.bookid and (b.price - o.saleprice) = (select max(b.price - o.saleprice)
                                                                 from book b , orders o 
                                                                 where b.bookid = o.bookid);
        
  (13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
        select c.name    
        from orders o , customer c
        where c.custid = o.custid
        group by c.name
        having avg(o.saleprice) > (select avg(saleprice) from orders);
    
----------------------------------------------------------------------------------

    --  교재 p199 [극장 데이터베이스]
    
    create table cinema(
    cid number PRIMARY key ,
    cname VARCHAR2(50),
    cloca varchar2(50)
    );
    
    create table person(
    pid number PRIMARY key ,
    pname VARCHAR2(50),
    address varchar2(50)
    );
  
    create table room (
    cid number,
    rid number check(rid between 1 and 10) primary key,
    rname VARCHAR2(50),
    price number check(price <= 20000),
    seats number,
    constraint fk_cid foreign key (cid) references cinema(cid)
    );
 
    create table booking(
    cid number,
    rid number,
    pid number,
    bid number primary key,
    seatnum number unique,
    bdate date,
    constraint fk_cid2 foreign key (cid) references cinema(cid),
    constraint fk_rid foreign key (rid) references room(rid),
    constraint fk_pid foreign key (pid) references person(pid)
    );
  
    insert into cinema (cid, cname, cloca)
    values (1,'롯데','잠실');
    insert into cinema (cid, cname, cloca)
    values (2,'메가','강남');
    insert into cinema (cid, cname, cloca)
    values (3,'대한','잠실');
    
    insert into person (pid, pname, address)
    values (3,'홍길동','강남');
    insert into person (pid, pname, address)
    values (4,'김철수','잠실');
    insert into person (pid, pname, address)
    values (9,'박영희','강남');
    
    insert into room (cid, rid, rname, price, seats)
    values (1, 1, '어려운 영화', 15000, 48);
    insert into room (cid, rid, rname, price, seats)
    values (3, 3, '멋진 영화', 7500, 120);    
    insert into room (cid, rid, rname, price, seats)
    values (3, 2, '재밌는 영화', 8000, 110);   

    insert into booking (cid, rid, pid, bid, seatnum, bdate)
    values (3, 2, 3, 1, 15, '2020-09-01');
    insert into booking (cid, rid, pid, bid, seatnum, bdate)
    values (3, 1, 4, 2, 16, '2020-09-01');
    insert into booking (cid, rid, pid, bid, seatnum, bdate)
    values (1, 1, 9, 3, 48, '2020-09-01');
    
    --  제약 조건 
    --  **check : price <= 20000
    --  **check : rid between 1 and 10 
    --  unique : seatnum  
    
        --  모든 극장의 이름과 위치를 보이시오
        select cname, cloca
        from cinema;
        
        --  잠실에 있는 극장을 보이시오
        select cname
        from cinema
        where cloca = '잠실';
        
        --  잠실에 사는 고객의 이름을 오름차순
        select pname
        from person
        where address = '잠실'
        order by pname;
    
        --  가격이 8000원 이하인 영화의 극장번호 , 상영관번호 , 영화제목을 보이시오
        select cid, rid, rname
        from room
        where price <= 8000;
        
        --  극장위치와 고객의 주소가 같은 고객을 보여라
        select p.pname
        from cinema c, person p , booking b
        where c.cid = b.cid and p.pid = b.pid and c.cloca = p.address;
        
        --  극장의 수는 몇개
        select count(*)
        from cinema;
        
        --  상영되는 영화의 평균가격은 얼마
        select avg(price)
        from room;
    
        --  2020년 9월 1일에 영화를 관람한 고객의 수
        select count(*)
        from booking
        where bdate = '2020-09-01';
        
        --  대한 극장에서 상영된 영화제목을 보이시오
        select r.rname
        from cinema c, room r
        where c.cid = r.cid and c.cname = '대한';
        
        --  대한 극장에서 영화를 본 고객의 이름
        select p.pname
        from cinema c, booking b, person p
        where c.cid = b.cid and b.pid = p.pid and c.cname = '대한';
        
        --  대한 극장의 전체 수입
        select sum(r.price * r.seats)
        from cinema c, room r
        where c.cname = '대한';
         
        --  극장별 상영관 수
        select c.cname, count(*)
        from cinema c, room r
        where c.cid = r.cid
        group by c.cname;
        
        --  잠실에 있는 극장의 상영관
        select r.rid , r.rname
        from cinema c, room r
        where c.cid = r.cid and c.cloca = '잠실';
        
        --  2020년 9월 1일의 극장별 평균 관람 고객수
        select avg(r.seats)
        from room r, booking b
        where r.rid = b.rid and b.bdate = '2020-09-01';
        
        --  2020년 9월 1일에 가장 많은 고객이 관람한 영화
        select max(seats)
        from room ;
        
        select max(r.seats)
        from room r, booking b
        where r.rid = b.rid and b.bdate = '2020-09-01'; 
        
        --  각 테이블에 데이터를 삽입하는 insert 문 하나씩 실행
        insert into cinema (cid, cname, cloca)
        values(4,'CGV','종로');
        
        insert into person (pid, pname, address)
        values(1, '둘리', '종로');
        
        insert into room (cid, rid, rname, price, seats)
        values(4, 4, '무서운 영화', 10000, 80);
        
        insert into booking (cid, rid, pid, bid, seatnum, bdate)
        values(4, 4, 1, 33, 4, '2020-09-09');
        
        --  영화의 가격을 10%씩 인상
        select price * 1.1 as 인상가격
        from room; 
    
--------------------------------------------------------------------------------    
       
        
        
        
        
        