-- DYNAMIC SHIPMENT
SELECT Platform, YYYYWW, SUM(Total) AS SUM FROM MJSHIPMENT.dbo.SHIPMENT
WHERE Platform = 'RUBY MOBILE' 
Group BY YYYYWW,Platform
ORDER BY YYYYWW

SELECT * FROM [MJSHIPMENT].dbo.SHIPMENT

--DYNAMIC TO MAKE WATERFALL TABLE(FIRST WATERFALL)
SELECT Platform,YYYYWW, Planning_Wk, Qty FROM MJDB2019.dbo.POR2019 
WHERE Platform = 'RUBY MOBILE '

SELECT Platform,YYYYWW, Planning_Wk, Qty FROM MJDB2018.dbo.POR2018
WHERE Platform = 'RUBY MOBILE '

--DYNAMIC TO GET REQUIRED POR DATA TO MAKE FINAL TABLE
SELECT Platform,Planning_Wk, YYYYWW, Region, MPA, SUM(Qty) AS Qty, QtyType 
FROM MJDB2019.dbo.POR2019 WHERE Platform = 'LHASA WL IA'
GROUP BY Planning_Wk,YYYYWW,Region,MPA,QtyType,Platform
ORDER BY Planning_Wk,YYYYWW

SELECT Platform,Planning_Wk, YYYYWW, Region, MPA, SUM(Qty) AS Qty, QtyType 
FROM MJDB2018.dbo.POR2018 WHERE Platform = 'LHASA WL IA'
GROUP BY Planning_Wk,YYYYWW,Region,MPA,QtyType,Platform
ORDER BY Planning_Wk,YYYYWW

--DYNAMIC TO GET YYYYWW FROM POR
SELECT DISTINCT REPLACE(Planning_Wk, 'W', '') AS PLAN_WK, Platform FROM MJDB2019.dbo.POR2019 
WHERE Platform ='LHASA WL IA'
GROUP BY Planning_Wk, Platform
ORDER BY PLAN_WK

SELECT DISTINCT REPLACE(Planning_Wk, 'W', '') AS PLAN_WK, Platform FROM MJDB2018.dbo.POR2018 
WHERE Platform ='LHASA WL IA'
GROUP BY Planning_Wk, Platform
ORDER BY PLAN_WK

--DYNAMIC GETTING PLANNING_WK TO ENTER LOOP
SELECT DISTINCT Planning_Wk, Platform FROM MJDB2019.dbo.POR2019 
WHERE Platform = 'LHASA WL IA'
ORDER BY Planning_Wk

SELECT YYYYWW,Region,MPA,Total,QtyType 
FROM SHIPMENT.dbo.SHIPMENT
WHERE Platform ='LHASA WL IA' AND YYYYWW <=" & planwk & "ORDER BY SHIP.YYYYWW

--DYNAMIC GETTING SHIP
SELECT YYYYWW,Region,MPA,Total,QtyType,Platform FROM MJSHIPMENT.dbo.SHIPMENT
WHERE Platform ='LHASA WL IA'
AND YYYYWW <= 201920
ORDER BY YYYYWW