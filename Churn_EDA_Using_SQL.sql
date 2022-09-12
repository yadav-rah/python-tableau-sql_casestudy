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
