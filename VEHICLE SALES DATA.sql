SELECT *
FROM [VEHICLE SALES DATA]..CarSales

--FINDING THE PRICE DISTRIBUTION
SELECT 
    (SELECT COUNT(*) FROM [VEHICLE SALES DATA]..CarSales c2 WHERE c2.SellingPrice <= c1.SellingPrice) AS Percentile,
    MIN(SellingPrice) AS MinPrice,
    MAX(SellingPrice) AS MaxPrice,
    AVG(SellingPrice) AS AvgPrice,
    COUNT(*) AS Frequency
FROM [VEHICLE SALES DATA]..CarSales c1
GROUP BY c1.SellingPrice
ORDER BY Percentile

--FINDING THE TOP SELLING BRANDS
SELECT TOP 10
    Make,
    COUNT(*) AS TotalSales,
    AVG(SellingPrice) AS AvgPrice
FROM [VEHICLE SALES DATA]..CarSales
GROUP BY Make
ORDER BY TotalSales DESC

--FINDING THE PRICE TREND OVER YEARS
SELECT 
    Year,
    AVG(SellingPrice) AS AvgPrice
FROM [VEHICLE SALES DATA]..CarSales
GROUP BY Year
ORDER BY Year

--FINDING THE PRICE BY MILEAGE RANGE
SELECT 
    CASE 
        WHEN Odometer < 50000 THEN '0-50k'
        WHEN Odometer >= 50000 AND Odometer < 100000 THEN '50k-100k'
        WHEN Odometer >= 100000 AND Odometer < 150000 THEN '100k-150k'
        ELSE '150k+'
    END AS MileageRange,
    AVG(SellingPrice) AS AvgPrice
FROM [VEHICLE SALES DATA]..CarSales
GROUP BY 
    CASE 
        WHEN Odometer < 50000 THEN '0-50k'
        WHEN Odometer >= 50000 AND Odometer < 100000 THEN '50k-100k'
        WHEN Odometer >= 100000 AND Odometer < 150000 THEN '100k-150k'
        ELSE '150k+'
    END
ORDER BY 
    CASE 
        WHEN MIN(Odometer) < 50000 THEN 1
        WHEN MIN(Odometer) >= 50000 AND MIN(Odometer) < 100000 THEN 2
        WHEN MIN(Odometer) >= 100000 AND MIN(Odometer) < 150000 THEN 3
        ELSE 4
    END

--FINDING THE AVERAGE PRICE BY TRANSMISSION TYPE
SELECT 
    Transmission,
    AVG(SellingPrice) AS AvgPrice
FROM [VEHICLE SALES DATA]..CarSales
GROUP BY Transmission
ORDER BY AvgPrice DESC

--FINDING THE AVERAGE PRICE BY BODY TYPE
SELECT 
    Body,
    AVG(SellingPrice) AS AvgPrice
FROM [VEHICLE SALES DATA]..CarSales
GROUP BY Body
ORDER BY AvgPrice DESC

--FINDING PRICE ANALYSIS BY CONDITION
SELECT 
    Condition,
    COUNT(*) AS TotalCars,
    AVG(SellingPrice) AS AvgPrice,
    MIN(SellingPrice) AS MinPrice,
    MAX(SellingPrice) AS MaxPrice
FROM [VEHICLE SALES DATA]..CarSales
GROUP BY Condition

--FINDING MONTHLY SALES TRENDS
SELECT 
    YEAR(saledate) AS Year,
    MONTH(saledate) AS Month,
    COUNT(*) AS TotalSales,
    SUM(SellingPrice) AS TotalRevenue
FROM [VEHICLE SALES DATA]..CarSales
GROUP BY YEAR(saledate), MONTH(saledate)
ORDER BY Year, Month

--CREATING A TEMP TABLE
CREATE TABLE #TempCarSales (
    Year INT,
    Make VARCHAR(100),
    Model VARCHAR(100),
    Trim VARCHAR(100),
    Body VARCHAR(100),
    Transmission VARCHAR(50),
    Vin VARCHAR(100),
    State VARCHAR(50),
    Condition VARCHAR(50),
    Odometer INT,
    Color VARCHAR(50),
    Interior VARCHAR(50),
    Seller VARCHAR(50),
    Mmr DECIMAL(10, 2),
    SellingPrice DECIMAL(10, 2),
    SaleDate DATE
)

DROP TABLE #TempCarSales





















    








