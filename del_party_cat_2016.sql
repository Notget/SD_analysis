Select deleteby, count(1) from deletedparty
where year(deleteDate) = '2016'
group by DeleteBy