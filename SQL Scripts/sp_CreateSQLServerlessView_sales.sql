use SalesData
GO

CREATE OR ALTER PROC CreateSQLServerlessView_sales @ViewName NVARCHAR(100)
AS 
BEGIN

DECLARE @statement VARCHAR(MAX)

    SET @statement = N'CREATE OR ALTER VIEW ' + @ViewName + ' AS
        SELECT *
        FROM 
            OPENROWSET(
            BULK ''https://gbdatalakegen2.dfs.core.windows.net/secondleveltransformation/SalesLT/' + @ViewName + '/'',
            FORMAT = ''DELTA''  
         ) as [result]
    '

EXEC (@statement)

END
GO

        