Select CheckOutandIn.PopularGenre
From CheckOutandIn
Where CheckOutandIn.WhenCheckedOut BETWEEN '06/01/2018' AND '12/31/2018'
Limit 5;