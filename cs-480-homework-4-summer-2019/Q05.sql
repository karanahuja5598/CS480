SELECT BookDetails.Title,Customer.Name,Customer.ID,BookDetails.CUSTOMERID
FROM BookDetails Natural JOIN Customer
WHERE Customer.Name = 'Samwise Gamgee' AND Customer.ID = BookDetails.CUSTOMERID
ORDER BY BookDetails.Title ASC;