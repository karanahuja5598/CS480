-- call delete from on all tables to remove old data
use Library;
delete from Customer; 
delete from StaffMember; 
delete from Administrator;
delete from Books;
delete from BookDetails;
delete from WorkShifts;
delete from CheckOutandIn;
delete from BooksByMonth;
-- your code here to populate the library
INSERT INTO Customer(ID,CHECK_OUT,CHECK_IN,PUT_HOLD,CANCEL_HOLD,NAME) VALUES (1,'Yes','No','Yes','No','Samwise Gamgee'),(2,'No','No','No','No','Bill Clinton'),
(3,'No','No','No','No','Barack Obama'),(4,'No','No','No','No','Tiger Woods'),(5,'No','No','No','No','LeBron James'),
(8,'No','No','No','No','Jean Valjean');

INSERT INTO StaffMember(ID,REMOVE_BOOK,MOVE_BOOK,FIND_CUSTOMER,CREATE_MEMBER,SALARY,WORKTIME,DUTIES) VALUES (1,'No','No','NA','No',5500,'Morning','Shelving'),
(2,'No','No','NA','No',2500,'Evening','Receptionist'),(3,'No','No','NA','No',7500,'Afternoon','Shelving'),(4,'No','No','NA','No',4200,'Afternoon','Receptionist'),
(5,'No','No','NA','No',1100,'Evening','Shelving');

INSERT INTO Administrator(ID,SEARCHSTAFF,LISTSTAFF,SALARYSTAFF,REVOKEMEMBERSHIP,HIRESTAFF,FIRESTAFF) VALUES (1,'NA','NA','NA','NA','NA','NA'),
(2,'NA','NA','NA','NA','NA','NA'),(3,'NA','NA','NA','NA','NA','NA'),(4,'NA','NA','NA','NA','NA','NA'),(5,'NA','NA','NA','NA','NA','NA');

INSERT INTO Books(BOOKID,TITLE,AUTHOR,NUMBEROFCOPIES,GENRE) VALUES (1,'A Song of Ice and Fire','George Martin','1','Fantasy and Western'),(2,'Harry Potter #1','J.K. Rowling',1,'Fantasy and Mystery'),
(3,'Little Red Riding Hood','Charles Perrault',1,'Fairy Tale'),(4,'The Hunger Games','Suzaane Collins',1,'Science Fiction'),
(5,'To Kill a Mockingbird','Harper Lee',1,'Novel and Thriller');

INSERT INTO BookDetails(BOOKID,TITLE,AUTHOR,LOCATION,AVAILABLE,ISDAMAGED,BOOKBARCODE,ONHOLD,CUSTOMERID) VALUES (1,'A Song of Ice and Fire','George Martin','Washington','Yes','No',510,'No',1),
(2,'Harry Potter #1','J.K. Rowling','Jefferson','Yes','No',525,'No',0),(3,'Little Red Riding Hood','Charles Perrault','Roosevelt','Yes','No',542,'Yes',0),
(4,'The Hunger Games','Suzaane Collins','Grand Library at Alexandria','Yes','No',657,'No','0'),(5,'To Kill a Mockingbird','Harper Lee','Obama','Yes','No',742,'No',0);

INSERT INTO WorkShifts(StaffID,WORKEDON,WillWork) VALUES (1,'08/01/2018','12/11/2018'),(2,'05/07/2018','12/11/2018'),
(3,'04/25/2018','01/07/2019'),(4,'02/13/2018','09/25/2018'),(5,'06/26/2018','01/08/2019');

INSERT INTO CheckOutandIn(CustomerID,WhenCheckedOut,WhenCheckedIn,PopularGenre,BooksID) VALUES (1,'08/15/2018','09/27/2018','Fantasy',3),
(2,'08/12/2018','09/27/2018','Western',5),(3,'08/13/2018','09/28/2018','Horror',2),(4,'08/24/2018','10/24/2018','Novel',4),
(5,'09/24/2018','11/23/2018','Thriller',6),(6,'09/27/2018','11/27/2018','Fairy Tales',7),(7,'08/26/2018','11/23/2018','Science Fiction',7),
(8,'11/12/2018','12/23/2018','Mystery',1);

INSERT INTO BooksByMonth(Month,HowManyOut,HowManyIn,WhichYear) VALUES ('January',5,7,2018),('February',3,8,2018),('March',8,12,2018),
('April',7,24,2018),('May',8,16,2018),('June',6,4,2018),('July',4,2,2018),('August',3,6,2018),('September',5,2,2018),('October',1,1,2018),
('November',6,8,2018),('December',1,4,2018);
-- end code block
select * from Customer order by ID;
select * from StaffMember order by ID;
select * from Administrator order by ID;
select * from Books order by BOOKID;
select * from BookDetails order by BOOKID;
select * from WorkShifts order by StaffID;
select * from CheckOutandIn order by CustomerID;
select * from BooksByMonth order by Month;