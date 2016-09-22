Select month(dateScheduled) as month, Sum(addInflate), Sum(addBags), Sum(addBucks) from party
group by month(dateScheduled)
