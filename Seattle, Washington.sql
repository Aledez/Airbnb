create table calendarSeattle (
	listing_id int,
    date date,
    available varchar (10),
    price int,
    adjusted_price varchar (200),
    minimum_nights varchar (200),
    maximum_nights int
);

SHOW GLOBAL VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;

load data local infile "C:/Users/ehanz/OneDrive/Documents/data_analysis/AirBnb Project/Seattle, Washington/calendarSeattle.csv"
into table calendarseattle
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

delete from calendarseattle;

UPDATE calendarseattle
SET date = DATE_ADD(date, INTERVAL (2022 - YEAR(date)) YEAR)
WHERE date BETWEEN DATE(NOW() + INTERVAL 1 DAY) AND DATE('2024-12-31');