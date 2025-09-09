#Understanding data
SELECT * FROM international_debt 
LIMIT  10;

#Finding the total number of countries
SELECT COUNT(country_name) as countryname
FROM international_debt; 

#Finding the name of distinct countries
SELECT DISTINCT country_name 
FROM international_debt
limit 10;

#Finding the number of distinct countries
SELECT 
COUNT(DISTINCT(country_name)) AS distinct_countries 
FROM international_debt;

#Finding out the distinct debt indicators
SELECT DISTINCT(indicator_code) AS distinct_debt_indicators
FROM international_debt
ORDER BY distinct_debt_indicators; 

#Totaling the amount of debt owed by the countries
SELECT  
ROUND(SUM(debt)/100000, 2) AS total_debt
FROM international_debt;

#Country with highest debt
SELECT country_name,
 SUM(debt) AS total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 3;

#Finding debt of India
SELECT country_name,
 SUM(debt) AS total_debt
FROM international_debt
where country_name = 'INDIA';

#Average amount of debt across indicators
SELECT 
    indicator_code AS debt_indicator,
    indicator_name,
    AVG(debt) AS average_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt DESC
LIMIT 10;

#Highest amount of principal repayments
SELECT 
    country_name, 
    indicator_name
FROM international_debt
WHERE debt = (SELECT 
                MAX(debt) 
                FROM international_debt
                ORDER BY MAX(debt) DESC);
                
#Most common debt indicator
SELECT 
    indicator_code,
    COUNT(indicator_code) AS indicator_count
FROM international_debt
GROUP BY indicator_code
ORDER BY indicator_count DESC, indicator_code DESC
LIMIT 20;

#Other viable debt issues and conclusion
SELECT
    country_name,
    indicator_name,
    MAX(debt) AS maximum_debt
FROM international_debt
GROUP BY country_name, indicator_name
ORDER BY maximum_debt DESC
LIMIT 10;