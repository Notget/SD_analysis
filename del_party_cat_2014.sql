Select deleteby, count(1) from deletedparty
where year(deleteDate) = '2014'
group by DeleteBy