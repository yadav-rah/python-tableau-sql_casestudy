-- See all tables in the SQLite Database
SELECT name
FROM sqlite_master
WHERE type="table";

-- See all columns from tables;

SELECT *
FROM customer;

SELECT *
FROM cust_account;

SELECT *
FROM cust_services;

SELECT *
FROM cust_loc;

SELECT *
FROM cust_churn;

-- Information about customers (use customer table)
SELECT Gender,
         count(Gender)
FROM customer
GROUP BY  Gender;

SELECT Partner,
         count(Partner)
FROM customer
GROUP BY  Partner;


SELECT Dependents,
         count(Dependents)
FROM customer
GROUP BY  Dependents;

-- Information about customer's account (use cust_account table)
SELECT round(avg(Tenure),
         2)
FROM cust_account;SELECT round(avg(MonthlyCharges),
         2)
FROM cust_account;SELECT round(avg(TotalCharges),
         2)
FROM cust_account;

-- Customer who paid more than the average TotalCharges
SELECT count(Account_id)
FROM cust_account
WHERE TotalCharges >
    (SELECT avg(TotalCharges)
    FROM cust_account );

-- Customer who paid less than the average TotalCharges
SELECT count(Account_id)
FROM cust_account
WHERE TotalCharges <
    (SELECT avg(TotalCharges)
    FROM cust_account);

-- Count of customers by Contract
SELECT Contract,
         count(Contract) AS C
FROM cust_account
GROUP BY  Contract
ORDER BY  C desc;

-- Information about Churn (cust_churn)
select Churn, count(Churn) from cust_churn group by Churn;

-- TotalCharges grouped by Churn
SELECT cc.Churn,
         avg(ca.TotalCharges)
FROM cust_churn cc
INNER JOIN cust_account ca
    ON ca.Account_id = cc.Id
GROUP BY  cc.Churn;

-- MonthlyCharges grouped by Churn
SELECT cc.Churn,
         avg(ca.MonthlyCharges)
FROM cust_churn cc
INNER JOIN cust_account ca
    ON ca.Account_id = cc.Id
GROUP BY  cc.Churn;

-- Contract grouped by Churn
SELECT cc.Churn,
         ca.Contract count(ca.Contract)
FROM cust_churn cc
INNER JOIN cust_account ca
    ON ca.Account_id = cc.Id
GROUP BY  cc.Churn, ca.Contract;


-- Correct values for churn_all table
UPDATE churn_all SET TotalCharges = '0.00'
WHERE Churn = 'No'
        AND typeof(TotalCharges) != 'text';
