    1. 고객테이블에서 고객번호가 5인 고객의 주소를 대한민국 부산으로 변경
        update customer
        set address = '대한민국 부산'
        where custid = 5;
    2. 고객테이블에서 김연아 고객의 주소를 대한민국 대전으로 변경
        update customer
        set address = '대한민국 대전'
        where name like '김연아';
    3. 책테이블에서 출판사가 대한미디어에서 대한출판사로 이름을 변경하시오
        update book
        set publisher = '대한출판사'
        where publisher like '대한미디어';
    4. 고객테이블에서 추신수의 주소를 대한민국 경기도, 핸드폰번호를 000-1111-9999 로 변경
        update customer
        set address = '대한민국 경기도', phone='000-1111-9999'
        where name like '추신수';
      
    1. 고객테이블의 모든 데이터 삭제하기
        delete from customer
    2. 모든 데이터가 삭제된 것을 확인한 후 롤백하기
       rollback
       
       select * from customer;
       select * from book;
    3. 고객테이블에서 고객번호가 5인 고객 삭제하기
        delete from customer where custid = 5;
    4. 삭제된 것을 확인한 후 롤백하기
        rollback
    1. 새로운 도서 스포츠 세계, 대한미디어, 10000원 가 마당서점에 입고되었다.
        insert into book (bookid, bookname, publisher, price)
         values (11,'스포츠 세계', '대한미디어', 10000);
    2. 삼성당에서 출판한 도서를 삭제해야한다.
        delete from
    3. 이상미디어에서 출판한 도서를 삭제해야한다.
    rollback
    4. 출판사 대한미디어가 대한출판사로 이름을 바꾸었다.
    
    5. 전체를 commit 상태로 되돌리자. 롤백
    
    1. 새로운 도서 스포츠 세계, 대한미디어, 10000원 가 마당서점에 입고되었다.
    
    2. 삼성당에서 출판한 도서를 삭제해야한다.
    
    3. 이상미디어에서 출판한 도서를 삭제해야한다.
    
    4. 박지성이 골프 바이블을 35000원 주고 2020년 7월 12일에 구매했다.
    
    5. 박세리가 축구 바이블을 25000원 주고 2020년 7월 13일에 구매했다.
    
    롤백하자
    
    기존의 테이블을 데이터와 함께 복사하자.
    create table copybook as select * from book;
    create table copycustomer as select * from customer;
        기본키 먼저 넣어보자
    alter table copybook add primary key (bookid); 
        외래키 넣어보자
    alter table copybook add constraint bookid_fk foreign key (bookid) references copybook (bookid);
    
    desc copybook;
    모든 도서의 이름과 가격을 검색하시오 
   select bookname , price
   from book;
    모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오
    select * from book;
    테이블이 가진 모든 속성을 표현할때는 * 을 사용하자
    
    도서 테이블에 있는 모든 출판사를 검색하시오
    select publisher from book;
    book 테이블의 책이름과 가격, customer 테이블의 고객명과 주소를 검색하는 코딩을 하자
    desc customer;
    
    select b.bookname, b.price, c.name, c.address
    from book b, customer c, orders o
    where b.bookid = o.bookid and c.custid = o.custid;
    가격이 20000원 미만인 도서를 검색
    select * from book
    where price < 20000;
    가격이 10000원 이상 20000원 이하인 도서를 검색
    select * from book
    where price between 10000 and 20000;
    출판사가 굿스포츠 또는 대한미디어인 도서를 검색
    select * from book
    where publisher in ('굿스포츠', '대한미디어');
    출판사가 굿스포츠 또는 대한미디어가 아닌 도서를 검색
        select * from book
    where publisher not in ('굿스포츠', '대한미디어');
    축구의 역사를 출간한 출판사를 검색
    select publisher from book
    where bookname like '축구의 역사';
    도서이름에 축구가 포함된 출판사를 검색
    select * from book
    where bookname like '%축구%';
    도서이름의 왼쪽 두번째 위치에 구라는 문자열을 갖는 도서를 검색
    select * from book
    where bookname like '_구%';
    축구에 관한 도서중 가격이 20000원 이상인 도서의 모든 정보를 검색
    select * from book
    where bookname like '%축구%' and price >= 20000;
    orderid 1,3,5,7,9 의 자료의 날짜 변경 (2020/08/15)
    update orders
    set orderdate = '2020-08-15'
    where orderid in (1, 3, 5, 7, 9);
    롤백하자
    select * from orders;
    rollback;
    orders 테이블에서 7월인 자료만 검색
    select * from orders
    where orderdate like '2020-07%';
    orders 테이블에서 orderdate 가 2020년인 모든 정보 보기
    select * from orders
    where orderdate like '2020%';
    도서번호가 1인 도서의 이름
    select * from book
    where bookid = 1 ;
    성이 ‘김’ 씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소
    
    도서를 이름순으로 검색
    select * from book
    order by bookname;
    도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색
    select * from book
    order by price , bookname;
    도서를 가격의 내림차순 검색 후 가격이 같다면 출판사의 오름차순 검색
    select * from book
    order by price desc , publisher;
    고객이 주문한 도서의 총 판매액
    select sum(saleprice)
    from orders;
    
    desc orders;
    2번 김연아 고객이 주문한 도서의 총 판매액
    select sum(saleprice)
    from orders
    where custid = 2;
    고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가, 도서판매건수를 구하라
    select sum(saleprice) , avg(saleprice), min(saleprice), max(saleprice) , count(*)
    from orders ;
    2번 김연아 고객이 주문한 도서 판매 건수
     select count(*)
    from orders
    where custid = 2;
    박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
     select sum(saleprice)
    from orders
    where custid = 1;
    박지성이 구매한 도서의 수
    
    도서를 출고하는 출판사의 총 개수
    select distinct publisher
    from book;
    주문 금액의 총액과 주문의 평균 금액

    고객별로 주문한 도서의 총 수량과 총 판매액
    select custid, count(*), sum(saleprice)
    from orders
    group by custid;
    
    select * from orders;
    고객별 주문 도서의 총 수량을 구하시오. 단, 세 권 이상 구매한 고객만
    select custid, count(*)
    from orders
    group by custid
    having count(*) >= 3;
    가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 
    단, 두 권 이상 구매한 고객만 구한다.
    select custid, count(*)
    from orders
    where saleprice >= 8000
    group by custid
    having count(*)>=2;
    출판사의 이름을 중복없이 출력 
    select distinct publisher
    from book;
    고객과 고객의 주문에 관한 데이터를 모두 보여라
    
    주문 기준으로 고객에 관한 데이터
    select *
    from orders o
    left join customer c
    on o.custid = c.custid;
    고객의 이름과 고객이 주문한 도서의 판매가격을 검색
    
    고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬
    select custid ,sum(saleprice)
    from orders
    group by custid
    order by custid;
    고객의 이름과 고객이 주문한 도서의 이름을 구하라
    
    가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하
    
    도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하라
    select c.name, sum(o.saleprice)
        from customer c
        left join orders o
        on c.custid = o.custid
        group by c.name;
     book 테이블에서 가장 비싼 도서의 이름을 검색
     select bookname
     from book
     where price = ( select max(price)
     from book)
     
     select max(price)
     from book
    
     도서를 구매한 적이 있는 고객의 이름을 검색
     select distinct c.name
     from customer c, orders o
     where c.custid = o.custid;
     대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오
     select distinct c.name
     from customer c, orders o, book b
     where c.custid = o.custid and o.bookid = b.bookid and b.publisher = '대한미디어';
     _구로 시작한 책을 구입한 사람
     
     평균 도서 가격보다 비싼 도서이름을 구하라
    
     도서를 주문하지 않은 고객의 이름을 보여라
     
     박지성이 구매한 도서의 출판사 수
     
     박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
     
     박지성이 구매하지 않은 도서의 이름
     
     주문하지 않은 고객의 이름(부속질의 사용)
     
     주문 금액의 총액과 주문의 평균 금액
     
     고객의 이름과 고객별 구매액
     
     고객의 이름과 고객이 구매한 도서 목록
     
     도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
     
     고객별 평균 주문 금액을 백원 단위로 반올림한 값을 구하시오
     
     도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서목록을 출력하자 ( 치환 사용 )
     
     굿스포츠에서 출판한 도서의 제목과 제목의 글자수를 확인하시오.
     
     고객 중에서 같은 성을 가진 사람이 몇명이나 되는지 성별 인원수를 구하시오
     
     주문일자로 부터 10일 후에 주문이 확정된다.
     
     고객테이블에서 phone 이 없는 고객의 정보를 출력하시오
     select *
     from customer
     where phone is null;
        null 대신 없음을 가져와 보이시오
        
    주소에 대한민국을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오
    
    주문 테이블에서 고객번호를 고객이름으로, 도서번호를 도서명으로 수정해서 뷰를 만들자
    
    판매가격이 20,000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 뷰를 생성하시오.
    
        생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력
        
    주문 테이블에서 김연아(custid=2)가 구매한 도서들을 10000원씩 더하자
    
        뷰 확인
        
        롤백
        
    도서 테이블에 사용할 시퀀스를 만들어서 데이터를 넣어보자
    
    출력하기 위해서 사용할 명령문
    
    변수 i 가 10 이면 데이터를 출력
    
    변수 hak 이 A 이면 데이터를 출력
    
    변수 i 가 홀수인지, 짝수인지 판별하자
    
    변수 i 가 90 이상이면 A, 80 이상이면 B, 70 이상이면 C, 나머지는 F
    
    for문
    1 부터 10 까지 출력
    
     1 부터 10 까지 짝수만 출력
     
      짝수의 합 출력
      
      while문
      1~10 까지 출력
    
    1~10 까지 홀수만 출력
    
    1~10 까지 홀수의 합 출력
    
    loop문
     1 부터 10 까지 출력
    
     1 부터 10 까지 짝수만 출력
     
      짝수의 합 출력
      
      이름 배열과 평균 배열
      
      프로시저
      고객 테이블에서 고객 번호가 2 인 고객의 이름을 '손흥민' 으로 변경하자
      
      실행
      
      확인
      
      롤백
      
      외부에서 고객번호와 이름을 받아서 고객테이블을 수정하는 프로시저를 만들자
      
      실행
      
      확인
      
      
      고객 테이블에 이름은 둘리 , 주소는 대한민국 방학동 , 전번은 000-2000-0001 삽입하는 프로시저를 만들자
      (기본키 고객번호 시퀀스 만들어서 사용)
      
      실행
      
      확인
      
      
      고객 테이블에 (시퀀스있음) 외부에서 이름, 주소, 전번을 받아서 삽입하는 프로시저를 만들자 
      
      실행 
      
      확인
      
      고객번호를 받아서 삭제하는 프로시저를 만들자
      
      실행
      
      확인
      
      도서 테이블에서 도서명, 가격, 출판사를 받아서 도서명과 출판사가 같으면 업데이트, 없으면 삽입하자
      
      실행
      
      확인
      
      도서번호를 받아서 도서테이블에서는 삭제하고 도서2테이블에 삽입하자
        ( 도서테이블 구조 복사하여 도서2 테이블 만들어서 사용 )
        
     실행
     
     확인
     
     도서테이블의 평균가격을 반환하는 프로시저 만들기
     
        익명 프로시저를 사용
     
     책이름을 받아서 책이름과 가격을 출력하는 프로시저만들기
     
     외부에서 가격을 받아서 판매된 도서에 대한 이익을 계산하는 함수 (fnc_interest)
       가격이 30000 원 이상이면 10%, 30000원 미만이면 5%
       
    날짜를 받아서 날짜형식을 변경하는 함수를 만들자 ( fnc_orderdate )
    
    커서
    주문 테이블에서 20000 이상이면 10% , 20000 미만이면 5% 를 이용해서 이익금을 보자
    
    트리거
    고객 테이블에 삽입을 했을때 XXX님 삽입 성공이라는 글자가 나오게 하자
    
    고객 테이블에 삽입했을때 삽입한 내용을 고객2 테이블에 삽입하게 하자.
    ( 고객테이블 구조 복사하여 고객2 테이블 만들어서 사용 )
    
     