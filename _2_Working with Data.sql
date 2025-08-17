use bank;
--  Working with Data

-- 1. Update inactive accounts to Closed
update account set status = 'Closed' where status = 'inactive';
select * from account;

-- 2. Increase all balances by 5%.
update account set balance_account = balance_account * 1.05;

-- 3. Set deleted accounts’ balance to 0.
update account set balance_account = 0 where deleted_at is not null;

-- 4. Update NULL ages to random values between 18–65
update clients set age = floor( 18 + ( rand() * ( 65+ 18 - 1)));
select * from clients;

-- 5. Change manager 'Paul' to 'Paul Schmidt'
update branches set manager = 'Paul Schmidt' where manager = 'Paul';
select * from branches;

-- 6. Delete transactions with Amount_Transactions = 0
Delete from transaction where amount_transactions = 0;
select * from transaction;

-- 7. Delete clients with no contact number
delete from clients where `contact_no.` is null;
select * from clients;

-- 8. Delete accounts with balance < 100
delete from account where balance_account < 100;
select * from account;

-- 9. Show client full name as Customer_Name
select concat(first_name ,' ', last_name) as customer_name from clients;

-- 10. Show Account ID as Acc_No and Balance as Acc_Balance
select id as Acc_No , balance_account as Acc_Balance from account;

-- 11. Show branch info as Name - Location
select concat( name , ' - ' , location ) as Branch_info from branches;

-- 12. Get first 3 letters of client’s first name
select first_name , substring(first_name , 1 , 3 ) Short_name from clients; 

-- 13. Find length of client addresses
select first_name , length(address) as address_length from clients;

-- 14. Replace “Main Branch” with “Branch” in branch names
select Location , replace( name , 'Main Branch' , 'Branch') Short_Branch from branches;

-- 15. Show client names in uppercase
select upper(first_name) , upper(last_name) from clients;

-- 16. Trim spaces from client names
select trim(first_name) as Clean_First , trim(last_name) as Clean_Last from clients;

-- 17. Round account balances to nearest 100
SELECT ID, ROUND(Balance_account, -2) AS Rounded_Balance
FROM Account;

-- 18. Show balance divided by 1000 using CEIL/FLOOR
SELECT ID, CEIL(Balance_account/1000) AS Ceil_Val,
           FLOOR(Balance_account/1000) AS Floor_Val
FROM Account;

-- 19. Show absolute difference between Deposit and Withdraw
SELECT ID, ABS(Deposit - Withdraw) AS Abs_Diff
FROM transaction;

-- 20. Show whether balance is even or odd
SELECT ID, MOD(Balance_account, 2) AS EvenOrOdd
FROM Account;

-- 21. Round transaction amounts to 2 decimals
SELECT ID, ROUND(Amount_Transactions, 2) AS Rounded_Amount
FROM transaction;

-- 22. Show current time and date
SELECT NOW() AS Current_Time, CURDATE() AS Current_Date;

-- 23. Add 1 year to DOB
SELECT First_Name, DOB, DATE_ADD(DOB, INTERVAL 1 YEAR) AS Next_DOB
FROM clients;

-- 24. Show days lived by each client
SELECT First_Name, DATEDIFF(CURDATE(), DOB) AS Days_Lived
FROM clients;

-- 25. Format DOB as DD-Month-YYYY
SELECT First_Name, DATE_FORMAT(DOB, '%d-%M-%Y') AS Formatted_DOB
FROM clients;

-- 26. Show accounts created in July 2023
SELECT * FROM Account
WHERE MONTH(Created_at) = 7 AND YEAR(Created_at) = 2023;

-- 27. Show clients created in the last 2 years
SELECT * FROM clients
WHERE Created_Time >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- 28. Categorize accounts by balance
SELECT Balance_account,
       CASE 
         WHEN Balance_account >= 5000 THEN 'High'
         WHEN Balance_account BETWEEN 1000 AND 4999 THEN 'Medium'
         ELSE 'Low'
       END AS Balance_Category
FROM Account;

-- 29. Label clients as Adult if age >=18 else Minor
SELECT First_Name,
       CASE 
         WHEN Age >= 18 THEN 'Adult'
         ELSE 'Minor'
       END AS Category
FROM clients;

-- 30. Use IF to show gender as Male/Female
SELECT First_Name,
       IF(Sex = 'M', 'Male', 'Female') AS Gender
FROM clients;