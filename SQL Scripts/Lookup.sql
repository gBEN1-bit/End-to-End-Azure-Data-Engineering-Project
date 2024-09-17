select 
s.name as SchemaName,
t.name as TableName
from sys.tables t
INNER JOIN sys.schemas s
on t.schema_id = s.schema_id
where s.name = 'SalesLT'
