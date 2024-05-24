    --  ����(join) : �������� ���̺��� ����Ͽ� SQL �� �ۼ��ϴ� ��
    --              �������� ���̺��� ��� �ϳ��� ����� ������ ���� ���
    
    --      1. ���� ���� (inner join) : �ܷ�Ű fk �� �̿��ϴ� ���
    
    --              ����) select A���̺�.�÷���1 , A���̺�.�÷���2 , B���̺�.�÷���1 , B���̺�.�÷���2 
    --                   from A���̺� , B���̺�
    --                   where A���̺�.�÷��� = B���̺�.�÷���
    
    --              ** �� ���̺��� ��� ���� �÷��� ������ �ְ� �ش� �÷����� ���ǽ��� ���
    --              ** ������ ���̺��̸��� ��Ī�� ���
    
    
    --  ���� ���� �ֹ��� ���� �����͸� ��� ������
    --  �� �������� �ֹ��� ���� ������
        select *
        from customer , orders
        where customer.custid = orders.custid;
    --  �ֹ� �������� ���� ���� ������
        select *
        from orders, customer
        where customer.custid = orders.custid;
    
    --  ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻�
        select c.name, o.saleprice
        from orders o , customer c
        where c.custid = o.custid;        
    --  ** ��Ī ���� select , where �� ��� ��Ī ����ؾߵȴ�.
    
    --  ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ ����
        select c.name , count(*), sum(o.saleprice)
        from customer c , orders o
        where c.custid = o.custid
        group by c.name
        order by c.name;
    
    --  ���� �̸��� ���� �ֹ��� ������ �̸��� ���϶�
        select c.name , o.saleprice, b.bookname
        from customer c , book b , orders o
        where c.custid = o.custid and b.bookid = o.bookid ;
    
    --  ������ 20000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���϶�
        select c.name , b.bookname
        from customer c , book b , orders o
        where c.custid = o.custid and b.bookid = o.bookid and o.saleprice = 20000;
        
    -------------------------------------------------------------------------------------    
        
    --      2. �ܺ� ����(outer join) : ������ ���̺� �����Ͱ� ��� ���� ���̺��� �����ʹ� ��� ���
    --                                **�����Ͱ� ������ null ǥ��
    
    --          1) **left join : �������̺� ���� , �������̺� ���߿� 
    
    --              ����) select
    --                   from �������̺�
    --                   left [outer] join �������̺�
    --                   on �������̺�.�÷��� = �������̺�.�÷���
    --                   where ���ǽ�
    
    --          2) right join : �������̺� ���� , �������̺� ���߿�
    
    --              ����) select
    --                   from �������̺�
    --                   right [outer] join �������̺�
    --                   on �������̺�.�÷��� = �������̺�.�÷���
    --                   where ���ǽ�

    --           ** left ��õ / right ����õ
    
    --  ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���϶�
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
        
        insert into BBB values(1,'��');
        insert into BBB values(2,'��');
        insert into BBB values(4,'��');
        insert into BBB values(5,'��');
        
        commit;
        
        --  �� ���� �;�
        
        --  aaa �����̱� ������ id �� 4 , 5 �� �����Ͱ� ����.
        --  ���� left join 
        select *
        from aaa a
        left join bbb b
        on a.id = b.id;
        
        --  bbb �����̱� ������ id �� 3 �� �����Ͱ� ����.
        --  ���� left join 
        select *
        from bbb b
        left join aaa a
        on a.id = b.id;
        
        --  ���� ������� �� ���� ( �����÷��� �ƴϸ� null ä������. )
        --  ** full join
        select *
        from aaa a
        full join bbb b
        on a.id = b.id;
        
        --  �����÷� �����ϰ� �ٺ��� ( ��, null �� ������ ���� )
        --  ** is null
        select *
        from aaa a
        full join bbb b
        on a.id = b.id
        where a.id is null or b.id is null;
        
------------------------------------------------------------------------------------

    --  �μ����� (��������) : �ϳ��� SQL �� �ȿ� ���ԵǾ� �ִ� �� �ٸ� SQL ���� ���Ѵ�.
    --                      ��, �������� �ȿ� �ִ� ������ ���Ѵ�.
    
    --      1) ������ ������ : ����� �� �� => �񱳿�����( = , != , <> , >= , <= ) ���
    
    --      2) ������ ������ : ����� ������ => in , any , all , exists ���
    
    
    --  book ���̺��� ���� ��� ������ �̸��� �˻�
    --      1. ���� ���� ��� �ݾ��� ã��
            select max(price)
            from book;
    --      2. ��� �ݾ��� ���� å�̸��� ã��
            select bookname
            from book
            where price = 35000;
    --      3. ��� -> ������ ������ ���
            select bookname
            from book
            where price = (select max(price) from book);
    --      ������ �����ڴ� ���� �񱳿����� ���
    
    --  ������ ������ ���� �ִ� ���� �̸��� �˻�
    --      ��������
    --      1. ���Ÿ� �� ���� ã��(�ߺ�����)
            select distinct custid
            from orders;
    --      2. �� �̸��� ã��
            select name 
            from customer 
            where custid in (1,2,3,4);
    --      3. ����� �������̸� ������ ������
            select name
            from customer
            where custid in (select distinct custid from orders);
            
    --      �ٸ���� (join)
            select distinct c.name
            from customer c, orders o
            where c.custid = o.custid;

    --  ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�
    --      1. ���ǻ簡 ���ѹ̵���� ������ ã��
            select bookid
            from book
            where publisher = '���ѹ̵��';
    --      2. ���� ��ȣ�� ������ �� ��ȣ�� ã��
            select custid
            from orders
            where bookid in (3,4);
    --      3. �� ��ȣ�� �� �̸� ã��
            select name
            from customer
            where custid = 1;
    --      4. ��� 
            select name
            from customer
            where custid = (select custid 
                            from orders 
                            where bookid in (select bookid 
                                             from book 
                                             where publisher = '���ѹ̵��'));
          
            -- �������� �ϴ� ���
            select distinct c.name
            from customer c, orders o, book b
            where c.custid = o.custid and o.bookid = b.bookid and b.publisher = '�̻�̵��';
    
                 
    --  _���� ������ å�� ������ ���
    --      1. _���� ������ å�� ã��
            select bookid
            from book
            where bookname like '_��%';
    --      2. ���� ��ȣ�� ������ �� ��ȣ�� ã��
            select distinct custid
            from orders
            where bookid in (1,2,3,7,8);
    --      3. �� ��ȣ�� ������ �̸��� ã��
            select name
            from customer
            where custid in (1,3,4);
    --      4. ���
            select name
            from customer
            where custid in (select distinct custid 
                             from orders
                             where bookid in (select bookid 
                                              from book 
                                              where bookname like '_��%'));
            
            -- �����̿�
            select distinct c.name
            from customer c, orders o, book b
            where c.custid = o.custid and o.bookid = b.bookid and b.bookname like '_��%';
    
    
    --  ��� ���� ���ݺ��� ��� �����̸��� ���϶�
    --      1. ��� ���� ������ ������
            select avg(price)
            from book; 
    --      2. ��� ���� ���� ū ������ ã��
            select bookname
            from book
            where price > 14450;
    --      3. ���
            select bookname
            from book
            where price > (select avg(price) from book);
    --      ** �����Լ��� select �������� ��� �����ϴ�.
    
    -------------------------------------------------------------------------------
    
    --  ������ union / ������ minus / ������ intersect
    --      ���ǻ���) ����Ŭ�� �������� minus �� ������, SQL ǥ�ؿ����� except �� ���
    
    --  ������ �ֹ����� ���� ���� �̸��� ������
    --  ��, ��ü �� - �ֹ��� �� = �ֹ����� ���� ��
    --  1. ��ü ��    
        select name, custid 
        from customer;
    --  2. �ֹ��� ����ȣ
        select distinct custid
        from orders;
    --  3. �ֹ� �� ��ȣ�� �� �̸� ���ϱ�
        select name
        from customer
        where custid in (select distinct custid from orders);
    --  4. ��� (��ü �� �̸� - �ֹ��� �� �̸�)
        select name
        from customer 
        minus 
        select name
        from customer
        where custid in (select distinct custid from orders); 

------------------------------------------------------------------------------------

    (5) �������� ������ ������ ���ǻ� ��
        --  ����
        select count(distinct b.publisher)  --  **���ǻ簡 �ߺ��� ���� �����Ƿ� distinct �ߺ�����
        from customer c , orders o , book b
        where c.custid = o.custid and o.bookid = b.bookid and c.name = '������';
    
    (6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
        --  ����
        select b.bookname ������ , b.price ���� , o.saleprice �ǸŰ��� , ( b.price - o.saleprice ) as ���ι����ݾ�
        from customer c , orders o , book b
        where c.custid = o.custid and o.bookid = b.bookid and c.name = '������';
    
    (7) �������� �������� ���� ������ �̸�
        select bookname
        from book
        minus
        select b.bookname
        from customer c , orders o , book b
        where c.custid = o.custid and o.bookid = b.bookid and c.name = '������';
        
        -- �ٸ����
        select bookname
        from book
        where bookname not in (select b.bookname
                               from customer c , orders o , book b
                               where c.custid = o.custid and o.bookid = b.bookid and c.name = '������');
  
    (8) �ֹ����� ���� ���� �̸�(�μ����� ���)
        select name
        from customer
        where custid not in ( select custid from orders );
        
        select name
        from customer
        where name not in ( select name from customer c, orders o where c.custid = o.custid )
    
    (9) �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
        select sum(saleprice), avg(saleprice)
        from orders;
    
    (10) ���� �̸��� ���� ���ž� 
        select c.name , sum(o.saleprice)
        from customer c , orders o
        where c.custid = o.custid 
        group by c.name;
        
    (11) ���� �̸��� ���� ������ ���� ���
        select c.name , b.bookname
        from customer c , orders o , book b
        where c.custid = o.custid and b.bookid = o.bookid;
    
    (12) ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
        --  1. ���̰� ���� ���� �� ã��
        select max(b.price - o.saleprice)
        from book b , orders o
        where b.bookid = o.bookid;
        --  2. �� �ֹ� ��ü ���� �̾Ƴ���
        select b.bookname , b.publisher, b.price , o.saleprice
        from book b , orders o
        where b.bookid = o.bookid and (b.price - o.saleprice) = (select max(b.price - o.saleprice)
                                                                 from book b , orders o 
                                                                 where b.bookid = o.bookid);
        
  (13) ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
        select c.name    
        from orders o , customer c
        where c.custid = o.custid
        group by c.name
        having avg(o.saleprice) > (select avg(saleprice) from orders);
    
----------------------------------------------------------------------------------

    --  ���� p199 [���� �����ͺ��̽�]
    
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
    values (1,'�Ե�','���');
    insert into cinema (cid, cname, cloca)
    values (2,'�ް�','����');
    insert into cinema (cid, cname, cloca)
    values (3,'����','���');
    
    insert into person (pid, pname, address)
    values (3,'ȫ�浿','����');
    insert into person (pid, pname, address)
    values (4,'��ö��','���');
    insert into person (pid, pname, address)
    values (9,'�ڿ���','����');
    
    insert into room (cid, rid, rname, price, seats)
    values (1, 1, '����� ��ȭ', 15000, 48);
    insert into room (cid, rid, rname, price, seats)
    values (3, 3, '���� ��ȭ', 7500, 120);    
    insert into room (cid, rid, rname, price, seats)
    values (3, 2, '��մ� ��ȭ', 8000, 110);   

    insert into booking (cid, rid, pid, bid, seatnum, bdate)
    values (3, 2, 3, 1, 15, '2020-09-01');
    insert into booking (cid, rid, pid, bid, seatnum, bdate)
    values (3, 1, 4, 2, 16, '2020-09-01');
    insert into booking (cid, rid, pid, bid, seatnum, bdate)
    values (1, 1, 9, 3, 48, '2020-09-01');
    
    --  ���� ���� 
    --  **check : price <= 20000
    --  **check : rid between 1 and 10 
    --  unique : seatnum  
    
        --  ��� ������ �̸��� ��ġ�� ���̽ÿ�
        select cname, cloca
        from cinema;
        
        --  ��ǿ� �ִ� ������ ���̽ÿ�
        select cname
        from cinema
        where cloca = '���';
        
        --  ��ǿ� ��� ���� �̸��� ��������
        select pname
        from person
        where address = '���'
        order by pname;
    
        --  ������ 8000�� ������ ��ȭ�� �����ȣ , �󿵰���ȣ , ��ȭ������ ���̽ÿ�
        select cid, rid, rname
        from room
        where price <= 8000;
        
        --  ������ġ�� ���� �ּҰ� ���� ���� ������
        select p.pname
        from cinema c, person p , booking b
        where c.cid = b.cid and p.pid = b.pid and c.cloca = p.address;
        
        --  ������ ���� �
        select count(*)
        from cinema;
        
        --  �󿵵Ǵ� ��ȭ�� ��հ����� ��
        select avg(price)
        from room;
    
        --  2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ��
        select count(*)
        from booking
        where bdate = '2020-09-01';
        
        --  ���� ���忡�� �󿵵� ��ȭ������ ���̽ÿ�
        select r.rname
        from cinema c, room r
        where c.cid = r.cid and c.cname = '����';
        
        --  ���� ���忡�� ��ȭ�� �� ���� �̸�
        select p.pname
        from cinema c, booking b, person p
        where c.cid = b.cid and b.pid = p.pid and c.cname = '����';
        
        --  ���� ������ ��ü ����
        select sum(r.price * r.seats)
        from cinema c, room r
        where c.cname = '����';
         
        --  ���庰 �󿵰� ��
        select c.cname, count(*)
        from cinema c, room r
        where c.cid = r.cid
        group by c.cname;
        
        --  ��ǿ� �ִ� ������ �󿵰�
        select r.rid , r.rname
        from cinema c, room r
        where c.cid = r.cid and c.cloca = '���';
        
        --  2020�� 9�� 1���� ���庰 ��� ���� ����
        select avg(r.seats)
        from room r, booking b
        where r.rid = b.rid and b.bdate = '2020-09-01';
        
        --  2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ
        select max(seats)
        from room ;
        
        select max(r.seats)
        from room r, booking b
        where r.rid = b.rid and b.bdate = '2020-09-01'; 
        
        --  �� ���̺� �����͸� �����ϴ� insert �� �ϳ��� ����
        insert into cinema (cid, cname, cloca)
        values(4,'CGV','����');
        
        insert into person (pid, pname, address)
        values(1, '�Ѹ�', '����');
        
        insert into room (cid, rid, rname, price, seats)
        values(4, 4, '������ ��ȭ', 10000, 80);
        
        insert into booking (cid, rid, pid, bid, seatnum, bdate)
        values(4, 4, 1, 33, 4, '2020-09-09');
        
        --  ��ȭ�� ������ 10%�� �λ�
        select price * 1.1 as �λ󰡰�
        from room; 
    
--------------------------------------------------------------------------------    
       
        
        
        
        
        