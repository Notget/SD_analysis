Select calendar.datenum, Sum(addInflate), Sum(addBags), Sum(addBucks) from party
Join calendar
On party.dateScheduled = calendar.datenum
where year(calendar.datenum) = '2014'
group by calendar.datenum