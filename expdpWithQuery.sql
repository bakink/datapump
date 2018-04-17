--expdp with query option 
with cte as (select to_char(create_date,'YYYYMMDD') create_date,count(*) from X.Y where to_char(create_date,'YYYYMM')='201803'
group by to_char(create_date,'YYYYMMDD') order by 1 asc
)
select 'nohup expdp "USERID=''/ as sysdba'' CONTENT=DATA_ONLY DUMPFILE=expdb.Y_'||create_date||'.dmp LOGFILE=expdb.Y_'||create_date||'.log TABLES=X.Y DIRECTORY=DUMP_DIR2 CLUSTER=N ' 
||'query=''WHERE to_char(create_date,''''YYYYMMDD'''')='''''||create_date||''''''' "'||' &'
from cte 

--expdp with partition table
select 'nohup expdp "USERID=''/ as sysdba'' CONTENT=DATA_ONLY DUMPFILE=expdp.'||lower(table_name)||'.'||partition_name||'.dmp LOGFILE=expdp.'||lower(table_name)||'.'||partition_name||'.log TABLES='||table_owner||'.'||table_name||':'||partition_name||' DIRECTORY=DUMP_DIR2 CLUSTER=N" &' 
from dba_tab_partitions where table_owner='X' and table_name='X' order by partition_name
