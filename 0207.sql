
    --  ���� �Լ� : ��� ����� ���� ���� ����Ŭ���� �����ϴ� ���� ���̺� dual 
    
    --  1. ���� ���� ���� �Լ�
    
    --      1) ���밪 : ABS(����)
            select abs(-78), abs(75), abs(-3.14), abs(3.14) 
            from dual;
            
    --      2) �ø� : ceil(����), �ڸ��� ������ ���� �Ҽ��� ����
    --              ����� ū ������ ����.
    --              �����϶��� ���������� �״�� / ����϶��� ���������� + 1
            select ceil(-75.41), ceil(75.31), ceil(-6.41), ceil(6.31)
            from dual;
            
    --      3) ���� : floor(����), �ڸ��� ������ ���� �Ҽ��� ����
    --              ����� ���� ������ ����.
    --              �����϶� ���������� - 1 / ����϶��� ���������� �״��
            select floor(-75.41), floor(75.31), floor(-6.41), floor(6.31)
            from dual;
        
    --      4) ��¥ ���� : trunc(����), �ڸ��� ������ �ִ�. trunc(����, �ڸ���)
    --                      �Ҽ��� �ڸ����� �߶����
            select trunc(-75.41), trunc(75.31), trunc(-6.41), trunc(6.31)
            from dual;
            select trunc(-75.41, 1), trunc(75.31, 1), trunc(-6.41, 1), trunc(6.31, 1)
            from dual;
            select trunc(-75.41, -1), trunc(75.31, -1), trunc(-76.41, -1), trunc(76.31, -1)
            from dual;
       
    --      5) �ݿø� : round(����), round(����, �ڸ���)     
            select round(-13.444), round(13.444), round(-13.544), round(13.544)
            from dual;
            select round(-13.444, 1), round(13.444, 1), round(-13.544, 1), round(13.544, 1)
            from dual;
            select round(-144.4, -1), round(144.4, -1), round(-145.4, -1), round(145.4, -1)
            from dual;
            
    --      6) power(����, ����) : n�� ������   /   root(����, ����) : n�� ������
            select power(2, 3), power(3, 2)
            from dual;
            
    --      7) sign(����) : �����̸� -1, ����̸� 1
            select sign(-24), sign(27), sign(-2.175), sign(3.1455)
            from dual;
            
    --      8) mod(a, b) : a�� b�� ���� ������
            select mod(27, 2), mod(27, 3), mod(27, 4), mod(27, 5)
            from dual;
            
    --  ���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ� 
        select custid, round(avg(saleprice), -2) cust_avg   -- **��Ī�� ����Ͽ� VO �� �÷����� ��������Ѵ�.
        from orders
        group by custid;
            
    -----------------------------------------------------------------------------
    
    --  2. ���� ���� ���� �Լ�
    
    --      1) chr(�ƽ�Ű�ڵ����) : �ƽ�Ű�ڵ� ���ڸ� �޾Ƽ� ���ڷ� ǥ��
            select chr(65), chr(97), chr(48)
            from dual;
            
    --      2) concat('���ڿ�', '���ڿ�') : �� ���ڿ� ����
            select concat('ict', '���߿�')
            from dual;
            
    --      3) initcap('���ڿ�') : ù���ڸ� �빮�ڷ�, �������� �ҹ��ڷ�      
    --      4) lower('���ڿ�') : ��� ���ڸ� �ҹ��ڷ� 
    --      5) upper('���ڿ�') : ��� ���ڸ� �빮�ڷ�
    --          **���ǻ���) ���ڳ� �ѱ��� �����Ѵ�.
            select initcap('KoReA'), lower('KoReA'), upper('KoReA'), 
                    initcap('���ѹα�123'), lower('���ѹα�123'), upper('���ѹα�123')
            from dual;
    
    --      6) trim('���ڿ�') : ���� ���� ����
    --      7) ltrim('���ڿ�') : ���� ���� ����
    --      8) rtrim('���ڿ�') : ������ ���� ����
    --      9) length('���ڿ�') : ���ڿ��� ����(���� ����)
            select trim('  oracle xe 18  '), ltrim('  oracle xe 18  '), 
                    rtrim('  oracle xe 18  '), length('  oracle xe 18  ')
            from dual;
            select length(trim('  oracle xe 18  ')), length(ltrim('  oracle xe 18  ')), 
                    length(rtrim('  oracle xe 18  ')), length('  oracle xe 18  ')
            from dual;
            
    --      10) lpad('���ڿ�', �ڸ���, '���ʰ��� �޿� ���ڿ�') 
    --      11) rpad('���ڿ�', �ڸ���, '�����ʰ��� �޿� ���ڿ�')
    --          ** ���ǻ���) �ڸ��� ������ ä���, ���ڸ��� �߸���.
            select lpad('oracle xe 18', 30, '!@#'), rpad('oracle xe 18', 30, '!@#')
            from dual;
            select lpad('oracle xe 18', 13, '!@#'), rpad('oracle xe 18', 13, '!@#')
            from dual;
            select lpad('oracle xe 18', 5, '!@#'), rpad('oracle xe 18', 5, '!@#')
            from dual;
            
    --      12) substr('���ڿ�', ������ġ, ����) : ������ġ���� ������ŭ ( �ڹٿ� �ٸ��� )
    --                     **���ǻ���) ���ʿ��� 1 ���� ����, - �� ������ ���
            select substr('abcdefgh', 2, 4), 
                   substr('abcdefgh', -5, 4), 
                   substr('abcdefgh', -2, 4)    --  ������ ���ڶ�� �ִ°� ������
            from dual;
    
    --      13) replace('���ڿ�', '������ ���ڿ�', '���� ���ڿ�') : ���� ġȯ
            select replace('ict ���� �α� ���簳�߿�', '����', '����')
            from dual;
    
    --      14) ASCII('�ƽ�Ű����') : ���ڸ� �ƽ�Ű�ڵ� ���ڷ� ��Ÿ�� (chr �� �ݴ밳��)
            select ascii('A'), ascii('a'), ascii('0')
            from dual;
    
    --      15) instr('���ڿ�', 'ã�� ���ڿ�') : ���ڿ� �ȿ��� ã�� ������ ��ġǥ�� (ó�� �ϳ���)
    --          instr('���ڿ�', 'ã�� ���ڿ�', ������ġ)    ���ʿ��� 1���� ���� 
            select instr('770707-1077999', '0')     
            from dual;                              --  ù��° 0
            select instr('770707-1077999', '0', 4)
            from dual;                              --  �ι�° 0
            select instr('770707-1077999', '0', (select instr('770707-1077999', '0') from dual) + 1 )
            from dual;  --  �ڹٽ�
    --     **instr('���ڿ�', 'ã�� ���ڿ�', 1, n) : ã�� ������ n ��° ��ġ ǥ��
            select instr('770707-1077999', '0', 1, 1) ù��° from dual;
            select instr('770707-1077999', '0', 1, 2) �ι�° from dual;
            select instr('770707-1077999', '0', 1, 3) ����° from dual;
            
    --  �������� �߱��� ���Ե� ������ �󱸷� ������ �� ��������� ������� ( ġȯ replace ��� )
    --  ** select �� ���� DB �� ������ �ʴ´�
        select bookid, bookname, publisher, price, replace(bookname, '�߱�', '��')
        from book;
    
    --  �½��������� ������ ������ ����� ������ ���ڼ��� Ȯ���Ͻÿ�.
        select bookname, length(bookname)
        from book
        where publisher like '�½�����';
        
    --  �� �߿��� ���� ���� ���� ����� ����̳� �Ǵ��� ���� �ο����� ���Ͻÿ�
        select substr(name, 1, 1), count(*)
        from customer
        group by substr(name, 1, 1);
        
    -----------------------------------------------------------------------------
    
    --  3. ��¥/�ð� ���� ���� �Լ�
    
    --      1) sysdate : �ý��� ���� ���� ��¥/�ð� ��ȯ�ϴ� ���ھ��� �Լ�
            select sysdate, sysdate + 10
            from dual;
            --  ��¥�� ������
            select substr(sysdate, 0, 10), substr(sysdate + 10, 0, 10)
            from dual;
            
    --      2) to_date('���ڿ�') : ���ڿ� �����͸� ��¥�� �����ͷ� ����
            select trunc(sysdate) - to_date('2024-02-01')
            from dual;
            select to_date('2024-12-31') - trunc(sysdate)
            from dual;
            
    --      3) to_char('��¥', '��¥��') : ��¥�� �����͸� ���ڿ� �����ͷ� ����
            select to_char(sysdate, 'yyyy-mm-dd')
            from dual;
            select to_char(to_date('2024-02-07'), 'yymmdd')
            from dual;
        
    --      4) add_months(date, ����) : ��¥���� ��¥���� ������ �� ��ŭ ���� 
    --                                  ( 1 : ������, -1 : ������ )
            select sysdate, add_months(sysdate, 4), add_months(sysdate, -4)
            from dual;
            
    --      5) last_day(date) : �ش� ���� ������ ��¥ 
            select sysdate, last_day(sysdate)
            from dual;
            
    --      6) next_day(date, ����) : �ش� ������ ���� ����� ��¥(�̷�) **����, ���� X
            select sysdate, next_day(sysdate, 'ȭ����'), next_day(sysdate, '������'),
                            next_day(sysdate, '�����'), next_day(sysdate, '�ݿ���')
            from dual;
            
    --      7) months_between(����¥, ���۳�¥) : �� ���� �Ⱓ ���ϱ�
            select months_between(sysdate, '2023-07-07')
            from dual;
            
    --  �ֹ����ڷ� ���� 10�� �Ŀ� �ֹ��� Ȯ���ȴ�.
        select orderid, substr(orderdate, 0, 10) �ֹ���, substr(orderdate + 10, 0, 10) Ȯ��
        from orders;
        
-----------------------------------------------------------------------------------

    --  null �� ó��
    --      : ���� �������� ���� ��
    --        '0', ''(����), ' '(����) ����� �ٸ���.
    --        **�񱳿����ڷ� �񱳰� �Ұ����ϴ�.
    --        ������ �����ϸ� ��� ���� null ������ ��ȯ�ȴ�.
    
    --      1. is null : ���ǽĿ��� null �� ã���� ���
    --      2. is not null : ���ǽĿ��� null �� �ƴ� ���� ã���� ���
    --      3. nvl(�÷���, null ��� �������� ��) 
    
    --  �����̺��� phone �� ���� ���� ������ ����Ͻÿ�
        select * from customer3 where phone = null;      -- null �� �� ã��
        select * from customer3 where phone is null;     -- null �� ã��
        select * from customer3 where phone is not null; -- null �� �ƴ� ���� ã��
        -- null ��� '����' �� ������
        select name, phone, nvl(phone, '����') from customer3; 
    
    --  rownum : ����Ŭ ���ο��� �����Ǵ� ���� �÷�, SQL ��ȸ ����� ������ ��Ÿ����.
        select rownum, c.*
        from (select * from customer order by custid desc) c;
        --  ** ����¡ ����� ����Ҷ� �ʿ��ϴ�.
        select * 
        from (select rownum r_num, a.*  -- rownum �� ��Ī r_num ����
              from (select * from bbs_t order by b_idx desc) a ) -- select ���� ��Ī a ���̺�����  
        where r_num between #{begin} and #{end};
        --  ������������ ������ �����͸� rownum �� �̿��Ͽ� ������ ���̱��� ó�������� ���������� �����´�.
        --  1000���� �����͸� 1�������� 1���� 10����, 2�������� 11���� 20���� ...
    
----------------------------------------------------------------------------------- 
    
    --  ��(view) : ���� ���̺�, ���� �޸𸮿� �������� �ʴ´�.
    --              ��, ���������� ����Ǿ� �ִ� ���̺��� �ƴϴ�.
                  
    --          �Ϲ����� ����ڴ� �並 ���� �� ����.
    --          ��� insert, update, delete �� ������ �ƴ϶� select �� �����̴�.
    --          ��, ���� ������ �˻��̴�.
    --          ���� ���̺��� �ϳ��� ���ļ� �ϳ��� ��� ������� �ְ�,
    --          �ϳ��� ���̺��� �̿��ؼ� �������� �並 ������� �ִ�.
    
    --  �� ���� 
    --      1) ���� �̸��� �䰡 �����ϸ� ���� �߻�
    --      create view ���̸�
    --      as select �� ;
    
    --      2) ���� �̸��� �䰡 �����ϸ� �ش� �並 �����ϰ� ���� �����.(����õ)
    --      ** ��� �ǵ��� �������� ����, �׳� �����ϰ� �ٽ� ������.
    --      create or replace view ���̸�
    --      as select �� ;
    
    --  �� ���� 
    --  drop view ���̸� ;
    
    
    --  1. �ּҿ� ���ѹα��� �����ϴ� ����� ������ �並 ����� ��ȸ�Ͻÿ�
    --      1) select ���� ���� �����
            select * from customer3 where address like '%���ѹα�%';
    --      2) �並 ������    
            create view v_test01
            as select * from customer3 where address like '%���ѹα�%';
    --      3) ȣ��
            select * from v_test01;
        
    --  2. �ֹ� ���̺��� ����ȣ�� ���̸�����, ������ȣ�� ���������� �����ؼ� 
    --      v_order �並 ������
    --      1) select ���� ���� ������
            select o.orderid, c.name, b.bookname, o.saleprice, substr(o.orderdate, 0, 10)
            from customer3 c, orders3 o, book3 b
            where c.custid = o.custid and o.bookid = b.bookid
            order by o.orderid;
    --      2) �並 ������
            create view v_order
            as select o.orderid orderid, c.name name, b.bookname bookname, 
                      o.saleprice saleprice, substr(o.orderdate, 0, 10) orderdate
            from customer3 c, orders3 o, book3 b
            where c.custid = o.custid and o.bookid = b.bookid
            order by o.orderid;
    --      3) �並 �̿��ؼ� �迬�� ���� �ֹ������� ����Ͻÿ�
            select *
            from v_order
            where name like '�迬��';
            
    --  ��������
    --  (1) �ǸŰ����� 20,000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� 
    --      �����ִ� highorders �並 �����Ͻÿ�.
            select b.bookid, b.bookname, c.name, b.publisher, o.saleprice
            from customer3 c, orders3 o, book3 b
            where c.custid = o.custid and o.bookid = b.bookid and o.saleprice >= 20000;
            
            create view highorders as 
            select b.bookid, b.bookname, c.name, b.publisher, o.saleprice
            from customer3 c, orders3 o, book3 b
            where c.custid = o.custid and o.bookid = b.bookid and o.saleprice >= 20000;
            
    --  (2) ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� 
    --      ����ϴ� SQL ���� �ۼ��Ͻÿ�.
            select bookname, name
            from highorders;
    
    --  (3) highorders �並 �����ϰ��� �Ѵ�. 
    --      �ǸŰ��� �Ӽ��� �����ϴ� ����� �����Ͻÿ�. 
    --      ���� �� (2)�� SQL ���� �ٽ� �����Ͻÿ�.
    --      ** ���� ����õ!!
    --      �� ���� => �� ���� �� �ٽ� �� ���� 
            drop view highorders;
            
            create view highorders as 
            select b.bookid, b.bookname, c.name, b.publisher
            from customer3 c, orders3 o, book3 b
            where c.custid = o.custid and o.bookid = b.bookid and o.saleprice >= 20000;
            
    --  ** ���� ���̺� �����͸� ����(����)�ϸ� ���� �����͵� �ڵ����� ����(����)�ȴ�.
    --  �ֹ� ���̺��� �迬��(custid=2)�� ������ �������� 10000���� ������    
        select * from orders3;
        --  ���� ���̺� �����ϸ�
        update orders3 set saleprice = saleprice + 10000 where custid = 2;
        --  ��� ������ �����ͼ� ����Ƿ�, �ڵ� ���� �� 
        select * from v_order where name like '%�迬��%';
        
--------------------------------------------------------------------------------       
        
    --  �ε��� : �˻��Ҷ� ���� ã�� ���ؼ� �ε����� �ο��Ѵ�.
    --          ��, �˻��� ���� ������ �ϱ� ���� ���
        
--------------------------------------------------------------------------------

    --  ������ : ����Ŭ���� �ڵ����� **���� ���ڰ��� �������ָ�, �ַ� �⺻Ű�� �̿�ȴ�.
    
    --  ������ ����    
    --      create sequence �������̸� (���� ���̺��̸�_seq �̶�� �����.)
    --      increment by ������
    --      start with ���۰�
    --      nocycle (�ٽ� �������� �ʴ´�. �ַ� �⺻Ű�� ���Ǳ� ������)
    
        create sequence customer3_seq
        increment by 1
        start with 9 -- ������ 1 �ε� �⺻�����Ͱ� 8 ���� �־ 9 ���� ����
        nocycle;
        
    --  ������ ���
    --      ���� pk �� �����϶�, �� �ڸ��� �������̸�.nextval => ���ڰ� �ڵ����� �ο���
    
        insert into customer3(custid, name, address, phone)
         values(customer3_seq.nextval, '���θ�', '���ѹα� ����', '000-7979-9797');
        insert into customer3(custid, name, address, phone)
         values(customer3_seq.nextval, '���θ�', '���ѹα� ����', '000-7979-9797');
        
        select * from customer3;

    --  ��������
    --  ���� ���̺� ����� �������� ���� �����͸� �־��
        select * from book3;
        
        create sequence book3_seq
        increment by 1
        start with 11
        nocycle;
        
        insert into book3(bookid, bookname, publisher, price)
         values(book3_seq.nextval, '�ƽþ��� Ż��', 'Ŭ������', 1000);
        
---------------------------------------------------------------------------------
