Select month(dateScheduled) as month, Sum(addInflate), Sum(addBags), Sum(addBucks) from party
where year(dateScheduled) = '2016'
group by month(dateScheduled)
