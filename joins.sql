-- show databases;
-- use test;
-- show tables;

-- -- CREATING TABLES 
-- create table account (
-- 	account_no int primary key,
--     branch_name varchar(255),
--     balance int
-- );
-- create table customer(
--  	customer_id int primary key,
--     customer_name varchar(255),
-- 	city varchar(255),
-- 	mobile_no varchar(10)
-- );
-- create table depositor( 
-- 		account_no int,
-- 		foreign key (account_no) references account(account_no),
--     customer_id int,
--     foreign key (customer_id) references customer(customer_id)
-- );

-- QUERIES
INSERT INTO account (account_no, branch_name, balance)
VALUES 
  (1001, 'Branch A', 5000),
  (1002, 'Branch B', 8000),
  (1003, 'Branch A', 3000),
  (1004, 'Branch C', 10000),
  (1005, 'Branch B', 7000);
INSERT INTO customer (customer_id, customer_name, city, mobile_no)
VALUES 
  (2001, 'John Doe', 'New York', '1234567890'),
  (2002, 'Jane Smith', 'Los Angeles', '9876543210'),
  (2003, 'Michael Johnson', 'Chicago', '5551234567'),
  (2004, 'Sara Brown', 'Houston', '6789876543'),
  (2005, 'David Lee', 'San Francisco', '8885557890');
INSERT INTO depositor (account_no, customer_id)
VALUES 
  (1001, 2001),
  (1002, 2002),
  (1003, 2003),
  (1004, 2004),
  (1005, 2005);
  
-- CARTESIAN PRODUCT
select * from account, depositor, customer;

-- JOIN USING WHERE CLAUSE
SELECT * FROM account, customer, depositor 
WHERE account.account_no = depositor.account_no AND depositor.customer_id = customer.customer_id;

-- NATURAL JOIN
SELECT * FROM account NATURAL JOIN depositor NATURAL JOIN customer;

-- JOIN USING ON CONDITION
SELECT * FROM account
JOIN depositor ON account.account_no = depositor.account_no 
JOIN customer ON depositor.customer_id = customer.customer_id;

-- INNER JOIN
select * from account
INNER JOIN depositor on account.account_no = depositor.account_no 
INNER JOIN customer on depositor.customer_id = customer.customer_id;

-- OUTER JOIN

-- GET customer_name, customer_id and balance
select customer.customer_name, customer.customer_id, account.balance, customer.city
from customer
join depositor on customer.customer_id = depositor.customer_id
join account on depositor.account_no = account.account_no
where customer.city = 'New York';  

