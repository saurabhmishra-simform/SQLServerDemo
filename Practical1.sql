/*----- Create product table ------*/
CREATE TABLE Product
(ProductId INT NOT NULL PRIMARY KEY IDENTITY(1,1),ProductName NVARCHAR(500) NOT NULL,
Category NVARCHAR(500) NOT NULL,Price MONEY NOT NULL);

/*----- Add new column in product table ------*/
ALTER TABLE Product ADD Discription NVARCHAR(500) NOT NULL;
ALTER TABLE Product ADD CONSTRAINT CHK_Product_Price CHECK(Price>0);

/*----- Insert records in the product table ------*/
INSERT INTO Product VALUES
	('Rose','Flower',5.20,'The rose is flower.'),
	('Realme','Mobile',15000,'The realme is mobile phone brand.'),
	('Lotus','Flower',10.20,'The lotus is flower.'),
	('Blood Bag','Health',799.56,'Blood bag is health product'),
	('Poco','Mobile',16000,'The realme is mobile phone brand.'),
	('SQL','Programming',1500.20,'The sql is programming language'),
	('First aid kit','Health',699.99,'First aid kit is small health kit product'),
	('Sunflower','Flower',16.20,'The sunflower is flower.'),
	('Java','Programming',1000.20,'The java is programming language'),
	('Walker','Health',999.99,'Walker is health product'),
	('Oppo','Mobile',20000,'The oppo is mobile phone brand'),
	('DotNet','Programming',499.25,'The dotnet is programming language'),
	('Microscope','Health',1999.99,'Microscope is health product'),
	('Jasmine','Flower',45.20,'The jasmine is flower.');

/*----- Show all product witch belonging in health categrory ------*/
SELECT ProductId,ProductName,Category,Price,Discription FROM Product WHERE Category = 'health';

/*----- Query for get total price of all product ------*/
SELECT SUM(price) AS TotalPrice FROM Product;

/*----- Query for display all product in descending order of price ------*/
SELECT ProductId,ProductName,Category,Price,Discription FROM Product ORDER BY price DESC;

/*----- Query for display category wise product count having price greater than  10000 ------*/
SELECT Category,COUNT(Category) AS ProductCount FROM Product WHERE Price > 10000 GROUP BY Category;