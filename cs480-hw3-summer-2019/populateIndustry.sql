use Industry;
delete from Employee; 
delete from Employment; 
delete from Company;

-- your code starts here
/*
LOAD DATA INFILE '/home/codio/workspace/Employee.csv' INTO TABLE Employee
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/codio/workspace/Employment.csv' INTO TABLE Employment
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n';
  
INSERT INTO Company(COMPANY_NAME, CITY) VALUES ('a', 'b');
LOAD DATA INFILE '/home/codio/workspace/Company.csv' INTO TABLE Company
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n';
*/

INSERT INTO Employee(PERSON_NAME,STREET,CITY) VALUES ('Amy','State','New York'),('Gregory','Broadway','Chicago'),
('Matthew','Roosevelt','Chicago'),('Omar','102nd','Louisville'),('Sarah','Clinton','Miami'),('Theresa','Main','Detroit');

INSERT INTO Employment(PERSON_NAME,COMPANY_NAME,SALARY) VALUES ('Amy','Amazon','12000.00'), ('Gregory','American Airline','9000.00')
,('Matthew','Starbucks','9000.00'),('Sarah','Amazon','14000.00'),('Theresa','Facebook','15000.00');

INSERT INTO Company(COMPANY_NAME, CITY) VALUES ('Amazon','Chicago'),('American Airline','Seattle'),
('Facebook','Detroit'),('First Bank','Miami'),('McDonalds','Milwaukee'),('Starbucks','Chicago');
-- your code ends here

select * from Employee order by PERSON_NAME;
select * from Employment order by PERSON_NAME;
select * from Company order by COMPANY_NAME;