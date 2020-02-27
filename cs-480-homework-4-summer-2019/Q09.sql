UPDATE BookDetails SET BookDetails.CustomerID = 6 WHERE BookDetails.BOOKID = 6;
UPDATE Customer SET Customer.CHECK_OUT = 'Yes' WHERE Customer.NAME = 'Anne Shirley';
UPDATE BookDetails SET BookDetails.Available = 'No' WHERE BookDetails.BOOKID ='6';
UPDATE Books SET Books.NumberOfCopies = 1 WHERE Books.Title = 'Anne of Green Gables';
UPDATE Customer SET Customer.CHECK_OUT = 'YES' WHERE Customer.NAME = 'Anne Shirley';
SELECT * FROM Customer;
SELECT * FROM Books;
SELECT * FROM BookDetails;


