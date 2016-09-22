select BookedBy, count(BookedBy) as count from deletedparty
where year(deletedparty.dateScheduled) = '2016'
group by BookedBy