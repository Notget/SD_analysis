Select deleteby, count(1) from deletedparty
where year(deleteDate) = '2015'
group by DeleteBy