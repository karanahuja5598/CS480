UPDATE BookDetails SET BookDetails.CustomerID = 0 WHERE BookDetails.BOOKID = 7;
UPDATE Customer SET Customer.CHECK_OUT = 'No' WHERE Customer.NAME = 'Gilbert Blythe';
UPDATE Customer SET Customer.CHECK_IN = 'Yes' WHERE Customer.NAME = 'Gilbert Blythe';
UPDATE BookDetails SET BookDetails.Available = 'Yes' WHERE BookDetails.BOOKID ='7';
UPDATE Books SET Books.NumberOfCopies = 2 WHERE Books.Title = 'Anne of Green Gables';
SELECT * FROM Customer;
SELECT * FROM Books;
SELECT * FROM BookDetails;
