-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select 
p.ProductName, 
c.CategoryName as [CategoryDescription]
from [Product] p
join [Category] c on p.CategoryId = c.id
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select 
o.ID, 
c.CompanyName as [CompanyName]
from [Order] o
join [Customer] c on o.CustomerID = c.id
where o.OrderDate < '2012-08-09'
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select 
o.Quantity, 
p.ProductName as [ProductName]
from [OrderDetail] o
join [Product] p on p.Id = o.ProductId
where o.OrderId = 10251
order by p.ProductName
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select 
o.Id, 
c.CompanyName,
e.LastName
from [Order] o
join [Customer] c on c.Id = o.CustomerId
join [Employee] e on e.Id = o.EmployeeId