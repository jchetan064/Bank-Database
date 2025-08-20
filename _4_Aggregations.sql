create database bank;
use bank;

-- Q1. Count how many clients are in the bank.
SELECT 
    COUNT(*) `Total Clients`
FROM
    clients;

-- Q2. Count the number of accounts per branch.
SELECT 
    br.name `Branch Name`, COUNT(acc.id) `Total Accounts`
FROM
    branches br
        JOIN
    account acc ON br.id = acc.branch_id
GROUP BY br.name;

-- Q3. Find the total balance across all accounts.
SELECT 
    SUM(balance_account) `Total Balance`
FROM
    account;

-- Q4. Find the total transaction amount per transaction type.
SELECT 
    tt.transaction_type `Transaction Type`,
    SUM(t.amount_transactions) `Total Amount`
FROM
    transaction_type tt
        JOIN
    transaction t ON t.transactions_type_id = tt.id
GROUP BY tt.transaction_type;

-- Q5. Find the average account balance per branch.
SELECT 
    br.name `Branch Name`,
    ROUND(AVG(acc.Balance_account), 2) `Average balance`
FROM
    branches br
        JOIN
    account acc ON acc.branch_id = br.id
GROUP BY br.name;

-- Q6. Find the average transaction amount per client.
SELECT 
    c.First_Name,
    c.last_name,
    ROUND(AVG(t.Amount_Transactions), 2) `Average Transaction Amount`
FROM
    clients c
        JOIN
    Account a ON c.ID = a.Client_ID
        JOIN
    transaction t ON a.ID = t.Source_Account_ID
GROUP BY c.First_Name , c.Last_name;
 
-- Q7. Find the highest account balance.
SELECT 
    MAX(balance_account) `Highest Balance`
FROM
    account;

-- Q8. Find the lowest transaction amount and the client who made it.
SELECT 
    c.First_Name,
    c.last_name,
    MIN(t.Amount_Transactions) `Lowest Transaction Amount`
FROM
    clients c
        JOIN
    Account a ON c.ID = a.Client_ID
        JOIN
    transaction t ON a.ID = t.Source_Account_ID
GROUP BY c.First_Name , c.Last_name;

-- Q9. Show number of clients per city.
SELECT 
    address City, COUNT(id) Total_Clients
FROM
    clients
GROUP BY address;

-- Q10. Show total balance per account type.
SELECT 
    at.description_type, SUM(a.Balance_account)
FROM
    account a
        JOIN
    account_types at ON a.account_type_id = at.id
GROUP BY at.description_type;

-- Q11. Show branches where the average account balance is more than 2,000.
SELECT 
    br.name, ROUND(AVG(a.balance_account), 2)
FROM
    account a
        JOIN
    branches br ON a.branch_id = br.id
GROUP BY br.name
HAVING ROUND(AVG(a.balance_account), 2) > 2000;

-- Q12. Show clients who have made transactions totaling more than 1,000.
SELECT 
    c.First_Name,
    c.Last_name,
    SUM(t.Amount_Transactions) AS Total_Amount
FROM
    clients c
        JOIN
    Account a ON c.ID = a.Client_ID
        JOIN
    transaction t ON a.ID = t.Source_Account_ID
GROUP BY c.First_Name , c.Last_name
HAVING total_amount > 1000;

-- Q13. Show all account IDs grouped by client.
SELECT 
    c.First_Name,
    c.Last_name,
    GROUP_CONCAT(a.ID) AS Accounts_List
FROM
    clients c
        JOIN
    Account a ON c.ID = a.Client_ID
GROUP BY c.First_Name , c.Last_name;

-- Q14. Show all transaction IDs grouped by transaction type.
SELECT 
    tt.Transaction_type, GROUP_CONCAT(t.ID) AS Transactions_List
FROM
    transaction t
        JOIN
    transaction_type tt ON t.Transactions_type_ID = tt.ID
GROUP BY tt.Transaction_type;

-- Q15. Show the client with maximum total transaction amount.
 SELECT 
    c.First_Name,
    c.Last_name,
    SUM(t.Amount_Transactions) AS Total_Amount
FROM
    clients c
        JOIN
    Account a ON c.ID = a.Client_ID
        JOIN
    transaction t ON a.ID = t.Source_Account_ID
GROUP BY c.First_Name , c.Last_name
ORDER BY Total_Amount DESC
LIMIT 1;

-- Q16. Show each branch with total number of accounts and total balance.
 SELECT 
    b.Name AS Branch_Name,
    COUNT(a.ID) AS Total_Accounts,
    SUM(a.Balance_account) AS Total_Balance
FROM
    branches b
        JOIN
    Account a ON b.ID = a.Branch_ID
GROUP BY b.Name;


-- Q17. Show average, min, and max transaction amount per transaction type.
 SELECT 
    tt.Transaction_type,
    ROUND(AVG(t.Amount_Transactions), 2) AS Avg_Amount,
    ROUND(MIN(t.Amount_Transactions), 2) AS Min_Amount,
    ROUND(MAX(t.Amount_Transactions), 2) AS Max_Amount
FROM
    transaction t
        JOIN
    transaction_type tt ON t.Transactions_type_ID = tt.ID
GROUP BY tt.Transaction_type;

-- Q18. Find clients who have more than 1 account.
SELECT 
    c.First_Name, c.Last_name, COUNT(a.ID) AS Total_Accounts
FROM
    clients c
        JOIN
    Account a ON c.ID = a.Client_ID
GROUP BY c.First_Name , c.Last_name
HAVING COUNT(a.ID) > 1;

-- Q19. Find branches where total transaction amount exceeds 1,000.
 SELECT b.Name AS Branch_Name, SUM(t.Amount_Transactions) AS
 Total_Transactions
 FROM branches b
 JOIN Account a ON b.ID = a.Branch_ID
 JOIN transaction t ON a.ID = t.Source_Account_ID
 GROUP BY b.Name
 HAVING SUM(t.Amount_Transactions) > 1000;

-- Q20. Find account type with highest average balance.
 SELECT at.Description_Type, ROUND(AVG(a.Balance_account),2) AS Avg_Balance
 FROM Account a
 JOIN Account_types at ON a.account_type_id = at.ID
 GROUP BY at.Description_Type
 ORDER BY Avg_Balance DESC
 LIMIT 1;