delimiter //
DROP FUNCTION IF EXISTS BuyStock;
CREATE FUNCTION BuyStock(pname VARCHAR(60),sname VARCHAR(60),amount int(11))
RETURNS DECIMAL(14,2)
BEGIN
DECLARE totalCost decimal(14,2);
DECLARE balance int(11);
DECLARE compID int(11);
DECLARE accID int(11);

SET totalCost = 0.00;

SELECT CompanyID into compID
FROM Company
WHERE Company.CompanyName = sname; 

SELECT Balance into balance
FROM Person
WHERE Person.AccountName = pname;

SELECT AccountID into accID
FROM Person
WHERE Person.AccountName = pname;

WHILE amount > 0 DO
  BEGIN
  SELECT Stock.Quantity,LotID,StockID,AccountID,SellOrder.Price,COUNT(*) into @q,@lotID,@stockID,@sellID,@p,@numRows
  FROM Stock NATURAL JOIN SellOrder
  WHERE CompanyID = compID AND AccountID <> accID
  Limit 1;
  
  IF (@numRows = 0) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Insufficient quantity of stock available for purchase';
    RETURN 0.00;
  END IF;
  
  -- SELECT @q,@lotID,amount;
  
  IF(@q > amount) THEN
    BEGIN
    INSERT INTO Stock(CompanyID,AccountID,Quantity) VALUES (compID,accID,amount);
    UPDATE Stock SET Stock.Quantity = @q - amount WHERE Stock.StockID = @stockID;
    UPDATE Person SET Person.Balance = Person.Balance - (@p * amount) WHERE Person.AccountName = pname;
    UPDATE Person SET Person.Balance = Person.Balance + (@p * amount) WHERE Person.AccountID = @sellID;
    SET totalCost = totalCost + (@p * amount);
    SET amount = 0;
    END;
  ELSE
    BEGIN
    DELETE FROM SellOrder WHERE SellOrder.LotID = @lotID;
    UPDATE Stock SET Stock.AccountID = accID WHERE StockID = @stockID;
    UPDATE Person SET Person.Balance = Person.Balance - (@p * @q) WHERE Person.AccountName = pname;
    UPDATE Person SET Person.Balance = Person.Balance + (@p * @q) WHERE Person.AccountID = @sellID;
    SET amount = amount - @q;
    SET totalCost = totalCost + (@p * @q);
    END;
  END IF;
  
  IF amount = 0 THEN
    RETURN totalCost;
  END IF;
  
END;
END WHILE;

END; //

delimiter ;



delimiter //
DROP FUNCTION IF EXISTS SellStock;
CREATE FUNCTION SellStock(pname VARCHAR(60),sname VARCHAR(60),amount int(11),price decimal(14,2))
RETURNS int
BEGIN

SELECT CompanyID into @compID
FROM Company
WHERE CompanyName = sname;

SELECT AccountID into @accID
FROM Person
WHERE AccountName = pname;

WHILE amount > 0 DO
BEGIN
  SELECT Quantity,Stock.StockID,AccountID,COUNT(*) into @q,@stockID,@sellID,@numRows
  FROM Stock LEFT OUTER JOIN SellOrder
  ON Stock.StockID = SellOrder.StockID
  WHERE CompanyID = @compID AND AccountID = @accID AND LotID IS NULL
  LIMIT 1;
  
  IF (@numRows = 0) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Insufficient quantity of stock available to sell';
    RETURN 0.00;
  END IF;

  IF(@q > amount) THEN
    BEGIN
    INSERT INTO Stock(CompanyID,AccountID,Quantity) VALUES (@compID,@accID,amount);
    INSERT INTO SellOrder(StockID,Price) VALUES (LAST_INSERT_ID(),price);
    UPDATE Stock SET Quantity = @q - amount WHERE StockID = @stockID;
    SET amount = 0;
    END;
  ELSE
    BEGIN
    INSERT INTO SellOrder(StockID,Price) VALUES (@stockID,price);
    SET amount = amount - @q;
    END;
  END IF;
  
  IF amount = 0 THEN
    RETURN 1;
  END IF;
END;
END WHILE;

END; //

delimiter ;


delimiter //
DROP PROCEDURE IF EXISTS WithdrawFunds;
CREATE PROCEDURE WithdrawFunds(in AccountName varchar(60),in value DECIMAL(14,2))
BEGIN
UPDATE Person
SET Balance = Balance - value
WHERE Person.AccountName = AccountName;
SELECT * FROM Person WHERE Person.AccountName = AccountName;
END; //

delimiter ;


delimiter //
DROP PROCEDURE IF EXISTS DepositFunds;
CREATE PROCEDURE DepositFunds(in AccountName varchar(60),in value DECIMAL(14,2))
BEGIN
UPDATE Person
SET Balance = Balance + Value
WHERE Person.AccountName = AccountName;
SELECT * FROM Person WHERE Person.AccountName = AccountName;
END;  //
delimiter ;
