
-- 建立資料庫 ---------------------------
======================================
CREATE DATABASE 新主健保資料庫GD
ON(NAME = 新主健保資料庫GD,
FILENAME= 'D:\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\新主健保資料庫GD.MDF')

-- 匯入資料 ------------------------------
======================================

DECLARE @i int
SET @i=201
WHILE @i<=225
BEGIN

DECLARE @sql varchar(4000)
SET @sql = 
'CREATE TABLE 新主健保資料庫GD.dbo.R'+convert(varchar(50),@i)+'GD2002([資料行 0] nvarchar(300))
 BULK INSERT 新主健保資料庫GD.dbo.R'+convert(varchar(50),@i)+'GD2002
 FROM "D:\資料存放\2012版本_新加密\2. 2005年百萬人抽樣檔\GD\R'+convert(varchar(50),@i)+'_GD2001.DAT"
 WITH (FIELDTERMINATOR = '+'''\t''' +',
         ROWTERMINATOR = '+'''0x0a'''+') '
PRINT @sql
 EXEC(@sql)
SET @i=@i+1
END


===================== 雙迴圈

DECLARE @j int
SET @j=2003
WHILE @j<=2013
BEGIN

   DECLARE @i int
   SET @i=201
   WHILE @i<=225
   BEGIN
   DECLARE @sql varchar(4000)
   SET @sql = 
   'CREATE TABLE 新主健保資料庫GD.dbo.R'+convert(varchar(50),@i)+'GD'+convert(varchar(50),@j)+'([資料行 0] nvarchar(300))
    BULK INSERT 新主健保資料庫GD.dbo.R'+convert(varchar(50),@i)+'GD'+convert(varchar(50),@j)+'
    FROM "D:\資料存放\2012版本_新加密\2. 2005年百萬人抽樣檔\GD\R'+convert(varchar(50),@i)+'_GD'+convert(varchar(50),@j)+'.DAT"
    WITH (FIELDTERMINATOR = '+'''\t''' +',
            ROWTERMINATOR = '+'''0x0a'''+') '
   PRINT @sql
    EXEC(@sql)
   SET @i=@i+1
   END

SET @j=@j+1
END


-- 合併資料表 -------------------
====================

declare @i int
set @i=1996
while @i<=2013
begin 

EXEC('
SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL

SELECT *
INTO GD'+@i+'
FROM R201GD'+@i+'
UNION ALL


')
    
set @i=@i+1
end








