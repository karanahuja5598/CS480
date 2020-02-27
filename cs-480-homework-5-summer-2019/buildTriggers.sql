DROP TRIGGER IF EXISTS groupStock;
DELIMITER //
CREATE TRIGGER groupStock
BEFORE INSERT ON Stock 
FOR EACH ROW
BEGIN
  DECLARE message VARCHAR(255);
  IF NEW.Quantity <= 0 THEN 
    SET message = 'Stock Quantity must be greater than 0';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = message;
  END IF;
  
END; //

DELIMITER ;

DROP TRIGGER IF EXISTS groupStock2;
DELIMITER //
CREATE TRIGGER groupStock2
BEFORE UPDATE ON Stock 
FOR EACH ROW 
BEGIN
  DECLARE message VARCHAR(255);
  IF NEW.Quantity <= 0 THEN 
    SET message = 'Stock Quantity must be greater than 0';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = message;
  END IF;
  
END; //

DELIMITER ;



DROP TRIGGER IF EXISTS availFunds;
DELIMITER //
CREATE TRIGGER availFunds
BEFORE INSERT ON Person
FOR EACH ROW
BEGIN
  DECLARE message VARCHAR(255);
  IF NEW.Balance <= 0 THEN
    SET message = 'Account Balance must be greater than 0';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = message;
 END IF;
 
END; //

DELIMITER ;

DROP TRIGGER IF EXISTS availFunds2;
DELIMITER //
CREATE TRIGGER availFunds2
BEFORE UPDATE ON Person
FOR EACH ROW
BEGIN
  DECLARE message VARCHAR(255);
  IF NEW.Balance <= 0 THEN
    SET message = 'Account Balance must be greater than 0';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = message;
 END IF;
 
END; //

DELIMITER ;


DROP TRIGGER IF EXISTS selltheOrders;
DELIMITER //
CREATE TRIGGER selltheOrders
BEFORE INSERT ON SellOrder
FOR EACH ROW
BEGIN
  DECLARE message VARCHAR(255);
  IF NEW.Price <= 0.05 THEN
    SET message = 'Minimum transaction price of 0.05';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = message;
  END IF;
  
END; //

DELIMITER ;

DROP TRIGGER IF EXISTS selltheOrders2;
DELIMITER //
CREATE TRIGGER selltheOrders2
BEFORE UPDATE ON SellOrder
FOR EACH ROW
BEGIN
  DECLARE message VARCHAR(255);
  IF NEW.Price <= 0.05 THEN
    SET message = 'Minimum transaction price of 0.05';
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = message;
  END IF;
  
END; //

DELIMITER ;


