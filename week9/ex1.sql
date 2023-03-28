 
-- Create normalized table

CREATE TABLE accounts
	(
	accountId INT,
	accountName VARCHAR(15),
	credit REAL,
	currency VARCHAR(15),
	PRIMARY KEY (accountId)
	);


	
-- Insert data

INSERT
INTO accounts(accountId,accountName,credit,currency)
VALUES 
(1, 'Account1', 1000, 'RUB'),
(2, 'Account2', 1000, 'RUB'),
(3, 'Account3', 1000, 'RUB');

COMMIT;

-- Do transactions

BEGIN TRANSACTION;


UPDATE accounts
SET credit = credit - 500
WHERE accountId = 1;

UPDATE accounts
SET credit = credit + 500
WHERE accountId = 3;

SAVEPOINT SP1;


UPDATE accounts
SET credit = credit - 700
WHERE accountId = 2;

UPDATE accounts
SET credit = credit + 700
WHERE accountId = 1;

SAVEPOINT SP2;


UPDATE accounts
SET credit = credit - 100
WHERE accountId = 2;

UPDATE accounts
SET credit = credit + 100
WHERE accountId = 3;

SAVEPOINT SP3;

COMMIT;

SELECT * FROM accounts;
