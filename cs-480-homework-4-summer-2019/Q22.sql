Select CheckOutandIn.WhenCheckedIn
From CheckOutandIn JOIN Customer
Where Customer.NAME = 'Jean Valjean' AND CheckOutandIn.CustomerID = Customer.ID;