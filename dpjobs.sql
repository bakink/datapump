
select OWNER_NAME
      ,JOB_NAME
      ,OPERATION
      ,JOB_MODE
      ,STATE
      ,DEGREE DG
      ,ATTACHED_SESSIONS ATS
      ,DATAPUMP_SESSIONS DPS
  from DBA_DATAPUMP_JOBS
;

select dds.OWNER_NAME
      ,dds.JOB_NAME
      ,dds.SESSION_TYPE
      ,vs.sid
from DBA_DATAPUMP_SESSIONS dds
join v$session vs on vs.saddr=dds.saddr
;
