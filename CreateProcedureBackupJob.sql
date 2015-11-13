USE [msdb]
GO

/****** Object:  StoredProcedure [dbo].[CreateBkpJob]    Script Date: 11/13/2015 13:20:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateBkpJob]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreateBkpJob]
GO

USE [msdb]
GO

/****** Object:  StoredProcedure [dbo].[CreateBkpJob]    Script Date: 11/13/2015 13:20:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[CreateBkpJob]
(
 @dbname AS VARCHAR(100)
,@bkpfolderpath AS VARCHAR(100)
,@dailyorhourly AS VARCHAR(10)
,@timetorun bigint
,@daytorun bigint
)
AS

DECLARE @jobname VARCHAR(50)
--DECLARE @dbname AS VARCHAR(20)
--DECLARE @bkpfolderpath AS VARCHAR(100)
--DECLARE @dailyorhourly AS VARCHAR(10)
--DECLARE @timetorun bigint
--DECLARE @daytorun bigint
DECLARE @dayshortname char(3)

--SET @timetorun = 140000
--set @daytorun = 32
--SET @dbname = 'CalcuQuote_WF'
--SET @dailyorhourly = 'daily' -- 'hourly/daily'
--SET @bkpfolderpath = 'C:\Test'

select @dayshortname=case @daytorun
      when 1 then 'SUN'
      when 2 then 'MON'
      when 4 then 'TUE'
      when 8 then 'WED'
      when 16 then 'THU'
      when 32 then 'FRI'
      when 64 then 'SAT'
END


IF @dailyorhourly = 'hourly'
	SET @jobname = @dbname + '_BKP_' + SUBSTRING(cast(@timetorun as varchar(10)),1,2)
else 
	SET @jobname = @dbname + '_BKP_' + @dayshortname + '_' + SUBSTRING(cast(@timetorun as varchar(10)),1,2)
SET @bkpfolderpath = @bkpfolderpath + '\' + @dbname + '\' + @jobname

-- create folder
exec master.sys.xp_create_subdir @bkpfolderpath

IF EXISTS (
		SELECT job_id
		FROM msdb.dbo.sysjobs_view
		WHERE NAME = @jobname
		)
BEGIN
	DECLARE @jid AS UNIQUEIDENTIFIER

	SELECT @jid = job_id
	FROM msdb.dbo.sysjobs_view
	WHERE NAME = @jobname

	EXEC msdb.dbo.sp_delete_job @job_id = @jid
		,@delete_unused_schedule = 1
END

/****** Object:  Job [PTI_BKP_10AM]    Script Date: 11/09/2015 18:55:48 ******/
BEGIN TRANSACTION

DECLARE @ReturnCode INT

SELECT @ReturnCode = 0

/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/09/2015 18:55:48 ******/
IF NOT EXISTS (
		SELECT NAME
		FROM msdb.dbo.syscategories
		WHERE NAME = N'[Uncategorized (Local)]' AND category_class = 1
		)
BEGIN
	EXEC @ReturnCode = msdb.dbo.sp_add_category @class = N'JOB'
		,@type = N'LOCAL'
		,@name = N'[Uncategorized (Local)]'

	IF (@@ERROR <> 0 OR @ReturnCode <> 0)
		GOTO QuitWithRollback
END

DECLARE @jobId BINARY (16)

EXEC @ReturnCode = msdb.dbo.sp_add_job @job_name = @jobname
	,@enabled = 1
	,@notify_level_eventlog = 0
	,@notify_level_email = 0
	,@notify_level_netsend = 0
	,@notify_level_page = 0
	,@delete_level = 0
	,@description = N'No description available.'
	,@category_name = N'[Uncategorized (Local)]'
	,@owner_login_name = N'sa'
	,@job_id = @jobId OUTPUT

IF (@@ERROR <> 0 OR @ReturnCode <> 0)
	GOTO QuitWithRollback

/****** Object:  Step [1]    Script Date: 11/09/2015 18:55:48 ******/
DECLARE @bkpcommand AS VARCHAR(500)

set @bkpfolderpath= @bkpfolderpath + '\' + @jobname + '.bkp'

SET @bkpcommand = N'BACKUP DATABASE [' + @dbname + '] TO  DISK = N''' + @bkpfolderpath + ''' WITH NOFORMAT, INIT,  NAME = N''' + @dbname + '-Full Database Backup'', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
'

DECLARE @newscheduleid AS UNIQUEIDENTIFIER

SET @newscheduleid = NEWID()

EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @jobId
	,@step_name = N'1'
	,@step_id = 1
	,@cmdexec_success_code = 0
	,@on_success_action = 1
	,@on_success_step_id = 0
	,@on_fail_action = 2
	,@on_fail_step_id = 0
	,@retry_attempts = 0
	,@retry_interval = 0
	,@os_run_priority = 0
	,@subsystem = N'TSQL'
	,@command = @bkpcommand
	,@database_name = N'master'
	,@flags = 0

IF (@@ERROR <> 0 OR @ReturnCode <> 0)
	GOTO QuitWithRollback

EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId
	,@start_step_id = 1

IF (@@ERROR <> 0 OR @ReturnCode <> 0)
	GOTO QuitWithRollback

IF @dailyorhourly='hourly'
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @jobId
	,@name = @jobname
	,@enabled = 1
	,@freq_type = 4
	,@freq_interval = 1
	,@freq_subday_type = 1
	,@freq_subday_interval = 0
	,@freq_relative_interval = 0
	,@freq_recurrence_factor = 0
	,@active_start_date = 20151030
	,@active_end_date = 99991231
	,@active_start_time = @timetorun
	,@active_end_time = 235959
	,@schedule_uid = @newscheduleid
END
ELSE
BEGIN
	EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @jobId
	,@name = @jobname
	,@enabled = 1
	 ,@freq_type=8,
	@freq_interval=@daytorun, 
	@freq_subday_type=1, 
	@freq_subday_interval=0, 
	@freq_relative_interval=0, 
	@freq_recurrence_factor=1, 
	@active_start_date=20151030, 
	@active_end_date=99991231, 
	@active_start_time=@timetorun, 
	@active_end_time=235959 
	,@schedule_uid = @newscheduleid
END

IF (@@ERROR <> 0 OR @ReturnCode <> 0)
	GOTO QuitWithRollback

EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId
	,@server_name = N'(local)'

IF (@@ERROR <> 0 OR @ReturnCode <> 0)
	GOTO QuitWithRollback

COMMIT TRANSACTION

GOTO EndSave

QuitWithRollback:

IF (@@TRANCOUNT > 0)
	ROLLBACK TRANSACTION

EndSave:

GO

