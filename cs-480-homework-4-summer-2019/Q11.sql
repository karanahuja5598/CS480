UPDATE BookDetails SET BookDetails.CustomerID = 0 WHERE BookDetails.BOOKID = 6;
UPDATE Customer SET Customer.CHECK_OUT = 'No' WHERE Customer.NAME = 'Anne Shirley';
UPDATE Customer SET Customer.CHECK_IN = 'Yes' WHERE Customer.NAME = 'Anne Shirley';
UPDATE BookDetails SET BookDetails.Available = 'Yes' WHERE BookDetails.BOOKID ='6';
UPDATE Books SET Books.NumberOfCopies = 1 WHERE Books.Title = 'Anne of Green Gables';
SELECT * FROM Customer;
SELECT * FROM Books;
SELECT * FROM BookDetails;


