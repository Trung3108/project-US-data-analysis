   SELECT
    YEAR(OrderDate) AS [Year],
    SalesTeamID AS [ID],
    SUM(Revenue_before_Discount) AS TotalRevenue,
    CASE 
        WHEN YEAR(OrderDate) = 2018 
             AND SUM(Revenue_before_Discount) >= 700000 
             THEN 'Achieved'
        WHEN YEAR(OrderDate) = 2018 
             AND SUM(Revenue_before_Discount) < 700000 
             THEN 'Below Target'
        WHEN YEAR(OrderDate) = 2019 
             AND SUM(Revenue_before_Discount) >= (700000 * 0.3 + 700000) 
             THEN 'Achieved'
        WHEN YEAR(OrderDate) = 2019 
             AND SUM(Revenue_before_Discount) < (700000 * 0.3 + 700000) 
             THEN 'Below Target'
        WHEN YEAR(OrderDate) = 2020 
             AND SUM(Revenue_before_Discount) >= ((700000 * 0.3 + 700000) * 0.3 + 700000 * 0.3 + 700000) 
             THEN 'Achieved'
        WHEN YEAR(OrderDate) = 2020 
             AND SUM(Revenue_before_Discount) < ((700000 * 0.3 + 700000) * 0.3 + 700000 * 0.3 + 700000) 
             THEN 'Below Target'
        ELSE 'Unknown'
    END AS KPIStatus
FROM dbo.US_Regional_Sales_Data
GROUP BY YEAR(OrderDate), SalesTeamID;