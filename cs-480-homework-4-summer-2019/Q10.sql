UPDATE BookDetails SET BookDetails.CustomerID = 7 WHERE BookDetails.BOOKID = 7;
UPDATE Customer SET Customer.CHECK_OUT = 'Yes' WHERE Customer.NAME = 'Gilbert Blythe';
UPDATE BookDetails SET BookDetails.Available = 'No' WHERE BookDetails.BOOKID ='7';
UPDATE Books SET Books.NumberOfCopies = 0 WHERE Books.Title = 'Anne of Green Gables';
UPDATE Customer SET Customer.CHECK_OUT = 'YES' WHERE Customer.NAME = 'Gilbert Blythe';
SELECT * FROM Customer;
SELECT * FROM Books;
SELECT * FROM BookDetails;


