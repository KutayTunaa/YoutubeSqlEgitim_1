SELECT ContactName, CompanyName, City FROM Customers  

Select * from Customers where City = 'London'
  
  --case insensitive büyük küçüğe duyarsız
  
select * from Products where categoryId=1 or categoryId=3

--5. satırda producttaki categori id 1 olanları yada 3 olanları göster dedik
select * from Products where categoryId=1 and UnitPrice>=10
-- <> farklı
 select * from order by ProductName
--order by sırala demek
select * from Product order by CategoryID,ProductName

select * from Product order by UnitPrice asc
--ascending : artan demek 
--fiyat azalan demek : desc yani descending 
select * from Products where categoryId = 1 order by UnitPrice desc

select count(*) from Products 
--count tek bir satır tek bir kod gelmeli
--countun yanına sayı getirir isim vb. getirmez
--katergori bağımsız tümünü getirir

--hangi kategoride kaç farklı ürünümüz var ?
--group by : seçtiğimiz kolon sadece group byda yazdığımız alan ce coun(*) olabilir.
select categoryID, count(*) 
  from products where UnirPrice >20 
    group by CategoryID having count(*)<10
--20 den fazla ücretli, 10 taneden az ürün çeşidi olan kategorileri ver sorugu
  
select * from products inner join Categories 
on Products.CategoryID = Categories.CategoryID
--inner join hem products hemde categoriesini birleştiriyor
--on products tablosundaki categoryid ile categoriler tablosundaki categoryıd ye göre eşitse yan yana getir dedik
--on: on şartında neye göre birleştireceğin sorgusunu yaptık

select Products.ProductsId , Products.ProductName , Products.UnitPrice , Categories.CategoryName from Products inner join Categories 
on Products.CategoryID = Categories.CategoryID 
where Products.UnitPrice>10

--DTO - Data Transformation object 
--inner join order details karışmasın diyerek ayrı kodlar olarak alınmaması için [] kullanılır çünkü ayrık yazılır
  -- od: order deatails / Product: p
select * from Products p inner join [Order Details] od 
on p.ProductID = od.ProductID
-- inner join sadece eşleşenleri getirir ve sadece şki tabloda birleşenleri getirir

select * from Products p left join [Order Details] od 
on p.ProductID = od.ProductID
--left: solda olup sağda olmayanları getirir

select * from Customers c inner join Orders o 
on c.CustomerID = o.CustomerID
--innerda 830 kayıt çıktı
  
select * from Customers c left join Orders o 
on c.CustomerID = o.CustomerID
--leftte ise 832 kayıt çıktı yani solda olup siparişte olmayanlarıda eklemiş olduk

--solda olup sağda olmayanlar için; sana özel indirim gelmesi bu sorguyla yapılır:
select * from Customers c left join Orders o 
on c.CustomerID = o.CustomerID where o.CustomerID is null 

--right join leftin tam tersidir 

--ikiden fazla tabloyu join etmek için:
select * from Products p inner join [Order Details] od 
on p.ProductID = od.ProductID
inner join  Order o 
on o.OrderID = od.OrderID 


