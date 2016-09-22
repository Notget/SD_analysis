select BookedBy, count(BookedBy) as count from deletedparty
group by BookedBy