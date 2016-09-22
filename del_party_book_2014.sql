select BookedBy, count(BookedBy) as count from deletedparty
where year(deletedparty.dateScheduled) = '2014'
group by BookedBy