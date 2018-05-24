--expdp with query option 
with cte as (select to_char(create_date,'YYYYMMDD') create_date,count(*) from X.Y where to_char(create_date,'YYYYMM')='201803'
group by to_char(create_date,'YYYYMMDD') order by 1 asc
)
select 'nohup expdp "USERID=''/ as sysdba'' CONTENT=DATA_ONLY DUMPFILE=expdb.Y_'||create_date||'.dmp LOGFILE=expdb.Y_'||create_date||'.log TABLES=X.Y DIRECTORY=DUMP_DIR2 CLUSTER=N ' 
||'query=''WHERE to_char(create_date,''''YYYYMMDD'''')='''''||create_date||''''''' "'||' &'
from cte 

query='CUSTOMER.ALZ_HLTH_MDLR_LOG:"WHERE ((application_name = ''CREATE_PROPOSAL'' and ref_2 = ''ONAYAGONDER'')
             or application_name = ''KOC_HLTH_WEB_EXT_REN_EDI_ROUTE''
             or application_name = ''KOC_HLTH_EXT_REN_EDI_ROUTE''
             or application_name = ''KOC_HLTH_WEB_INT_REN_ROUTE''
             or application_name = ''BEFORE_POL_RESTORE''
             or application_name = ''POL_RESTORE'')"'
