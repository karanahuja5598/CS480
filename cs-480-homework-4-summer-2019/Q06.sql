Select Books.Title, Books.Genre, BookDetails.Location
From Books Natural Join BookDetails
Where Books.Genre = 'Fantasy and Western' AND BookDetails.Location = 'Washington'
ORDER BY Books.Title ASC;