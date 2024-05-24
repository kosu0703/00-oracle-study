    
    --  PL/SQL : 오라클에서 지원하는 프로그래밍 언어의 특성을 수용한 SQL 의 확장
    --          쉽게 말해, SQL 의 쿼리문 + 제어문(if, for, loop)을 사용
    --          => 절차적 프로그램이 가능하게 한 오라클 SQL 전용언어
    
    --  1. 프로시저 : 일련의 쿼리를 마치 하나의 함수처럼 실행하기 위한 쿼리의 집합
    --          리턴이 없다. 결과값이 없다.
    
    --      익명 프로시저 : 저장 안되고, 잠깐 만들어서 사용하다가 버림 (일회용)
    
    --      저장 프로시저 : 저장되서 나중에 호출하여 사용한다.
    
    --      1) 익명 프로시저 
    --      형식) declare
    --              변수선언 ;
    --           begin
    --              SQL 문자들 (비교연산자 사용 가능)
    --           end ;
    
    --      < 익명 프로시저를 활용한 제어문 연습(PL/SQL) >
    --              int i = 0 ;      ->        i int := 0 ;
    --      System.out.println(내용); ->  dbms_output.put_line(내용);
    --      (단, dbms_output.put_line(내용) 사용하기 위해서는 ** set serveroutput on; 을 실행해야한다.)
    
    --      System.out.println( i + "는 i이다." );
    --      -> dbms_output.put_line( i || '는 i이다.' );
    --      (문자를 연결할 때는 수직바 2개 || 를 사용한다.) 
    
    --      1. 단순 if 문 형식
    --          if 조건식 then 명령문(SQL문);
    --          end if;
    
            -- 변수 i 가 10 이면 데이터를 출력
            set serveroutput on;
            --  ** 데이터를 출력하기 위해서는 반드시 위 명령문을 사용해야 한다.
            declare
                i int := 10;
                --i number := 10;
            begin
                if (i=10) then dbms_output.put_line('i는 ' || i || ' 이다.');
                end if;
            end;
            
            -- 변수 hak 이 A 이면 데이터를 출력
            declare
                hak varchar2(50) := 'A';
            begin
                if (hak = 'A') then dbms_output.put_line('hak은 ' || hak || ' 이다.');
                end if;
            end;
            
    --      2. if ~ else 문
    --         if 조건식 then 참일때 명령문1(SQL문);
    --         else 거짓일때 명령문2(SQL문);
    --         end if;
            
            --  변수 i 가 홀수인지, 짝수인지 판별하자
            --  mod(a, b) : a를 b로 나눈 나머지
            declare
                i number := 54;
            begin
                if(mod(i,2) = 0) then dbms_output.put_line( i || '는 짝수이다.');
                else dbms_output.put_line( i || '는 홀수이다.');
                end if;
            end;
            --  다른 방법
            declare
                i number := 77;
                res varchar2(50) := '';
            begin
                if(mod(i,2) = 0) then res := '짝수';  -- ** 저장할때는 := 사용한다.
                else res := '홀수';
                end if;
                dbms_output.put_line( i || '는 ' || res || '이다.');
            end;
    
    --      3. 다중 if 문 
    --          if 조건식1 then 명령문1;
    --          elsif 조건식2 then 명령문2;
    --          elsif 조건식3 then 명령문3;
    --          elsif 조건식4 then 명령문4;
    --          else 명령문5;
    --          end if;
    
            --  변수 i 가 90 이상이면 A, 80 이상이면 B, 70 이상이면 C, 나머지는 F
            declare
                i number := 77;
            begin
                if (i >= 90) then dbms_output.put_line(i || ' : A학점');
                elsif (i >= 80) then dbms_output.put_line(i || ' : B학점');
                elsif (i >= 70) then dbms_output.put_line(i || ' : C학점');
                else dbms_output.put_line(i || ' : F학점');
                end if;
            end;
            
            declare
                i int := 95;
                hak varchar2(50) := '';
            begin
                if(i>=90) then hak := 'A';
                elsif(i>=80) then hak := 'B';
                elsif(i>=70) then hak := 'C';
                else hak := 'F';
                end if;
                dbms_output.put_line('당신의 성적은 ' || hak || ' 입니다');
            end;
            
    --  반복문 ( for , while , loop )
    
    --  1. for 문 형식
    --      for 변수 in 초기값..최종값 loop
    --        명령문(SQL문);
    --      end loop;
    
        --  1 부터 10 까지 출력
        declare
        begin
            for i in 1..10 loop
                dbms_output.put_line('i = ' || i);
            end loop;
        end;
        
        --  1 부터 10 까지 짝수만 출력 ( for 문 안에 if 문 )
        declare
        begin
            dbms_output.put_line('짝수만 출력');
            for i in 1..10 loop
                if(mod(i,2) = 0) then dbms_output.put_line('i = ' || i);
                end if;
            end loop;
        end;
        
        --  짝수의 합 출력
        declare
            res int := 0;
        begin
            for i in 1..10 loop
                if(mod(i,2) = 0) then res := res + i;
                end if;
            end loop;
            dbms_output.put_line('짝수의 합은 ' || res);
        end;
        
    --  2. while 문 형식
    --      while 조건식 loop
    --        명령문;
    --        증감식;
    --      end loop;
        
        --  1~10 까지 출력
        declare
        i int := 1;
        begin
            while i<11 loop
                dbms_output.put_line('i는 ' || i);
                i := i + 1;
            end loop;
        end;
        
        --  1~10 까지 홀수만 출력
        declare
        i int := 1;
        begin
            while i<11 loop
                if (mod(i,2)=1) then dbms_output.put_line('i는 ' || i);
                end if;
                i := i + 1;
            end loop;
        end;
        
        --  1~10 까지 홀수의 합 출력
        declare
        i int := 1;
        res number := 0;
        begin
            while i<11 loop
                if (mod(i,2)=1) then res := res + i;
                end if;
                i := i + 1;
            end loop;
            dbms_output.put_line('홀수의 합은 ' || res);
        end;
        
    --  3. loop 문 형식
    --      loop 
    --        명령문;
    --        증감식;
    --        exit when 조건식 ;  => 조건식이 참일때 탈출 ( 일단 하고 조건 맞니? )
    --      end loop;
    
        --  1~10 출력
            DECLARE
            i int := 1;
            BEGIN
                loop
                    dbms_output.put_line('i는 ' || i);
                    i := i + 1;
                    exit when i >= 11;
                end loop;
            end;
        
        --  1~10 짝수 출력
            DECLARE
            i int := 1;
            BEGIN
                loop
                    if(mod(i,2)=0) then dbms_output.put_line('i는 ' || i);
                    end if;
                    i := i + 1;
                    exit when i=11;
                end loop;
            end;
        
        --  1~10 짝수 합 출력
            DECLARE
            i int := 1;
            res int := 0;
            BEGIN
                loop
                    if(mod(i,2)=0) then res := res + i;
                    end if;
                    i := i + 1;
                    exit when i=11;
                end loop;
                dbms_output.put_line('짝수의 합은 ' || res);
            end;
            
    --  배열
    --      type 배열이름 is varray(배열크기) of 배열타입 ;
    
        type arr is VARRAY(5) of varchar2(50);
        type arr is VARRAY(5) of number;       
        
        --  이름 배열과 평균 배열
        DECLARE
            -- 배열을 만들고
            type name_arr is VARRAY(5) of varchar2(50); 
            type avg_arr is VARRAY(5) of number;
            -- 배열을 저장할 변수, **자료형을 배열로 지정 
            -- 배열을 저장할 변수 선언
            names name_arr;
            avgs avg_arr;
            total number;
        BEGIN
            names := name_arr('hong','park','kim','lee');
            avgs := avg_arr(85.2,77.3,95.4,60.8);
            -- total 구한 이유는 for 문 쓰기 위해서
            total := names.count;
            -- **배열이면 for 문
            for i in 1..total loop
                dbms_output.put_line('이름 : ' || names(i) || ', 평균 : ' || avgs(i));
            end loop;
            dbms_output.put_line('총 인원 : ' || total);
        end;
            
    --  < 저장 프로시저를 활용한 제어문 연습(PL/SQL) >     프로시저도 객체이다.
     
    --  프로시저 생성 
    --       create [or replace] procedure 이름
    --        as 또는 is
    --        변수선언 ;
    --        begin
    --          명령문 ( insert, delete, update 문은 일반 SQL 과 같다. / select 문은 다르다. )
    --        end ;
            
        --  고객 테이블에서 고객 번호가 2 인 고객의 이름을 '손흥민' 으로 변경하자
            update customer set name = '손흥민' where custid = 2;
            --  이름과 고객 번호를 받아서 처리하면 SQL 문을 계속 쓸 필요가 없다.
            --  자바에서 메서드를 사용하여 인자만 받는 것과 같이 
            --  프로시저를 사용하면 리턴 없이 테이블만 변경되는 효과를 얻을 수 있다.
            create procedure c_name01
            as
            begin
                update customer set name = '손흥민' where custid = 2;
            end;
            --  오류가 나도 컴파일은 되지만 빨간색 x 가 나오고 고치라고 나온다.
            create procedure c_name02
            as
            begin
                update customer set name := '손흥민' where custid = 2
            end;
            
    --  프로시저 삭제
    --      drop procedure 이름;
    
            drop procedure c_name02;
            
    --  프로시저는 만들었지만 실행하지 않아서 테이블이 변경되지는 않고 그대로 있다.        
        select * from customer;    
            
    --  프로시저 실행
    --      exec 프로시저 이름 ;
    
        exec c_name01;
        
        commit;
        
    --  프로시저의 목적 
    --      외부 정보를 받아서 SQL 문을 처리하고 싶다.
    --      외부에서 정보를 받는 것 => 인자, 매개변수(자바) => in, out(프로시저)
    --      **데이터 타입을 모를 때 => 테이블이름.컬럼명%type => 해당 테이블 컬럼의 데이터 타입을 가져온다.
    
        -- 외부에서 고객번호와 이름을 받아서 고객테이블을 수정하는 프로시저를 만들자
        --  인자를 () 안에 넣어주자
        create procedure c_name02(v_custid in customer.custid%type, v_name in customer.name%type)
        as 
        begin
            update customer set name = v_name where custid = v_custid;
        end;
        --  컴파일 되면 프로시저 새로고침 후 오류가 안나는지 확인하자
        --  그 후 실행
        exec c_name02(2,'박찬호');
        --  테이블 확인
        select * from customer;
        
        --  고객 테이블에 (시퀀스있음) 이름은 둘리 , 주소는 대한민국 방학동 , 전번은 000-2000-0001
        --  삽입하는 프로시저를 만들자 ( p_cust01 )
        create procedure p_cust01 as
        begin
            insert into customer3 (custid, name, address, phone)
             values (customer3_seq.nextval ,'둘리', '대한민국 방학동', '000-2000-0001');
        end;
        --  실행
        exec p_cust01;
        --  확인
        select * from customer3;
        
        --  고객 테이블에 (시퀀스있음) 외부에서 이름, 주소, 전번을 받아서 
        --  삽입하는 프로시저를 만들자 ( p_cust02 )
        create procedure p_cust02(name in customer3.name%type, 
         address in customer3.address%type, phone in customer3.phone%type)
        as
        begin
            insert into customer3 (custid, name, address, phone)
             values (customer3_seq.nextval, name, address, phone);
        end;
        --  실행, in 값 넣기   
        exec p_cust02('고길도르도르도' , '지구반대편어딘가' , '0156489713654' );   
        --  확인
        select * from customer3;
        
        --  고객번호를 받아서 삭제하는 프로시저를 만들자 ( p_cust03 )
        create procedure p_cust03( p_custid in customer.custid%type)
        as
        begin
            delete from customer where custid = p_custid;
        end;
        --  실행
        exec p_cust03(6);
        --  확인
        select * from customer;
        
        --  c r u d   create insert update delete
        
        --  고객 테이블에서 삭제하면 고객2 테이블에 삽입된다.
        
        
    --  ** begin ~ end ; 블록 안에서 사용되는 select 문
    
    --   1) 결과가 하나 일때
    --      select 컬럼명
    --      into 저장변수 (결과값을 저장)
    --      from 테이블이름
    --      where 조건식 ;
    --  => 결과가 하나 나오고 나온 결과를 저장변수에 저장한다.
    
        --  연습) 도서 테이블에서 도서명, 가격, 출판사를 받아서 
        --       도서명과 출판사가 같으면 업데이트, 없으면 삽입하자.(p_book01)
            select * from book3;
            
            create procedure p_book01(b_bookname in book3.bookname%type, b_price in book3.price%type,
                                        b_publisher in book3.publisher%type) 
            as
                cnt number;
            begin
                select count(*) 
                into cnt
                from book3
                where bookname = b_bookname and publisher = b_publisher;
                --  select 문으로 있는지 없는지 검사해서 
                --  없으면 삽입, 있으면 업데이트
                if(cnt = 0) then 
                    insert into book3(bookid, bookname, publisher, price) 
                     values(book3_seq.nextval, b_bookname, b_publisher, b_price);
                else 
                    update book3 
                    set price = b_price 
                    where bookname = b_bookname and publisher = b_publisher;
                end if;
            end;
            --  실행
            exec p_book01('축구바이블', 34000, '한빛아카데미'); -- 없어서 삽입
            exec p_book01('골프 바이블', 44000, '대한미디어');  -- 있어서 수정
            --  확인
            select * from book3;
            
    -- ** select 문이 여러개일때
    
        --  도서번호를 받아서 도서3 테이블에서는 삭제하고 도서4 테이블에 삽입하자
        
        --  도서 테이블의 구조를 복사한 도서4 테이블 만들자 
        create table book4 as select * from book where 1 = 0;
        --  시퀀스 생성
        create sequence book4_seq 
        increment by 1
        start with 1
        nocycle;
        --  프로시저 생성
        create procedure p_book02(b_bookid in book3.bookid%type)
        as  -- **갑자기 나오는 변수들은 as 에서 선언을 해줘야한다.
            cnt number := 0;
            i_bookname book3.bookname%type; 
            i_publisher book3.publisher%type; 
            i_price book3.price%type;
        begin
            select count(*)
            into cnt
            from book3
            where bookid = b_bookid;
            
            select bookname, publisher, price 
            into i_bookname, i_publisher, i_price
            from book3
            where bookid = b_bookid;
            
            if(cnt=1) then
                delete from book3 where bookid = b_bookid;
                insert into book4 (bookid, bookname, publisher, price)
                 values (book4_seq.nextval, i_bookname, i_publisher, i_price);
            -- else 또는 exception 처리를 해야한다.
            else
                dbms_output.put_line('아이디가 존재하지 않습니다.');
            end if;
        end;
        --  실행
        exec p_book02(44);
        --  확인
        select * from book3; -- 삭제됨
        select * from book4; -- 삽입됨
        
   
    --  ** out 을 이용해서 프로시저 결과를 내보내기
    --  도서테이블의 평균가격을 반환하는 프로시저 만들기
        create procedure avg_price(avg_bookprice out number)
        as
        begin
            select avg(price)
            into avg_bookprice
            from book3
            where price is not null;
        end;
        --  실행 안됨
        --exec avg_price();
            
    --  익명 프로시저를 사용하거나, 다른 저장 프로시저에서 호출한다.    
    --  1. 익명
        declare
        aaa number;
        begin
            --  미리 만들어 놓은 프로시저 호출
            --  나오는 값을 변수로 받아주자
            avg_price(aaa);
            dbms_output.put_line('책값 평균 : ' || trunc(aaa));
        end;
        
    --  책이름을 받아서 책이름과 가격을 출력하는 프로시저만들기
        --  방법1 ( in 만 )
        create procedure p_book03(b_bookname in book3.bookname%type)
        as
            i_bookname book3.bookname%type;
            i_price book3.price%type;
        begin
            select bookname, price 
            into i_bookname, i_price
            from book3
            where bookname = b_bookname;
    
            dbms_output.put_line(i_bookname || ' : ' || i_price);
        end;
        -- 실행
        exec p_book03('골프 바이블');
        --  확인
        select * from book3;
        
        --  방법2 ( in , out사용 )
        create procedure b_test01(b_name in book3.bookname%type, 
                     p_name out book3.bookname%type, p_price out book3.price%type)
        as
        begin
            select bookname, price 
            into p_name, p_price
            from book3
            where bookname = b_name;
        end;
        --  out 나가는 것을 익명이나 다른 프로시저에서 호출
        --  익명
        declare
        aa book3.bookname%type;
        bb book3.price%type;
        begin
            b_test01('골프 바이블', aa, bb);
            dbms_output.put_line('책이름 : ' || aa || ', 가격 : ' || bb);
        end;
        
------------------------------------------------------------------------------------
    
    --  function 함수 : 프로시저와 마찬가지로 저장 후 실행
    --      ** 일반 SQL 문에서는 function 을 호출 할 수 있다. (프로시저와 다른점)
    --      리턴이 있다. 결과값이 있다.
    --      function 은 return 예약어를 반드시 사용해야 된다.
    --          ( 프로시저는 in 입력, out 출력, in 과 out 은 선택사항이다. ) 
    
    --  형식) create function 이름()
    --        return 데이터타입
    --        as
    --          변수선언 ; 
    --        begin
    --          명령문(SQL문) ;
    --        end ;
    
    --  실행) SQL 문에서 호출할 수 있다.
    
        --  외부에서 가격을 받아서 
        --  판매된 도서에 대한 이익을 계산하는 함수 (fnc_interest)
        --  가격이 30000 원 이상이면 10%, 30000원 미만이면 5%
        create function fnc_interest(f_price in orders2.saleprice%type)
        return number -- 반환하는 변수의 자료형
        as
            myprice number;  -- 결과를 저장받아서 반환하는 변수
        begin
            if(f_price >= 30000) then myprice := f_price * 0.1;
            else myprice := f_price * 0.05;
            end if;
            return myprice; -- 반화하는 변수의 데이터 값
        end;
        
        -- 실행 : 일반 SQL 문에서 호출 가능
        select o.*, fnc_interest(o.saleprice) as 순이익 
        from orders2 o; 
        --  결과가 바로 보인다.
        
    --  날짜를 받아서 날짜형식을 변경하는 함수를 만들자 ( fnc_orderdate )
        create function fnc_orderdate(f_date in orders2.orderdate%type)
        return varchar2
        as mydate varchar2(50);
        begin
            -- ** 홑따옴표 '' 안에는 쌍따옴표 ""로 문자를 추가할 수 있다. 
            mydate := to_char(f_date, 'yyyy"년"mm"월"dd"일"day'); -- 요일은 day 
            return mydate;
        end;
        -- 실행
        select o.*, fnc_orderdate(o.orderdate)
        from orders2 o;
        
---------------------------------------------------------------------------------

    --  커서 cursor : 실행 결과 테이블을 한번에 한행씩 처리하기 위해서
    --              테이블의 행을 순서대로 가리키는데 사용
    
    --      암시적 커서 : 자동으로 열림과 닫힘, 그리고 데이터 처리가 된다.
    --      명시적 커서 : 수동으로 개발자에 의해 열림, 닫힘, 데이터처리가 된다.
    
    --  커서와 관련된 키워드
    --      cursor 커서명 is 커서 정의 => 커서 생성
    --      open 커서명 => 커서 사용 시작
    --      fetch 커서명 into 변수 => 행 데이터를 가져옴
    --      close 커서명 => 커서 사용 끝
    
    --      rowcount : 행의 수
    --      isopen : 암시적일때 항상 true
    --               명시적일때 열림과 닫힘을 알아보는 예약어
    --      found : 결과가 한 개 이상이면 true
    --      notfound : 결과가 하나도 없으면 true
    
    --  명시적 커서
        create procedure cursor_test 
        as
            cursor cur is select bookname from book3;
            b_name book3.bookname%type;
        begin
            open cur;
            loop
                fetch cur into b_name;
                dbms_output.put_line(b_name);
                exit when cur %notfound; -- 커서가 없는 경우 종료
            end loop;
            close cur;
        end;
        -- 실행
        exec cursor_test2;
        
        select * from book3;
       
        create procedure cursor_test2 
        as
            cursor cur is select bookname, price from book3;
            b_name book3.bookname%type;
            b_price book3.price%type;
        begin
            open cur;
            loop
                fetch cur into b_name, b_price;
                dbms_output.put_line(b_name || ', ' || b_price);
                exit when cur %notfound; -- 커서가 없는 경우 종료
            end loop;
            close cur;
        end;
        -- 실행
        exec cursor_test2;
        
        --  주문 테이블에서 20000 이상이면 10% , 20000 미만이면 5% 를 이용해서
        --  이익금을 보자
        create procedure cursor_test3
        as
            cursor cur is select saleprice from orders2;
            myprice orders2.saleprice%type;
            res number;
        begin
            open cur;
            loop
                fetch cur into myprice;
                if (myprice >= 20000) then res := myprice * 0.1;
                else res := myprice *0.05;
                end if;
                dbms_output.put_line('이익금 : ' || res);
                exit when cur %notfound;
            end loop;         
            close cur;
        end;
        -- 실행 
        exec cursor_test3;
        
        -- 이익금과 도서명 
        create procedure cursor_test4
        as
            cursor cur is select o.saleprice, b.bookname from orders2 o, book2 b where o.bookid = b.bookid;
            myprice orders2.saleprice%type;
            mybook book2.bookname%type;
            res number;
        begin
            open cur;
            loop
                fetch cur into myprice, mybook;
                if (myprice >= 20000) then res := myprice * 0.1;
                else res := myprice *0.05;
                end if;
                dbms_output.put_line('책이름 : ' || mybook || ', 이익금 : ' || res);
                exit when cur %notfound;
            end loop;         
            close cur;
        end;
        -- 실행 
        exec cursor_test4;
    
        select o.*, b.* from orders2 o, book2 b where o.bookid = b.bookid
  ----------------------------------------------------------------------------------

    
    
    
    
    