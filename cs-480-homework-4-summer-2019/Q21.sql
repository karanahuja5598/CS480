Select BookDetails.Title,CheckOutandIn.WhenCheckedOut
From BookDetails JOIN CheckOutandIn
Where CheckOutandIn.WhenCheckedOut = '08/15/2018' AND BookDetails.BOOKID = CheckOutandIn.BooksID;