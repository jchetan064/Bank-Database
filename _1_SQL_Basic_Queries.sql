Create database Bank;

use bank;

select * from account;

-- A.Retrieving Data (SELECT Basics)
-- 1. Show all columns from the clients table.
select * from clients;

-- 2. Display First_Name, Last_name, and DOB from clients.
select first_name , last_name , dob from clients;

-- 3. List all branches with their Location and Manager.
select location , manager from branches;

-- 4. Show all Account IDs and their Balance_account.
select  ID , balance_account from account;

-- B. Filtering Data (WHERE)
-- 5. Find all accounts with a balance greater than 5,000.
select * from account where balance_account > 5000;

-- 6. Get details of clients living in Berlin.
select * from clients where address like '%Berlin%';

-- 7. Show transactions where Amount_Transactions is greater than 500.
select * from transaction where amount_transactions > 500;

-- 8. Find accounts that are Inactive.
SELECT * FROM Account WHERE Status = 'Inactive';

-- C. Sorting Results (ORDER BY)
-- 9. List clients ordered by Last_name (A–Z).
SELECT * FROM clients ORDER BY Last_name ASC;

-- 10. Show accounts sorted by Balance_account in descending order.
SELECT * FROM Account ORDER BY Balance_account DESC;

-- 11. Display transactions ordered by Date_issued (latest first).
SELECT * FROM transaction ORDER BY Date_issued DESC;

-- D. Limiting Results (LIMIT / TOP)
-- 12. Show the top 5 highest account balances.
SELECT * FROM Account ORDER BY Balance_account DESC LIMIT 5;

-- 13. Get the 3 most recent transactions.
SELECT * FROM transaction ORDER BY Date_issued DESC LIMIT 3;

-- E. Basic Operators
-- Arithmetic (+, -, , /, %)
-- 14. Increase all account balances by 10% (display only, don’t update).
SELECT ID, Balance_account, Balance_account * 1.10 AS Increased_Balance FROM Account;

-- 15. Show Amount_Transactions in euros and cents (divide by 100).
SELECT ID, Amount_Transactions, Amount_Transactions / 100.0 AS Euros FROM transaction;

-- Comparison (=, <>, <, >, <=, >=)
-- 16. Find clients aged 30 or older.
SELECT * FROM clients WHERE Age >= 30;

-- 17. Get accounts where balance is not equal to 1,000.
SELECT * FROM Account WHERE Balance_account <> 1000;


-- Logical (AND, OR, NOT)
-- 18. Find accounts with balance > 1,000 AND status = 'Active'.
SELECT * FROM Account WHERE Balance_account > 1000 AND Status = 'Active';

-- 19. Show clients from Berlin OR Munich.
SELECT * FROM clients WHERE Address LIKE '%Berlin%' OR Address LIKE '%Munich%';

-- 20. Find accounts NOT in branch ID 1.
SELECT * FROM Account WHERE Branch_ID <> 1;

-- F. BETWEEN, IN, LIKE, IS NULL
-- 21.Show accounts with balance BETWEEN 1,000 and 5,000.
SELECT * FROM Account WHERE Balance_account BETWEEN 1000 AND 5000;

-- 22.List branches IN ('Berlin', 'Munich').
SELECT * FROM branches WHERE Location IN ('Berlin', 'Munich');

-- 23.Find clients whose first name starts with 'B'.
SELECT * FROM clients WHERE First_Name LIKE 'B%';

-- 24.Get accounts where Deleted_at IS NULL.
SELECT * FROM Account WHERE Deleted_at IS NULL;