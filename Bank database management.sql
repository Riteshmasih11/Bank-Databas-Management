use bank;
show tables;
#1.	List of customers that have accounts in two or more branches of the bank at the same time.
select * from account;
select * from branch;
select * from customer;
SELECT c.first_name, c.last_name 
	FROM customer c
	WHERE c.id IN (SELECT customer_id
		FROM account
        GROUP BY customer_id
        HAVING COUNT(*) >= 2);
 # 2. 	Statement showing who takes loans more often – men or women.
 select * from loan;
 select * from loan_type;
 select * from user_role_information;
 SELECT gender, COUNT(*) AS count 
FROM Customer AS c
WHERE c.id IN (
	SELECT customer_id 
    FROM Account AS a
    WHERE a.id IN (
		SELECT account_id
		FROM Loan AS l))
GROUP BY gender 
ORDER BY count DESC;
# 4. 	List of customers that have never had a loan
select concat(first_name," ",last_name) from customer c where c.id in
 (select customer_id from account a where a.id 
 not in (select account_id
from loan as l));
# Custom: Find customers who have no open accounts.
select concat(first_name," ",last_name) from customer c where c.id not in (select customer_id from account  );

 

