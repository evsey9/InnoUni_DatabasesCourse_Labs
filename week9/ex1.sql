 
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

-- Do transactions, Part A

BEGIN TRANSACTION;

SAVEPOINT SP0;

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

-- Part B

-- Alter table
ALTER TABLE accounts
    ADD BankName VARCHAR(15);

UPDATE accounts
SET BankName = 'SberBank'
WHERE accountId = 1 OR accountId = 3;

UPDATE accounts
SET BankName = 'Tinkoff'
WHERE accountId = 2;

COMMIT;

-- Reset credit
UPDATE accounts
SET credit = 1000;

COMMIT;

-- Add Account 4 for fees

INSERT
INTO accounts(accountId,accountName,credit,currency,BankName)
VALUES 
(4, 'Account4', 0, 'RUB','FeesBank');
COMMIT;

-- Do transactions


BEGIN TRANSACTION;

SAVEPOINT SP0;

DO $$
declare
    account1 integer := 1;
    account2 integer := 3;
    creditTransfer integer := 500;
    bank1 varchar;
    bank2 varchar;
BEGIN
    UPDATE accounts
    SET credit = credit - creditTransfer
    WHERE accountId = account1;

    UPDATE accounts
    SET credit = credit + creditTransfer
    WHERE accountId = account2;
    
    select BankName from accounts
    into bank1
    where accountId = account1;
    
    select BankName from accounts
    into bank2
    where accountId = account2;
    
    IF (select )
END$$
SAVEPOINT SP1;
