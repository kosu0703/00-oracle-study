    --  1.
    --  select �� : �˻� => ����� ���̺�� ���´�.(**select �� ���̺��� �ȹٲ��.)
    --  **insert, update, delete �� ����� �����̴�.
 

    --      ����) select [ * �� distinct ] �Ӽ��̸�(��)
    --           from ���̺��̸�(��)
    --           [where ���ǽ�]
    --           [group by �Ӽ��̸�]
    --           [having ���ǽ�]
    --           [order by �Ӽ��̸� [ASC = ����]�� DESC ]
    --           ** ASC = ���� = �������� / DESC = ��������

    --  ��� ������ �̸��� ������ �˻��Ͻÿ� 
    select bookname, price
    from book;

    --  ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻��Ͻÿ�
    select bookid, bookname, publisher, price 
    from book;
    
    --  ���̺��� ���� ��� �Ӽ��� ǥ���Ҷ��� * �� �������
    select * from book;

    --  ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�
    select publisher
    from book;

    --  �˻�������� �ߺ��� �����ϰ� ������ distinct Ű���带 ��� 
    --  select distinct �÷��� from ���̺��̸� ;
    select distinct publisher from book;
    
    --  ���ǻ��� : �ٸ� �÷��� �Բ� ����ϸ� �ȵȴ�.(�ٸ� �÷������� �ߺ����Ű� Ǯ����.)
    --  **distinct �� �÷� �Ѱ��� ��� ����
    select distinct publisher, bookname from book;
    
    --  **�÷� ��Ī ��� : select �÷��� as ��Ī �� select �÷��� ��Ī      
    --  ���� �Ӽ����� ������� �ʴ´�. ������� ����Ǽ� ��������.  

    --  **���̺� ��Ī ��� : from ���̺�� ��Ī (as ����ϸ� �����߻�)
    --  ���� ���̺���� ������� �ʴ´�.

    select bookname as ������, price ����
    from book;
    
    --  book ���̺��� å�̸��� ����, customer ���̺��� ����� �ּҸ� �˻��ϴ� �ڵ��� ����
    --  **select ~ from �ϸ� from ���� select ���߿�
    select bookname, price, name, address
    from book, customer;
    
    --  **���̺��� 2���϶� �˻�(�⺻)
    --  select ���̺�1.�÷���, ���̺�2.�÷���
    --  from ���̺�1, ���̺�2
    select book.bookname, book.price, customer.name, customer.address
    from book, customer;
    
    --  �� �ڵ带 ��Ī����ϱ�
    select b.bookname ������, b.price as ����, c.name ����, c.address as �ּ�
    from book b, customer c;
    
    --  ���� �ڼ��� ��굵 �����ϴ�
    --  book ���̺��� ������ 10% ���� ������ ������
    select bookid, bookname, publisher, price, price * 0.9 as ���ΰ���
    from book;
    --  ���� ���̺��� ������ �ʴ´�. ������� ���ΰ����� ��������.
    
    --  orders ���̺� orderdate �� 10�� �߰��� ��¥
    select bookid, custid, saleprice, orderdate, orderdate+10 �ݳ��� 
    from orders;
    
    ----------------------------------------------------------------------------
    
    --  2.
    --  where ������ 
    
    --      ����) where �÷��� ������ ������;
    --          ** ������ �տ� �ݵ�� �÷����� ��������
        
    --      1) �񱳿���  
    --          = : ���� 
    --          <> , != : �ٸ���
    --          >= , > , <= , < : ��
    
    --  ������ 20000�� �̸��� ������ �˻� 
    select *
    from book
    where price < 20000;
    
    --  ������ 10000�� �̻� 20000�� ������ ������ �˻�
    --  ���1 ( and )
    select *
    from book
    where price >= 10000 and price <= 20000;
    --  ���2 ( between )
    select *
    from book
    where price between 10000 and 20000;
    
    --  ���ǻ簡 �½����� �Ǵ� ���ѹ̵���� ������ �˻�
    --  ���1 ( or ) ����õ
    select *
    from book
    where publisher = '�½�����' or publisher = '���ѹ̵��';
    --  **���2 ( in )
    select *
    from book
    where publisher in('�½�����', '���ѹ̵��');
    
    --  ���ǻ簡 �½����� �Ǵ� ���ѹ̵� �ƴ� ������ �˻�
    --  ���1 ( <> , != , and ) 
    select *
    from book
    where publisher <> '���ѹ̵��' and publisher != '�½�����';
    --  ���2 ( not in )
    select *
    from book
    where publisher not in('���ѹ̵��', '�½�����');
    
    ----------------------------------------------------------------------------
    
    --  
    --      2) ���� like
    --          % : �������� ���(��ġ�� �������) 
    --          _ : �� ���� ��� (��ġ�� �ʿ�, ���ڼ� �߿�)
    
    --      ** ���ϴ� �����͸� ��Ȯ�ϰ� ���� ���Ҷ� ����Ѵ�.
    
    --  �౸�� ���縦 �Ⱓ�� ���ǻ縦 �˻�
    --  ���1 ( = )
    select publisher
    from book
    where bookname = '�౸�� ����';
    --  ���2 ( like )
    select publisher
    from book
    where bookname like '�౸�� ����';
    
    --  �����̸��� �౸�� ���Ե� ���ǻ縦 �˻�
    --  ���ڼ��� ��������� %
    select bookname, publisher
    from book
    where bookname like '%�౸%'; -- �౸�� �����ϴ�
    
    select bookname, publisher
    from book
    where bookname like '�߱�%'; -- �߱��� �����ϴ�
    
    select bookname, publisher
    from book
    where bookname like '%����'; -- ���ڷ� ������
    
    --  �����̸��� ���� �ι�° ��ġ�� ����� ���ڿ��� ���� ������ �˻�
    --  ���ڼ�, ��ġ���� �߿��ϸ� _
    select bookname, publisher
    from book
    where bookname like '_��%';  -- **�ڿ� ���ڰ� ������ٴ� % ǥ�ø� �������
    
    --  �౸�� ���� ������ ������ 20000�� �̻��� ������ ��� ������ �˻�
    select *
    from book
    where bookname like '%�౸%' and price >= 20000;
    
    --  orderid 1,3,5,7,9 �� �ڷ��� ��¥ ���� (2020/08/15)
    update orders
    set orderdate = '2020/08/15'
    where orderid in(1,3,5,7,9);
    
    --  orders ���̺��� 7���� �ڷḸ �˻�
    select *
    from orders
    where orderdate like ('2020-07%');  -- **DB ��¥ ���� Ȯ���ϱ� 
                                        -- (���� - ȯ�漳�� - �����ͺ��̽� - NLS - ��¥����)
    
    --  orders ���̺��� orderdate �� 2020���� ��� ���� ����
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
    
    ��������
    
    1. ������ȣ�� 1�� ������ �̸�
    select bookname
    from book
    where bookid = 1;
    
    2. ������ 20000�� �̻��� ������ �̸�
    select bookname
    from book
    where price >= 20000;
    
    3. ������ �̸�, �ּ�
    select name, address
    from customer;
    
    4. 2020�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
    select orderid
    from orders
    where orderdate between '2020-07-04' and '2020-07-07';
    
    5. 2020�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ 
    select orderid
    from orders
    where orderdate not between '2020/07/04' and '2020/07/07';
    
    6. ���� ���衯 ���� ���� �̸��� �ּ�
    select name, address
    from customer
    where name like '��%';
  
    7. ���� ���衯 ���̰� �̸��� ���ơ��� ������ ���� �̸��� �ּ�
    select name, address
    from customer
    where name like '��%��';
    
    -----------------------------------------------------------------------------
    
    --  3. order by : ����
    --      ** �׻� �� ������ �ٿ� �־��־�� �Ѵ�.
    --     [order by �Ӽ��̸� [ASC]�� DESC ]
    --      ** ASC(����) �������� / DESC ��������
    
    --      ������ �������� ���
    --      [order by ����1, ����2, ����3 ... ]
    
    --  ������ �̸������� �˻� ( �������� : ���� > �ѱ� )
    select *
    from book
    order by bookname desc;
    
    --  ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻�
    select *
    from book
    order by price , bookname;
    
    --  ������ ������ �������� �˻� �� ������ ���ٸ� ���ǻ��� �������� �˻�
    select *
    from book
    order by price desc , publisher;
    
    -------------------------------------------------------------------------------
    
    --  group by ������ ����
    
    --  ���� �Լ� : sum(�÷���) / avg(�÷���) / max(�÷���) / min(�÷���) / count(�÷��� �Ǵ� *)
       
    --  ���� �ֹ��� ������ �� �Ǹž�
        select sum(saleprice) as ��_�Ǹž�
        from orders;
        
    --  2�� �迬�� ���� �ֹ��� ������ �� �Ǹž�
        select sum(saleprice) as �迬��_��_��_�Ǹž�
        from orders
        where custid = 2;
        
    --  ���� �ֹ��� ������ �� �Ǹž�, ��հ�, ������, �ְ�, �����ǸŰǼ��� ���϶�
        select sum(saleprice) ��_�Ǹž�, avg(saleprice) ��հ�, min(saleprice) ������, max(saleprice) �ְ�, count(*) �����ǸŰǼ�
        from orders;
    
    --  2�� �迬�� ���� �ֹ��� ���� �Ǹ� �Ǽ�
        select count(*) �迬��_��_�����ǸŰǼ�
        from orders
        where custid = 2;
    
    --  �������� �� ���ž�(�������� ����ȣ�� 1������ ���� �ۼ�)
        select sum(saleprice) as ��������_��_���ž�
        from orders
        where custid = 1;
    
    --  �������� ������ ������ ��
        select count(*) ��������_������_������_��
        from orders
        where custid = 1;
    
    --  ������ �� ����
        select count(*)
        from book;
        
  **--  ������ ����ϴ� ���ǻ��� �� ����
    --  ** �ߺ����Ű� ���� , �״��� count
        select count(distinct publisher) 
        from book;
        
    --  �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
        select sum(saleprice), avg(saleprice)
        from orders;
        
    ------------------------------------------------------------------------------
    
    --  5. group by : **�Ӽ��� ������ ���� ���� �� ���� �׷��� �����.
    --                ���� �Լ��� ����� �� �ִ�.
    
    --      select  group by ���� ����� �Ӽ�, �����Լ���
    --      from ���̺��̸�
    --      [where ���ǽ�]
    --      group by ���� �÷���
    --      [having ���ǽ�(select �� ����� �͸� ����)]
    
    --  ������ �ֹ��� ������ �� ������ �� �Ǹž�
    select custid, count(*), sum(saleprice)
    from orders
    group by custid;
    
    -- ���� �ֹ� ������ �� ������ ���Ͻÿ�. ��, �� �� �̻� ������ ����
    select custid, count(*)
    from orders
    group by custid
    having count(*) >= 3;

    -- ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. 
    -- ��, �� �� �̻� ������ ���� ���Ѵ�.
    select custid, count(*)
    from orders
    where saleprice >= 8000
    group by custid
    having count(*) >= 2
    order by custid;
    
    --  �������̺��� �л��� 10���̻� ������ ���Ƹ��� ���Ͽ� ���Ƹ��� ������ �� ���� ���� ����Ͻÿ�.
    select ���Ƹ�, count(����)
    from ����
    where �л� >= 10
    group by ���Ƹ�;
    
    --  ���ǻ��� �̸��� �ߺ����� ��� 
    select distinct publisher , count(*)
    from book  
    group by publisher

    
    
    
    
    
    
    
    