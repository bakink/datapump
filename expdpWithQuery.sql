with cte as (select to_char(create_date,'YYYYMMDD') create_date,count(*) from CUSTOMER.ALZ_DOC_INFOS where to_char(create_date,'YYYYMM')='201803'
group by to_char(create_date,'YYYYMMDD') order by 1 asc
)
select 'nohup expdp "USERID=''/ as sysdba'' CONTENT=DATA_ONLY DUMPFILE=expdb.alz_doc_infos_'||create_date||'.dmp LOGFILE=expdb.alz_doc_infos_'||create_date||'.log TABLES=CUSTOMER.ALZ_DOC_INFOS DIRECTORY=DUMP_DIR2 CLUSTER=N ' 
||'query=''WHERE to_char(create_date,''''YYYYMMDD'''')='''''||create_date||''''''' "'||' &'
from cte 
