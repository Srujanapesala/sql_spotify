CREATE DATABASE SPOTIFY;
USE SPOTIFY;

CREATE TABLE Artist(Artist_id int primary key,name varchar(50));
CREATE TABLE album2(album_id int,title varchar(50),Artist_id int);
CREATE TABLE playlist(playlist_id int,name varchar(50));
CREATE TABLE playlisttrack(playlistid int,trackid int);
CREATE TABLE TRACK (Trackid INT,name VARCHAR(50),albumid INT,mediaTypeId INT,genreid INT,composer VARCHAR(255),millisec INT,uniprice DECIMAL(10, 2));
create table mediatype(mediatypeid int, name varchar(50));
CREATE TABLE EMPLOYEE (EMPLOYEEID INT PRIMARY KEY,LASTNAME VARCHAR(50),FIRSTNAME VARCHAR(50),TITLE VARCHAR(100),REPORT_TO INT,BIRTH_DATE DATE,
HIRE_DATE DATE,ADDRESS VARCHAR(255),CITY VARCHAR(50),STATE VARCHAR(50),COUNTRY VARCHAR(50),POSTALCODE VARCHAR(20),PHONE VARCHAR(20),FAX VARCHAR(20),EMAIL VARCHAR(100));
CREATE TABLE GENRE(GENREID INT,NAME VARCHAR(50));
CREATE TABLE CUSTOMER (CUSTOMERID INT PRIMARY KEY,FIRSTNAME VARCHAR(50),LASTNAME VARCHAR(50),COMPANY VARCHAR(100),ADDRESS VARCHAR(255),CITY VARCHAR(50),STATE VARCHAR(50),COUNTRY VARCHAR(50),
POSTALCODE VARCHAR(20),PHONE VARCHAR(20),FAX VARCHAR(20),EMAIL VARCHAR(100),SUPPORTIDREPID INT);
CREATE TABLE INVOICELINE (INVOICELINEID INT PRIMARY KEY,INVOICEID INT NOT NULL,TRACKID INT NOT NULL,UNITPRICE DECIMAL(10, 2) NOT NULL,QUANTITY INT NOT NULL);
CREATE TABLE INVOICE(INVOICEID INT PRIMARY KEY,CUSTOMERID INT NOT NULL,INVOICEDATE DATE NOT NULL,BILLINGADDRESS VARCHAR(255),BILLINGCITY VARCHAR(50),BILLINGSTATE VARCHAR(50),BILLINGCOUNTRY VARCHAR(50),BILLINGPOSTALCODE VARCHAR(20),TOTAL DECIMAL(10, 2) NOT NULL);

desc artist;
desc album2;
desc customer;
desc employee;
desc invoice;
desc invoice_line;
desc playlist;
desc playlist_track;
desc track;
desc media_type;
desc genre;
-- mmv0210@gm

insert into artist values(1,'samantha'),(2,'nagarajuna'),(3,'pspk'),(4,'tarun'),(5,'nani');

INSERT INTO album2 (album_id, title, Artist_id) VALUES (1, '1989', 1),(2, 'Abbey Road', 2),(3, 'Divide', 3);

INSERT INTO GENRE VALUES(1, 'Pop'),(2, 'Rock'),(3, 'Electronic');

INSERT INTO mediatype (mediatypeid, name) VALUES (1, 'MP3'),(2, 'WAV'),(3, 'FLAC');

INSERT INTO INVOICELINE (INVOICELINEID, INVOICEID, TRACKID, UNITPRICE, QUANTITY) VALUES (1, 1, 1, 1.29, 10),(2, 2, 2, 1.49, 5),(3, 1, 3, 1.99, 8);

INSERT INTO playlist (playlist_id, name) VALUES (1, 'Chill Vibes'),(2, 'motivational songs'),(3, 'flok');

INSERT INTO playlisttrack (playlistid, trackid) VALUES (1, 1),(2, 2),(3, 3);

INSERT INTO INVOICE (INVOICEID, CUSTOMERID, INVOICEDATE, BILLINGADDRESS, BILLINGCITY, BILLINGSTATE, BILLINGCOUNTRY, BILLINGPOSTALCODE, TOTAL) VALUES 
(1, 1, '2023-01-01', '789 Pine St', 'San Francisco', 'CA', 'USA', '94101', 25.99),
(2, 2, '2023-01-02', '321 Oak St', 'Chicago', 'IL', 'USA', '60601', 15.49);

INSERT INTO CUSTOMER (CUSTOMERID, FIRSTNAME, LASTNAME, COMPANY, ADDRESS, CITY, STATE, COUNTRY, POSTALCODE, PHONE, FAX, EMAIL, SUPPORTIDREPID)
VALUES
(1, 'John', 'Doe', 'Acme Corp', '123 Elm St', 'New York', 'NY', 'USA', '10001', '123-456-7890', '123-456-7891', 'john.doe@example.com', 101),
(2, 'Jane', 'Smith', 'Globex Inc.', '456 Oak St', 'Los Angeles', 'CA', 'USA', '90001', '234-567-8901', '234-567-8902', 'jane.smith@example.com', 102),
(3, 'Michael', 'Johnson', 'Stark Industries', '789 Pine St', 'Chicago', 'IL', 'USA', '60601', '345-678-9012', '345-678-9013', 'michael.johnson@example.com', 103),
(4, 'Emily', 'Davis', 'Wayne Enterprises', '101 Maple Ave', 'Gotham', 'NJ', 'USA', '07001', '456-789-0123', '456-789-0124', 'emily.davis@example.com', 104),
(5, 'David', 'Wilson', 'Umbrella Corp', '202 Birch Ln', 'Raccoon City', 'PA', 'USA', '15001', '567-890-1234', '567-890-1235', 'david.wilson@example.com', 105);

INSERT INTO EMPLOYEE (EMPLOYEEID, LASTNAME, FIRSTNAME, TITLE, REPORT_TO, BIRTH_DATE, HIRE_DATE, ADDRESS, CITY, STATE, COUNTRY, POSTALCODE, PHONE, FAX, EMAIL) VALUES 
(1, 'Smith', 'John', 'Manager', NULL, '1980-01-01', '2010-06-15', '123 Main St', 'New York', 'NY', 'USA', '10001', '123-456-7890', NULL, 'john.smith@example.com'),
(2, 'Doe', 'Jane', 'Support Rep', 1, '1990-02-15', '2015-09-01', '456 Elm St', 'Los Angeles', 'CA', 'USA', '90001', '987-654-3210', NULL, 'jane.doe@example.com');

INSERT INTO TRACK (Trackid, name, albumid, mediaTypeId, genreid, composer, millisec, uniprice) VALUES 
(1, 'Shake It Off', 1, 1, 1, 'Taylor Swift', 210000, 1.29),
(2, 'Come Together', 2, 2, 2, 'The Beatles', 259000, 1.49),
(3, 'Shape of You', 3, 1, 3, 'Ed Sheeran', 234000, 1.99);






-- Employee Table
ALTER TABLE employee
ADD CONSTRAINT PK_employee PRIMARY KEY (employee_id);

-- Customer Table
ALTER TABLE customer
ADD CONSTRAINT PK_customer PRIMARY KEY (customer_id);

-- Invoice Table
ALTER TABLE invoice
ADD CONSTRAINT PK_invoice PRIMARY KEY (invoice_id);

ALTER TABLE invoice
ADD CONSTRAINT FK_invoice_customer 
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

-- Invoice_Line Table
ALTER TABLE invoice_line

ADD CONSTRAINT PK_invoice_line 
PRIMARY KEY (invoice_line_id);

ALTER TABLE invoice_line
ADD CONSTRAINT FK_invoice_line_invoice 
FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id);

ALTER TABLE invoice_line
ADD CONSTRAINT FK_invoice_line_track 
FOREIGN KEY (track_id) REFERENCES track(track_id);

-- Playlist Table
ALTER TABLE playlist
ADD CONSTRAINT PK_playlist PRIMARY KEY (playlist_id);

-- Playlist_Track Table
ALTER TABLE playlist_track
ADD CONSTRAINT PK_playlist_track 
PRIMARY KEY (playlist_id, track_id); -- Composite Key

ALTER TABLE playlist_track
ADD CONSTRAINT FK_playlist_track_playlist 
FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id);

ALTER TABLE playlist_track
ADD CONSTRAINT FK_playlist_track_track 
FOREIGN KEY (track_id) REFERENCES track(track_id);

-- Track Table
ALTER TABLE track
ADD CONSTRAINT PK_track PRIMARY KEY (track_id);

ALTER TABLE track
ADD CONSTRAINT FK_track_album 
FOREIGN KEY (album2_id) REFERENCES album(album2_id);

ALTER TABLE track
ADD CONSTRAINT FK_track_media_type 
FOREIGN KEY (media_type_id) REFERENCES media_type(media_type_id);

ALTER TABLE track
ADD CONSTRAINT FK_track_genre 
FOREIGN KEY (genre_id) REFERENCES genre(genre_id);

-- Media_Type Table
ALTER TABLE media_type
ADD CONSTRAINT PK_media_type PRIMARY KEY (media_type_id);

-- Artist Table
ALTER TABLE artist
ADD CONSTRAINT PK_artist PRIMARY KEY (artist_id);

-- Album Table
ALTER TABLE album2
ADD CONSTRAINT PK_album PRIMARY KEY (album2_id);

ALTER TABLE album2
ADD CONSTRAINT FK_album_artist 
FOREIGN KEY (artist_id) REFERENCES artist(artist_id);

-- Genre Table
ALTER TABLE genre
ADD CONSTRAINT PK_genre PRIMARY KEY (genre_id);

-- Self-Referencing Foreign Key for Employee (reports_to)
ALTER TABLE employee
ADD CONSTRAINT FK_employee_reports_to 
FOREIGN KEY (reports_to) REFERENCES employee(employee_id);

-- Adding foreign key to customer table from employee table
ALTER TABLE customer
ADD CONSTRAINT FK_customer_support_rep 
FOREIGN KEY (support_rep_id) REFERENCES employee(employee_id);

desc artist;
desc album2;
desc customer;
desc employee;
desc invoice;
desc invoice_line;
desc playlist;
desc playlist_track;
desc track;
desc media_type;
desc genre;


SELECT * FROM ARTIST;
SELECT * FROM ALBUM2;
SELECT * FROM CUSTOMER;
SELECT * FROM EMPLOYEE;
SELECT * FROM INVOICE;
SELECT * FROM INVOICELINE;
SELECT * FROM PLAYLIST;
SELECT * FROM PLAYLIST_TRACK;
SELECT * FROM MEDIA_TRACK;
SELECT * FROM TRACK;
SELECT * FROM GENRE;



-- 1. Who is the senior-most employee based on job title?

SELECT * 
FROM employee
ORDER BY levels DESC
LIMIT 1;

-- 2. Which countries have the most invoices?

SELECT COUNT(*) AS mostinvoices, billingcountry
FROM invoice
GROUP BY billingcountry
ORDER BY mostinvoices DESC;

-- 3. What are the top 3 values of total invoice?

SELECT total 
FROM invoice
ORDER BY total DESC
LIMIT 3;

-- 4. Which city has the best customers?

SELECT SUM(total) AS totalinvoice, billingcity
FROM invoice
GROUP BY billingcity
ORDER BY totalinvoice DESC
LIMIT 1;


-- 5. Who is the best customer?

SELECT c.customerid, c.firstname, c.lastname, SUM(i.total) AS total_spent
FROM customer c
JOIN invoice i ON c.customerid = i.customerid
GROUP BY c.customerid, c.firstname, c.lastname
ORDER BY total_spent DESC
LIMIT 1;


-- Moderate Level Questions:

-- 1. Write query to return the email, first name, last name, &amp; Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A.

select distinct c.email, c.firstname, c.lastname
from customer c
join invoice i on c.customerid= i.customerid
join invoiceline  il on i.invoiceid= il.invoiceid
where il.trackid In (
    select t.trackid 
	from track t
      join genre g on t.genreid= g.genreid
        where g.name like 'Rock'
)
 order by c.email desc;


-- 2. Lets invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands.

SELECT 
    artist.artist_id,
    artist.name,
    COUNT(track.trackid) AS number_of_songs
FROM 
    track
JOIN album2 ON album2.album_id = track.albumid
JOIN artist ON artist.artist_id = album2.artist_id
JOIN genre ON genre.genreid = track.genreid
WHERE 
    genre.name LIKE 'rock'
GROUP BY 
    artist.artist_id, artist.name
ORDER BY 
    number_of_songs DESC
LIMIT 10;


SELECT* FROM ALBUM2;
SELECT* FROM GENRE;
 select* from track;
 select * from artist;


-- 3. Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.

-- select * from track
-- DESC TRACK

SELECT name, millisec
FROM track
WHERE millisec > (SELECT AVG(millisec) FROM track)
ORDER BY millisec DESC;


-- Advance Level Questions:
-- 1. Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent.

with best_selling_artist as (
     select artist.artist_id as artistid, artist.name as artistname
     sum(invoiceline.unitprice * invoiceline.quantity) as total_sales
     from invoiceline
join track on track.trackid = invoiceline.trackid
join album2 on album2.album_id = track.albumid
join artist on artist.artist_id = album.artist_id
group by 1
order by 3 desc
limit 1
)
select c.customerid, c.firstname, c.lastname, bsa.artist_name,
sum(il.unitprice*il.quantity) as amount_spent
from invoice i
join customer c on c.customerid = i.customerid
join invoiceline il on il.invoiceid = i.invoiceid
join track t on t.trackid = il.trackid
join album2 alb on alb.album_id = t.albumid
join best_selling_artist bsa on bsa.artist_id = alb.artist_id
group by 1,2,3,4
order by 5 desc;


select * from artist;
select * from album2;
select * from track;
-- 2. We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres.

WITH popular_genre AS (
    SELECT 
        COUNT(il.quantity) AS purchases,
        c.country,
        g.name AS genrename,
        g.genreid,
        ROW_NUMBER() OVER (PARTITION BY c.country ORDER BY COUNT(il.quantity) DESC) AS rowno
    FROM invoiceline il
    JOIN invoice i ON i.invoiceid = il.invoiceid
    JOIN customer c ON c.customerid = i.customerid
    JOIN track t ON t.trackid = il.trackid
    JOIN genre g ON g.genreid = t.genreid
    GROUP BY c.country, g.name, g.genreid
    ORDER BY c.country ASC, purchases DESC
)
SELECT * 
FROM popular_genre 
WHERE rowno = 1;


-- 3. Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount.

WITH customer_with_country AS (
    SELECT 
        c.customerid, 
        c.firstname, 
        c.lastname, 
        c.country AS billingcountry, 
        SUM(i.total) AS total_spending
    FROM customer c
    JOIN invoice i ON c.customerid = i.customerid
    GROUP BY c.customerid, c.firstname, c.lastname, c.country
),
country_max_spending AS (
    SELECT 
        billingcountry, 
        MAX(total_spending) AS max_spending
    FROM customer_with_country
    GROUP BY billingcountry
)
SELECT 
    cc.billingcountry, 
    cc.total_spending, 
    cc.firstname, 
    cc.lastname, 
    cc.customerid
FROM customer_with_country cc
JOIN country_max_spending ms
ON cc.billingcountry = ms.billingcountry 
   AND cc.total_spending = ms.max_spending
ORDER BY cc.billingcountry;







