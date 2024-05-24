    --  1.
    --  select 문 : 검색 => 결과는 테이블로 나온다.(**select 는 테이블이 안바뀐다.)
    --  **insert, update, delete 의 결과는 숫자이다.
 

    --      형식) select [ * ㅣ distinct ] 속성이름(들)
    --           from 테이블이름(들)
    --           [where 조건식]
    --           [group by 속성이름]
    --           [having 조건식]
    --           [order by 속성이름 [ASC = 생략]ㅣ DESC ]
    --           ** ASC = 생략 = 오름차순 / DESC = 내림차순

    --  모든 도서의 이름과 가격을 검색하시오 
    select bookname, price
    from book;

    --  모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오
    select bookid, bookname, publisher, price 
    from book;
    
    --  테이블이 가진 모든 속성을 표현할때는 * 을 사용하자
    select * from book;

    --  도서 테이블에 있는 모든 출판사를 검색하시오
    select publisher
    from book;

    --  검색결과에서 중복을 제거하고 싶으면 distinct 키워드를 사용 
    --  select distinct 컬럼명 from 테이블이름 ;
    select distinct publisher from book;
    
    --  주의사항 : 다른 컬럼과 함께 사용하면 안된다.(다른 컬럼때문에 중복제거가 풀린다.)
    --  **distinct 는 컬럼 한개만 사용 가능
    select distinct publisher, bookname from book;
    
    --  **컬럼 별칭 사용 : select 컬럼명 as 별칭 ㅣ select 컬럼명 별칭      
    --  원본 속성명은 변경되지 않는다. 결과에만 변경되서 보여진다.  

    --  **테이블 별칭 사용 : from 테이블명 별칭 (as 사용하면 오류발생)
    --  원본 테이블명은 변경되지 않는다.

    select bookname as 도서명, price 정가
    from book;
    
    --  book 테이블의 책이름과 가격, customer 테이블의 고객명과 주소를 검색하는 코딩을 하자
    --  **select ~ from 하면 from 먼저 select 나중에
    select bookname, price, name, address
    from book, customer;
    
    --  **테이블이 2개일때 검색(기본)
    --  select 테이블1.컬럼명, 테이블2.컬럼명
    --  from 테이블1, 테이블2
    select book.bookname, book.price, customer.name, customer.address
    from book, customer;
    
    --  위 코드를 별칭사용하기
    select b.bookname 도서명, b.price as 정가, c.name 고객명, c.address as 주소
    from book b, customer c;
    
    --  숫자 솟성은 계산도 가능하다
    --  book 테이블에서 가격의 10% 할인 가격을 구하자
    select bookid, bookname, publisher, price, price * 0.9 as 할인가격
    from book;
    --  원본 테이블은 변하지 않는다. 결과에만 할인가격이 보여진다.
    
    --  orders 테이블에 orderdate 에 10일 추가한 날짜
    select bookid, custid, saleprice, orderdate, orderdate+10 반납일 
    from orders;
    
    ----------------------------------------------------------------------------
    
    --  2.
    --  where 조건절 
    
    --      형식) where 컬럼명 연산자 데이터;
    --          ** 연산자 앞에 반드시 컬럼명을 적어주자
        
    --      1) 비교연산  
    --          = : 같다 
    --          <> , != : 다르다
    --          >= , > , <= , < : 비교
    
    --  가격이 20000원 미만인 도서를 검색 
    select *
    from book
    where price < 20000;
    
    --  가격이 10000원 이상 20000원 이하인 도서를 검색
    --  방법1 ( and )
    select *
    from book
    where price >= 10000 and price <= 20000;
    --  방법2 ( between )
    select *
    from book
    where price between 10000 and 20000;
    
    --  출판사가 굿스포츠 또는 대한미디어인 도서를 검색
    --  방법1 ( or ) 비추천
    select *
    from book
    where publisher = '굿스포츠' or publisher = '대한미디어';
    --  **방법2 ( in )
    select *
    from book
    where publisher in('굿스포츠', '대한미디어');
    
    --  출판사가 굿스포츠 또는 대한미디어가 아닌 도서를 검색
    --  방법1 ( <> , != , and ) 
    select *
    from book
    where publisher <> '대한미디어' and publisher != '굿스포츠';
    --  방법2 ( not in )
    select *
    from book
    where publisher not in('대한미디어', '굿스포츠');
    
    ----------------------------------------------------------------------------
    
    --  
    --      2) 패턴 like
    --          % : 여러문자 대신(위치값 상관없음) 
    --          _ : 한 글자 대신 (위치값 필요, 글자수 중요)
    
    --      ** 원하는 데이터를 정확하게 알지 못할때 사용한다.
    
    --  축구의 역사를 출간한 출판사를 검색
    --  방법1 ( = )
    select publisher
    from book
    where bookname = '축구의 역사';
    --  방법2 ( like )
    select publisher
    from book
    where bookname like '축구의 역사';
    
    --  도서이름에 축구가 포함된 출판사를 검색
    --  글자수와 상관없으면 %
    select bookname, publisher
    from book
    where bookname like '%축구%'; -- 축구를 포함하는
    
    select bookname, publisher
    from book
    where bookname like '야구%'; -- 야구로 시작하는
    
    select bookname, publisher
    from book
    where bookname like '%여자'; -- 여자로 끝나는
    
    --  도서이름의 왼쪽 두번째 위치에 구라는 문자열을 갖는 도서를 검색
    --  글자수, 위치값이 중요하면 _
    select bookname, publisher
    from book
    where bookname like '_구%';  -- **뒤에 글자가 상관없다는 % 표시를 해줘야함
    
    --  축구에 관한 도서중 가격이 20000원 이상인 도서의 모든 정보를 검색
    select *
    from book
    where bookname like '%축구%' and price >= 20000;
    
    --  orderid 1,3,5,7,9 의 자료의 날짜 변경 (2020/08/15)
    update orders
    set orderdate = '2020/08/15'
    where orderid in(1,3,5,7,9);
    
    --  orders 테이블에서 7월인 자료만 검색
    select *
    from orders
    where orderdate like ('2020-07%');  -- **DB 날짜 형식 확인하기 
                                        -- (도구 - 환경설정 - 데이터베이스 - NLS - 날짜형식)
    
    --  orders 테이블에서 orderdate 가 2020년인 모든 정보 보기
    select *
    from orders
    where orderdate >= '2020/01/01' and orderdate <= '2020/12/31';
    
    select *
    from orders
    where orderdate between '2020/01/01' and '2020/12/31';
    
    select *
    from orders
    where orderdate like '2020%';
    
    --------------------------------------------------------------------------------------
    
    연습문제
    
    1. 도서번호가 1인 도서의 이름
    select bookname
    from book
    where bookid = 1;
    
    2. 가격이 20000원 이상인 도서의 이름
    select bookname
    from book
    where price >= 20000;
    
    3. 모든고객의 이름, 주소
    select name, address
    from customer;
    
    4. 2020년 7월 4일~7월 7일 사이에 주문받은 도서의 주문번호
    select orderid
    from orders
    where orderdate between '2020-07-04' and '2020-07-07';
    
    5. 2020년 7월 4일~7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호 
    select orderid
    from orders
    where orderdate not between '2020/07/04' and '2020/07/07';
    
    6. 성이 ‘김’ 씨인 고객의 이름과 주소
    select name, address
    from customer
    where name like '김%';
  
    7. 성이 ‘김’ 씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소
    select name, address
    from customer
    where name like '김%아';
    
    -----------------------------------------------------------------------------
    
    --  3. order by : 정렬
    --      ** 항상 맨 마지막 줄에 넣어주어야 한다.
    --     [order by 속성이름 [ASC]ㅣ DESC ]
    --      ** ASC(생략) 오름차순 / DESC 내림차순
    
    --      정렬이 여러개인 경우
    --      [order by 정렬1, 정렬2, 정렬3 ... ]
    
    --  도서를 이름순으로 검색 ( 오름차순 : 영어 > 한글 )
    select *
    from book
    order by bookname desc;
    
    --  도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색
    select *
    from book
    order by price , bookname;
    
    --  도서를 가격의 내림차순 검색 후 가격이 같다면 출판사의 오름차순 검색
    select *
    from book
    order by price desc , publisher;
    
    -------------------------------------------------------------------------------
    
    --  group by 설명을 위해
    
    --  집계 함수 : sum(컬럼명) / avg(컬럼명) / max(컬럼명) / min(컬럼명) / count(컬럼명 또는 *)
       
    --  고객이 주문한 도서의 총 판매액
        select sum(saleprice) as 총_판매액
        from orders;
        
    --  2번 김연아 고객이 주문한 도서의 총 판매액
        select sum(saleprice) as 김연아_고객_총_판매액
        from orders
        where custid = 2;
        
    --  고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가, 도서판매건수를 구하라
        select sum(saleprice) 총_판매액, avg(saleprice) 평균값, min(saleprice) 최저가, max(saleprice) 최고가, count(*) 도서판매건수
        from orders;
    
    --  2번 김연아 고객이 주문한 도서 판매 건수
        select count(*) 김연아_고객_도서판매건수
        from orders
        where custid = 2;
    
    --  박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
        select sum(saleprice) as 박지성의_총_구매액
        from orders
        where custid = 1;
    
    --  박지성이 구매한 도서의 수
        select count(*) 박지성이_구매한_도서의_수
        from orders
        where custid = 1;
    
    --  도서의 총 개수
        select count(*)
        from book;
        
  **--  도서를 출고하는 출판사의 총 개수
    --  ** 중복제거가 먼저 , 그다음 count
        select count(distinct publisher) 
        from book;
        
    --  주문 금액의 총액과 주문의 평균 금액
        select sum(saleprice), avg(saleprice)
        from orders;
        
    ------------------------------------------------------------------------------
    
    --  5. group by : **속성의 데이터 값이 같은 것 끼리 그룹을 만든다.
    --                집계 함수도 사용할 수 있다.
    
    --      select  group by 에서 사용한 속성, 집계함수들
    --      from 테이블이름
    --      [where 조건식]
    --      group by 묶을 컬럼명
    --      [having 조건식(select 에 사용한 것만 가능)]
    
    --  고객별로 주문한 도서의 총 수량과 총 판매액
    select custid, count(*), sum(saleprice)
    from orders
    group by custid;
    
    -- 고객별 주문 도서의 총 수량을 구하시오. 단, 세 권 이상 구매한 고객만
    select custid, count(*)
    from orders
    group by custid
    having count(*) >= 3;

    -- 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 
    -- 단, 두 권 이상 구매한 고객만 구한다.
    select custid, count(*)
    from orders
    where saleprice >= 8000
    group by custid
    having count(*) >= 2
    order by custid;
    
    --  과제테이블에서 학생이 10명이상 가입한 동아리에 대하여 동아리와 제출한 총 과제 수를 출력하시오.
    select 동아리, count(과제)
    from 과제
    where 학생 >= 10
    group by 동아리;
    
    --  출판사의 이름을 중복없이 출력 
    select distinct publisher , count(*)
    from book  
    group by publisher

    
    
    
    
    
    
    
    