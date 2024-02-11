

----1------

select P.firstname, P.lastname,E.emailaddress,PH.phonenumber,PHT.name from person.person P
inner join person.EmailAddress E on P.BusinessEntityID= E.BusinessEntityID
inner join person.PersonPhone PH on PH.BusinessEntityID = E.BusinessEntityID
inner join person.PhoneNumberType PHT on PHT.PhoneNumberTypeID=PH.PhoneNumberTypeID


-----2-----
select * from [Sales].[SalesOrderHeader] where Month(OrderDate) = '05' and year(OrderDate) = '2011' 

-----3-----
select * from [Sales].[SalesOrderDetail]where Month(ModifiedDate) = '05' and year(ModifiedDate) = '2011' 

----4------

select sum(sd.LineTotal) as Totalsales  from sales.SalesOrderDetail SD inner join sales.SalesOrderHeader SH on SD.SalesOrderID=SH.SalesOrderID
where SH.OrderDate between ('2011-05-01') and ('2011-05-31')

-----5-----

select sum(sd.LineTotal)as Totalsales,month(OrderDate) as Salemonth from sales.SalesOrderDetail SD inner join sales.SalesOrderHeader SH on SD.SalesOrderID=SH.SalesOrderID group by month(OrderDate) 
order by Totalsales 

----6-----

select P.FirstName,P.LastName,sum(SD.LineTotal) TotalSales from person.person P 
inner join sales.PersonCreditCard CC on P.BusinessEntityID=CC.BusinessEntityID  
inner join [Sales].[SalesOrderHeader] SH on SH.creditcardID=CC.creditcardID
inner join sales.SalesOrderDetail SD on SD.SalesOrderID=SH.SalesOrderID
and P.FirstName='Guastov' and P.LastName='Achong'
group by P.BusinessEntityID,P.FirstName,P.LastName;

