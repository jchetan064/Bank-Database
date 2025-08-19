-- Q1. Show all clients with their account numbers
SELECT 
    CONCAT(cl.first_name, ' ', cl.last_name) `Client Name`,
    acc.id `Account Number`
FROM
    account acc
        JOIN
    clients cl ON acc.client_ID = cl.ID;

-- Q2. List all accounts with their account type description.
SELECT 
    a.ID AS Account_ID, at.Description_Type
FROM
    Account a
        INNER JOIN
    Account_types at ON a.account_type_id = at.ID;

-- Q3. Show all accounts with their branch name and manager.
SELECT 
    a.ID AS Account_ID, b.Name AS Branch_Name, b.Manager
FROM
    Account a
        INNER JOIN
    branches b ON a.Branch_ID = b.ID;
    
-- Q4. Show all clients and their accounts (include clients without accounts).
SELECT c.First_Name, c.Last_name, a.ID AS Account_ID, a.Balance_account
FROM clients c
LEFT JOIN Account a ON c.ID = a.Client_ID;

-- Q5. Show all branches and their accounts (include branches with no accounts).
SELECT b.Name AS Branch_Name, a.ID AS Account_ID
FROM branches b
LEFT JOIN Account a ON b.ID = a.Branch_ID;

-- Q6. Show all accounts with their client info (include accounts without a client, if possible).
SELECT c.First_Name, c.Last_name, a.ID AS Account_ID, a.Balance_account
FROM clients c
RIGHT JOIN Account a ON c.ID = a.Client_ID;

-- Q7. Show all accounts with their branch (include branches even if no accounts).
SELECT a.ID AS Account_ID, b.Name AS Branch_Name
FROM Account a
RIGHT JOIN branches b ON a.Branch_ID = b.ID;

-- Q8. Show all clients and accounts, including clients with no accounts and accounts without clients.
SELECT c.First_Name, c.Last_name, a.ID AS Account_ID
FROM clients c
LEFT JOIN Account a ON c.ID = a.Client_ID
UNION
SELECT c.First_Name, c.Last_name, a.ID AS Account_ID
FROM clients c
RIGHT JOIN Account a ON c.ID = a.Client_ID;

-- Q9. Show all accounts and their branch info (include accounts without branch and branches without accounts).
SELECT a.ID AS Account_ID, b.Name AS Branch_Name
FROM Account a
LEFT JOIN branches b ON a.Branch_ID = b.ID
UNION
SELECT a.ID AS Account_ID, b.Name AS Branch_Name
FROM Account a
RIGHT JOIN branches b ON a.Branch_ID = b.ID;

-- Q10. Show all possible combinations of clients and transaction types.
SELECT c.First_Name, c.Last_name, tt.Transaction_type
FROM clients c
CROSS JOIN transaction_type tt;

-- Q11. Show all possible combinations of account types and branches.
SELECT at.Description_Type, b.Name AS Branch_Name
FROM Account_types at
CROSS JOIN branches b;

-- Q12. List pairs of clients living in the same city (from Address).
SELECT c1.First_Name AS Client1, c2.First_Name AS Client2, c1.Address
FROM clients c1
INNER JOIN clients c2 
    ON c1.Address = c2.Address AND c1.ID < c2.ID;

-- Q13. Compare accounts in the same branch – show accounts where one has higher balance than another.
SELECT a1.ID AS Account1, a2.ID AS Account2, a1.Balance_account, a2.Balance_account, b.Name AS Branch_Name
FROM Account a1
INNER JOIN Account a2 ON a1.Branch_ID = a2.Branch_ID AND a1.Balance_account > a2.Balance_account
INNER JOIN branches b ON a1.Branch_ID = b.ID;

-- Q14. Show client name, account balance, account type, and branch location.
SELECT c.First_Name, c.Last_name, a.Balance_account, at.Description_Type, b.Location
FROM clients c
JOIN Account a ON c.ID = a.Client_ID
JOIN Account_types at ON a.account_type_id = at.ID
JOIN branches b ON a.Branch_ID = b.ID;

-- Q15. Show transaction details with client names and transaction type.
SELECT t.ID AS Transaction_ID, c.First_Name, c.Last_name, t.Amount_Transactions, tt.Transaction_type
FROM transaction t
JOIN Account a ON t.Source_Account_ID = a.ID
JOIN clients c ON a.Client_ID = c.ID
JOIN transaction_type tt ON t.Transactions_type_ID = tt.ID;

-- Q16. Show the total transaction amount per client.

SELECT c.First_Name, c.Last_name, SUM(t.Amount_Transactions) AS Total_Amount
FROM clients c
JOIN Account a ON c.ID = a.Client_ID
JOIN transaction t ON a.ID = t.Source_Account_ID
GROUP BY c.First_Name, c.Last_name;

-- Q17. Show each branch with the number of clients it serves.
SELECT b.Name AS Branch_Name, COUNT(DISTINCT c.ID) AS Total_Clients
FROM branches b
JOIN Account a ON b.ID = a.Branch_ID
JOIN clients c ON a.Client_ID = c.ID
GROUP BY b.Name;

-- Q18. Find the average balance per account type.
SELECT at.Description_Type, AVG(a.Balance_account) AS Avg_Balance
FROM Account a
JOIN Account_types at ON a.account_type_id = at.ID
GROUP BY at.Description_Type;

-- Q19. Find the client with the highest total transaction amount.
SELECT c.First_Name, c.Last_name, SUM(t.Amount_Transactions) AS Total_Amount
FROM clients c
JOIN Account a ON c.ID = a.Client_ID
JOIN transaction t ON a.ID = t.Source_Account_ID
GROUP BY c.First_Name, c.Last_name
ORDER BY Total_Amount DESC
LIMIT 1;

-- Q20. Find the branch with the most accounts.
SELECT b.Name AS Branch_Name, COUNT(a.ID) AS Total_Accounts
FROM branches b
JOIN Account a ON b.ID = a.Branch_ID
GROUP BY b.Name
ORDER BY Total_Accounts DESC
LIMIT 1;
