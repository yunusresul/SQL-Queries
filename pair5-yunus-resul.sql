--1.Product isimlerini (ProductName) ve birim başına miktar (QuantityPerUnit) değerlerini almak için sorgu yazın.
select product_name, quantity_per_unit from products 
--2.Ürün Numaralarını (ProductID) ve Product isimlerini (ProductName) değerlerini almak için sorgu yazın. Artık satılmayan ürünleri (Discontinued) filtreleyiniz.
select product_id, product_name from products where discontinued =1
-- 3.Durdurulan Ürün Listesini, Ürün kimliği ve ismi (ProductID, ProductName) değerleriyle almak için bir sorgu yazın.
 select product_id, product_name from products where discontinued =0
--4.Ürünlerin maliyeti 20'dan az olan Ürün listesini (ProductID, ProductName, UnitPrice) almak için bir sorgu yazın.
select product_id, product_name, unit_price from products where unit_price < 20
--5.Ürünlerin maliyetinin 15 ile 25 arasında olduğu Ürün listesini (ProductID, ProductName, UnitPrice) almak için bir sorgu yazın.
select product_id, product_name, unit_price from products where unit_price between 15 AND 25
select product_id, product_name, unit_price from products where unit_price >= 15 and unit_price <= 25
--6.Ürün listesinin (ProductName, UnitsOnOrder, UnitsInStock) stoğun siparişteki miktardan az olduğunu almak için bir sorgu yazın.
select product_name , units_on_order, units_in_stock from products where units_on_order > units_in_stock
--7.İsmi a ile başlayan ürünleri listeleyeniz.
select * from products where lower (product_name) like 'a%'
--8.İsmi i ile biten ürünleri listeleyeniz.
select * from products where lower (product_name) like '%i'
--9.Ürün birim fiyatlarına %18’lik KDV ekleyerek listesini almak (ProductName, UnitPrice, UnitPriceKDV) için bir sorgu yazın.
select product_name,unit_price, unit_price*1.18 as "unit_price_kdv" from products 
--10.Fiyatı 30 dan büyük kaç ürün var?
--select kolon_ismi from tablo_ismi 
select count(unit_price)from products where unit_price >30

--11. Ürünlerin adını tamamen küçültüp fiyat sırasına göre tersten listele
select lower(product_name) as "Lower", unit_price from products order by unit_price desc
--12. Çalışanların ad ve soyadlarını yanyana gelecek şekilde yazdır
SELECT first_name || ' ' || last_name 
AS "AdSoyad" FROM employees
--13. Region alanı NULL olan kaç tedarikçim var?
select count(*) from suppliers where region is null

--14. a.Null olmayanlar?
select count(*) from suppliers where region is not null
--15. Ürün adlarının hepsinin soluna TR koy ve büyültüp olarak ekrana yazdır.
select 'TR ' || upper(product_name) as "new_name" from products 
--16. a.Fiyatı 20den küçük ürünlerin adının başına TR ekle
select 'TR ' || upper(product_name) as "new_name", unit_price from products 
where unit_price <20

--17. En pahalı ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
select product_name, unit_price from products order by unit_price desc

--18. En pahalı on ürünün Ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
select product_name, unit_price from products order by unit_price desc limit 10

--19. Ürünlerin ortalama fiyatının üzerindeki Ürün listesini 
--(`ProductName` , `UnitPrice`) almak için bir sorgu yazın.
select product_name, unit_price from products 
where unit_price > (select avg(unit_price) from products)

select avg(unit_price) as "ortalama_deger" from products 

--20. Stokta olan ürünler satıldığında elde edilen miktar ne kadardır.
select sum(units_in_stock*unit_price) as "toplam_satis" from products

--21. Mevcut ve Durdurulan ürünlerin sayılarını almak için bir sorgu yazın.
select count(discontinued) from products where discontinued = 1 --durdurulanlar
select count(discontinued) from products where discontinued = 0 --mevcut olanlar
select count(discontinued) from products where discontinued = 1 or discontinued = 0 --hepsi
--22. Ürünleri kategori isimleriyle birlikte almak için bir sorgu yazın.
select product_name, category_name from products, categories
where products.category_id = categories.category_id

--23. Ürünlerin kategorilerine göre fiyat ortalamasını almak için bir sorgu yazın.
select category_name, avg(unit_price) as "ortalama" from products,categories 
where products.category_id = categories.category_id group by category_name


--24. En pahalı ürünümün adı, fiyatı ve kategorisin adı nedir?
select product_name, category_name, unit_price from products, categories
where products.category_id = categories.category_id and unit_price = (select max(unit_price) from products)

select product_name, category_name, unit_price from products, categories
where products.category_id = categories.category_id order by unit_price desc limit 1


--25. En çok satılan ürününün adı, kategorisinin adı ve tedarikçisinin adı
select product_name, category_name, company_name 
from products, categories, suppliers
where products.category_id = categories.category_id and products.supplier_id = suppliers.supplier_id 
and units_on_order = (select max(units_on_order) from products)


select product_name, category_name, company_name 
from products, categories, suppliers
where products.category_id = categories.category_id and products.supplier_id = suppliers.supplier_id 
order by units_on_order desc limit 1 







