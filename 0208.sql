    
    --  PL/SQL : ����Ŭ���� �����ϴ� ���α׷��� ����� Ư���� ������ SQL �� Ȯ��
    --          ���� ����, SQL �� ������ + ���(if, for, loop)�� ���
    --          => ������ ���α׷��� �����ϰ� �� ����Ŭ SQL ������
    
    --  1. ���ν��� : �Ϸ��� ������ ��ġ �ϳ��� �Լ�ó�� �����ϱ� ���� ������ ����
    --          ������ ����. ������� ����.
    
    --      �͸� ���ν��� : ���� �ȵǰ�, ��� ���� ����ϴٰ� ���� (��ȸ��)
    
    --      ���� ���ν��� : ����Ǽ� ���߿� ȣ���Ͽ� ����Ѵ�.
    
    --      1) �͸� ���ν��� 
    --      ����) declare
    --              �������� ;
    --           begin
    --              SQL ���ڵ� (�񱳿����� ��� ����)
    --           end ;
    
    --      < �͸� ���ν����� Ȱ���� ��� ����(PL/SQL) >
    --              int i = 0 ;      ->        i int := 0 ;
    --      System.out.println(����); ->  dbms_output.put_line(����);
    --      (��, dbms_output.put_line(����) ����ϱ� ���ؼ��� ** set serveroutput on; �� �����ؾ��Ѵ�.)
    
    --      System.out.println( i + "�� i�̴�." );
    --      -> dbms_output.put_line( i || '�� i�̴�.' );
    --      (���ڸ� ������ ���� ������ 2�� || �� ����Ѵ�.) 
    
    --      1. �ܼ� if �� ����
    --          if ���ǽ� then ��ɹ�(SQL��);
    --          end if;
    
            -- ���� i �� 10 �̸� �����͸� ���
            set serveroutput on;
            --  ** �����͸� ����ϱ� ���ؼ��� �ݵ�� �� ��ɹ��� ����ؾ� �Ѵ�.
            declare
                i int := 10;
                --i number := 10;
            begin
                if (i=10) then dbms_output.put_line('i�� ' || i || ' �̴�.');
                end if;
            end;
            
            -- ���� hak �� A �̸� �����͸� ���
            declare
                hak varchar2(50) := 'A';
            begin
                if (hak = 'A') then dbms_output.put_line('hak�� ' || hak || ' �̴�.');
                end if;
            end;
            
    --      2. if ~ else ��
    --         if ���ǽ� then ���϶� ��ɹ�1(SQL��);
    --         else �����϶� ��ɹ�2(SQL��);
    --         end if;
            
            --  ���� i �� Ȧ������, ¦������ �Ǻ�����
            --  mod(a, b) : a�� b�� ���� ������
            declare
                i number := 54;
            begin
                if(mod(i,2) = 0) then dbms_output.put_line( i || '�� ¦���̴�.');
                else dbms_output.put_line( i || '�� Ȧ���̴�.');
                end if;
            end;
            --  �ٸ� ���
            declare
                i number := 77;
                res varchar2(50) := '';
            begin
                if(mod(i,2) = 0) then res := '¦��';  -- ** �����Ҷ��� := ����Ѵ�.
                else res := 'Ȧ��';
                end if;
                dbms_output.put_line( i || '�� ' || res || '�̴�.');
            end;
    
    --      3. ���� if �� 
    --          if ���ǽ�1 then ��ɹ�1;
    --          elsif ���ǽ�2 then ��ɹ�2;
    --          elsif ���ǽ�3 then ��ɹ�3;
    --          elsif ���ǽ�4 then ��ɹ�4;
    --          else ��ɹ�5;
    --          end if;
    
            --  ���� i �� 90 �̻��̸� A, 80 �̻��̸� B, 70 �̻��̸� C, �������� F
            declare
                i number := 77;
            begin
                if (i >= 90) then dbms_output.put_line(i || ' : A����');
                elsif (i >= 80) then dbms_output.put_line(i || ' : B����');
                elsif (i >= 70) then dbms_output.put_line(i || ' : C����');
                else dbms_output.put_line(i || ' : F����');
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
                dbms_output.put_line('����� ������ ' || hak || ' �Դϴ�');
            end;
            
    --  �ݺ��� ( for , while , loop )
    
    --  1. for �� ����
    --      for ���� in �ʱⰪ..������ loop
    --        ��ɹ�(SQL��);
    --      end loop;
    
        --  1 ���� 10 ���� ���
        declare
        begin
            for i in 1..10 loop
                dbms_output.put_line('i = ' || i);
            end loop;
        end;
        
        --  1 ���� 10 ���� ¦���� ��� ( for �� �ȿ� if �� )
        declare
        begin
            dbms_output.put_line('¦���� ���');
            for i in 1..10 loop
                if(mod(i,2) = 0) then dbms_output.put_line('i = ' || i);
                end if;
            end loop;
        end;
        
        --  ¦���� �� ���
        declare
            res int := 0;
        begin
            for i in 1..10 loop
                if(mod(i,2) = 0) then res := res + i;
                end if;
            end loop;
            dbms_output.put_line('¦���� ���� ' || res);
        end;
        
    --  2. while �� ����
    --      while ���ǽ� loop
    --        ��ɹ�;
    --        ������;
    --      end loop;
        
        --  1~10 ���� ���
        declare
        i int := 1;
        begin
            while i<11 loop
                dbms_output.put_line('i�� ' || i);
                i := i + 1;
            end loop;
        end;
        
        --  1~10 ���� Ȧ���� ���
        declare
        i int := 1;
        begin
            while i<11 loop
                if (mod(i,2)=1) then dbms_output.put_line('i�� ' || i);
                end if;
                i := i + 1;
            end loop;
        end;
        
        --  1~10 ���� Ȧ���� �� ���
        declare
        i int := 1;
        res number := 0;
        begin
            while i<11 loop
                if (mod(i,2)=1) then res := res + i;
                end if;
                i := i + 1;
            end loop;
            dbms_output.put_line('Ȧ���� ���� ' || res);
        end;
        
    --  3. loop �� ����
    --      loop 
    --        ��ɹ�;
    --        ������;
    --        exit when ���ǽ� ;  => ���ǽ��� ���϶� Ż�� ( �ϴ� �ϰ� ���� �´�? )
    --      end loop;
    
        --  1~10 ���
            DECLARE
            i int := 1;
            BEGIN
                loop
                    dbms_output.put_line('i�� ' || i);
                    i := i + 1;
                    exit when i >= 11;
                end loop;
            end;
        
        --  1~10 ¦�� ���
            DECLARE
            i int := 1;
            BEGIN
                loop
                    if(mod(i,2)=0) then dbms_output.put_line('i�� ' || i);
                    end if;
                    i := i + 1;
                    exit when i=11;
                end loop;
            end;
        
        --  1~10 ¦�� �� ���
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
                dbms_output.put_line('¦���� ���� ' || res);
            end;
            
    --  �迭
    --      type �迭�̸� is varray(�迭ũ��) of �迭Ÿ�� ;
    
        type arr is VARRAY(5) of varchar2(50);
        type arr is VARRAY(5) of number;       
        
        --  �̸� �迭�� ��� �迭
        DECLARE
            -- �迭�� �����
            type name_arr is VARRAY(5) of varchar2(50); 
            type avg_arr is VARRAY(5) of number;
            -- �迭�� ������ ����, **�ڷ����� �迭�� ���� 
            -- �迭�� ������ ���� ����
            names name_arr;
            avgs avg_arr;
            total number;
        BEGIN
            names := name_arr('hong','park','kim','lee');
            avgs := avg_arr(85.2,77.3,95.4,60.8);
            -- total ���� ������ for �� ���� ���ؼ�
            total := names.count;
            -- **�迭�̸� for ��
            for i in 1..total loop
                dbms_output.put_line('�̸� : ' || names(i) || ', ��� : ' || avgs(i));
            end loop;
            dbms_output.put_line('�� �ο� : ' || total);
        end;
            
    --  < ���� ���ν����� Ȱ���� ��� ����(PL/SQL) >     ���ν����� ��ü�̴�.
     
    --  ���ν��� ���� 
    --       create [or replace] procedure �̸�
    --        as �Ǵ� is
    --        �������� ;
    --        begin
    --          ��ɹ� ( insert, delete, update ���� �Ϲ� SQL �� ����. / select ���� �ٸ���. )
    --        end ;
            
        --  �� ���̺��� �� ��ȣ�� 2 �� ���� �̸��� '�����' ���� ��������
            update customer set name = '�����' where custid = 2;
            --  �̸��� �� ��ȣ�� �޾Ƽ� ó���ϸ� SQL ���� ��� �� �ʿ䰡 ����.
            --  �ڹٿ��� �޼��带 ����Ͽ� ���ڸ� �޴� �Ͱ� ���� 
            --  ���ν����� ����ϸ� ���� ���� ���̺� ����Ǵ� ȿ���� ���� �� �ִ�.
            create procedure c_name01
            as
            begin
                update customer set name = '�����' where custid = 2;
            end;
            --  ������ ���� �������� ������ ������ x �� ������ ��ġ��� ���´�.
            create procedure c_name02
            as
            begin
                update customer set name := '�����' where custid = 2
            end;
            
    --  ���ν��� ����
    --      drop procedure �̸�;
    
            drop procedure c_name02;
            
    --  ���ν����� ��������� �������� �ʾƼ� ���̺��� ��������� �ʰ� �״�� �ִ�.        
        select * from customer;    
            
    --  ���ν��� ����
    --      exec ���ν��� �̸� ;
    
        exec c_name01;
        
        commit;
        
    --  ���ν����� ���� 
    --      �ܺ� ������ �޾Ƽ� SQL ���� ó���ϰ� �ʹ�.
    --      �ܺο��� ������ �޴� �� => ����, �Ű�����(�ڹ�) => in, out(���ν���)
    --      **������ Ÿ���� �� �� => ���̺��̸�.�÷���%type => �ش� ���̺� �÷��� ������ Ÿ���� �����´�.
    
        -- �ܺο��� ����ȣ�� �̸��� �޾Ƽ� �����̺��� �����ϴ� ���ν����� ������
        --  ���ڸ� () �ȿ� �־�����
        create procedure c_name02(v_custid in customer.custid%type, v_name in customer.name%type)
        as 
        begin
            update customer set name = v_name where custid = v_custid;
        end;
        --  ������ �Ǹ� ���ν��� ���ΰ�ħ �� ������ �ȳ����� Ȯ������
        --  �� �� ����
        exec c_name02(2,'����ȣ');
        --  ���̺� Ȯ��
        select * from customer;
        
        --  �� ���̺� (����������) �̸��� �Ѹ� , �ּҴ� ���ѹα� ���е� , ������ 000-2000-0001
        --  �����ϴ� ���ν����� ������ ( p_cust01 )
        create procedure p_cust01 as
        begin
            insert into customer3 (custid, name, address, phone)
             values (customer3_seq.nextval ,'�Ѹ�', '���ѹα� ���е�', '000-2000-0001');
        end;
        --  ����
        exec p_cust01;
        --  Ȯ��
        select * from customer3;
        
        --  �� ���̺� (����������) �ܺο��� �̸�, �ּ�, ������ �޾Ƽ� 
        --  �����ϴ� ���ν����� ������ ( p_cust02 )
        create procedure p_cust02(name in customer3.name%type, 
         address in customer3.address%type, phone in customer3.phone%type)
        as
        begin
            insert into customer3 (custid, name, address, phone)
             values (customer3_seq.nextval, name, address, phone);
        end;
        --  ����, in �� �ֱ�   
        exec p_cust02('��浵��������' , '�����ݴ�����' , '0156489713654' );   
        --  Ȯ��
        select * from customer3;
        
        --  ����ȣ�� �޾Ƽ� �����ϴ� ���ν����� ������ ( p_cust03 )
        create procedure p_cust03( p_custid in customer.custid%type)
        as
        begin
            delete from customer where custid = p_custid;
        end;
        --  ����
        exec p_cust03(6);
        --  Ȯ��
        select * from customer;
        
        --  c r u d   create insert update delete
        
        --  �� ���̺��� �����ϸ� ��2 ���̺� ���Եȴ�.
        
        
    --  ** begin ~ end ; ��� �ȿ��� ���Ǵ� select ��
    
    --   1) ����� �ϳ� �϶�
    --      select �÷���
    --      into ���庯�� (������� ����)
    --      from ���̺��̸�
    --      where ���ǽ� ;
    --  => ����� �ϳ� ������ ���� ����� ���庯���� �����Ѵ�.
    
        --  ����) ���� ���̺��� ������, ����, ���ǻ縦 �޾Ƽ� 
        --       ������� ���ǻ簡 ������ ������Ʈ, ������ ��������.(p_book01)
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
                --  select ������ �ִ��� ������ �˻��ؼ� 
                --  ������ ����, ������ ������Ʈ
                if(cnt = 0) then 
                    insert into book3(bookid, bookname, publisher, price) 
                     values(book3_seq.nextval, b_bookname, b_publisher, b_price);
                else 
                    update book3 
                    set price = b_price 
                    where bookname = b_bookname and publisher = b_publisher;
                end if;
            end;
            --  ����
            exec p_book01('�౸���̺�', 34000, '�Ѻ���ī����'); -- ��� ����
            exec p_book01('���� ���̺�', 44000, '���ѹ̵��');  -- �־ ����
            --  Ȯ��
            select * from book3;
            
    -- ** select ���� �������϶�
    
        --  ������ȣ�� �޾Ƽ� ����3 ���̺����� �����ϰ� ����4 ���̺� ��������
        
        --  ���� ���̺��� ������ ������ ����4 ���̺� ������ 
        create table book4 as select * from book where 1 = 0;
        --  ������ ����
        create sequence book4_seq 
        increment by 1
        start with 1
        nocycle;
        --  ���ν��� ����
        create procedure p_book02(b_bookid in book3.bookid%type)
        as  -- **���ڱ� ������ �������� as ���� ������ ������Ѵ�.
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
            -- else �Ǵ� exception ó���� �ؾ��Ѵ�.
            else
                dbms_output.put_line('���̵� �������� �ʽ��ϴ�.');
            end if;
        end;
        --  ����
        exec p_book02(44);
        --  Ȯ��
        select * from book3; -- ������
        select * from book4; -- ���Ե�
        
   
    --  ** out �� �̿��ؼ� ���ν��� ����� ��������
    --  �������̺��� ��հ����� ��ȯ�ϴ� ���ν��� �����
        create procedure avg_price(avg_bookprice out number)
        as
        begin
            select avg(price)
            into avg_bookprice
            from book3
            where price is not null;
        end;
        --  ���� �ȵ�
        --exec avg_price();
            
    --  �͸� ���ν����� ����ϰų�, �ٸ� ���� ���ν������� ȣ���Ѵ�.    
    --  1. �͸�
        declare
        aaa number;
        begin
            --  �̸� ����� ���� ���ν��� ȣ��
            --  ������ ���� ������ �޾�����
            avg_price(aaa);
            dbms_output.put_line('å�� ��� : ' || trunc(aaa));
        end;
        
    --  å�̸��� �޾Ƽ� å�̸��� ������ ����ϴ� ���ν��������
        --  ���1 ( in �� )
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
        -- ����
        exec p_book03('���� ���̺�');
        --  Ȯ��
        select * from book3;
        
        --  ���2 ( in , out��� )
        create procedure b_test01(b_name in book3.bookname%type, 
                     p_name out book3.bookname%type, p_price out book3.price%type)
        as
        begin
            select bookname, price 
            into p_name, p_price
            from book3
            where bookname = b_name;
        end;
        --  out ������ ���� �͸��̳� �ٸ� ���ν������� ȣ��
        --  �͸�
        declare
        aa book3.bookname%type;
        bb book3.price%type;
        begin
            b_test01('���� ���̺�', aa, bb);
            dbms_output.put_line('å�̸� : ' || aa || ', ���� : ' || bb);
        end;
        
------------------------------------------------------------------------------------
    
    --  function �Լ� : ���ν����� ���������� ���� �� ����
    --      ** �Ϲ� SQL �������� function �� ȣ�� �� �� �ִ�. (���ν����� �ٸ���)
    --      ������ �ִ�. ������� �ִ�.
    --      function �� return ���� �ݵ�� ����ؾ� �ȴ�.
    --          ( ���ν����� in �Է�, out ���, in �� out �� ���û����̴�. ) 
    
    --  ����) create function �̸�()
    --        return ������Ÿ��
    --        as
    --          �������� ; 
    --        begin
    --          ��ɹ�(SQL��) ;
    --        end ;
    
    --  ����) SQL ������ ȣ���� �� �ִ�.
    
        --  �ܺο��� ������ �޾Ƽ� 
        --  �Ǹŵ� ������ ���� ������ ����ϴ� �Լ� (fnc_interest)
        --  ������ 30000 �� �̻��̸� 10%, 30000�� �̸��̸� 5%
        create function fnc_interest(f_price in orders2.saleprice%type)
        return number -- ��ȯ�ϴ� ������ �ڷ���
        as
            myprice number;  -- ����� ����޾Ƽ� ��ȯ�ϴ� ����
        begin
            if(f_price >= 30000) then myprice := f_price * 0.1;
            else myprice := f_price * 0.05;
            end if;
            return myprice; -- ��ȭ�ϴ� ������ ������ ��
        end;
        
        -- ���� : �Ϲ� SQL ������ ȣ�� ����
        select o.*, fnc_interest(o.saleprice) as ������ 
        from orders2 o; 
        --  ����� �ٷ� ���δ�.
        
    --  ��¥�� �޾Ƽ� ��¥������ �����ϴ� �Լ��� ������ ( fnc_orderdate )
        create function fnc_orderdate(f_date in orders2.orderdate%type)
        return varchar2
        as mydate varchar2(50);
        begin
            -- ** Ȭ����ǥ '' �ȿ��� �ֵ���ǥ ""�� ���ڸ� �߰��� �� �ִ�. 
            mydate := to_char(f_date, 'yyyy"��"mm"��"dd"��"day'); -- ������ day 
            return mydate;
        end;
        -- ����
        select o.*, fnc_orderdate(o.orderdate)
        from orders2 o;
        
---------------------------------------------------------------------------------

    --  Ŀ�� cursor : ���� ��� ���̺��� �ѹ��� ���྿ ó���ϱ� ���ؼ�
    --              ���̺��� ���� ������� ����Ű�µ� ���
    
    --      �Ͻ��� Ŀ�� : �ڵ����� ������ ����, �׸��� ������ ó���� �ȴ�.
    --      ����� Ŀ�� : �������� �����ڿ� ���� ����, ����, ������ó���� �ȴ�.
    
    --  Ŀ���� ���õ� Ű����
    --      cursor Ŀ���� is Ŀ�� ���� => Ŀ�� ����
    --      open Ŀ���� => Ŀ�� ��� ����
    --      fetch Ŀ���� into ���� => �� �����͸� ������
    --      close Ŀ���� => Ŀ�� ��� ��
    
    --      rowcount : ���� ��
    --      isopen : �Ͻ����϶� �׻� true
    --               ������϶� ������ ������ �˾ƺ��� �����
    --      found : ����� �� �� �̻��̸� true
    --      notfound : ����� �ϳ��� ������ true
    
    --  ����� Ŀ��
        create procedure cursor_test 
        as
            cursor cur is select bookname from book3;
            b_name book3.bookname%type;
        begin
            open cur;
            loop
                fetch cur into b_name;
                dbms_output.put_line(b_name);
                exit when cur %notfound; -- Ŀ���� ���� ��� ����
            end loop;
            close cur;
        end;
        -- ����
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
                exit when cur %notfound; -- Ŀ���� ���� ��� ����
            end loop;
            close cur;
        end;
        -- ����
        exec cursor_test2;
        
        --  �ֹ� ���̺��� 20000 �̻��̸� 10% , 20000 �̸��̸� 5% �� �̿��ؼ�
        --  ���ͱ��� ����
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
                dbms_output.put_line('���ͱ� : ' || res);
                exit when cur %notfound;
            end loop;         
            close cur;
        end;
        -- ���� 
        exec cursor_test3;
        
        -- ���ͱݰ� ������ 
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
                dbms_output.put_line('å�̸� : ' || mybook || ', ���ͱ� : ' || res);
                exit when cur %notfound;
            end loop;         
            close cur;
        end;
        -- ���� 
        exec cursor_test4;
    
        select o.*, b.* from orders2 o, book2 b where o.bookid = b.bookid
  ----------------------------------------------------------------------------------

    
    
    
    
    