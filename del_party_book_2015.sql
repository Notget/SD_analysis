select BookedBy, count(BookedBy) as count from deletedparty
where year(deletedparty.dateScheduled) = '2015'
group by BookedBy