Select month(party.dateScheduled) as month, party.dateScheduled, partyreceipt.partyID, sum(partyreceipt.subTotal) from partyreceipt
join party
join calendar 
on party.partyID = partyreceipt.partyID and party.dateScheduled = calendar.datenum
group by month