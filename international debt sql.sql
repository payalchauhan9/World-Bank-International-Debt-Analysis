create database world;

use world;

Create table international_debt
(country_name varchar(50),
country_code varchar(50),
indicator_name text,
indicator_code text,
debt numeric
);

# Copy data from csv

COPY international_debt(country_name, country_code, indicator_name, indicator_code, debt)
from 'C:\Users\hp\Downloads\international_debt.csv'
DELIMITER ',' csv header;
