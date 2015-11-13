USE msdb
-- daily
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','daily', 000000, 1  -- Sun 12
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','daily', 000000, 2  -- MON 12
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','daily', 000000, 4  -- Tue 12
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','daily', 000000, 8  -- Wed 12 
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','daily', 000000, 16  -- THu 12
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','daily', 000000, 32  -- FRI 12
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','daily', 000000, 64  -- Sat 12
				   
-- hourly		   
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','hourly', 100000, 0  -- 10 AM
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','hourly', 120000, 0  -- 12 PM
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','hourly', 140000, 0  -- 02 PM
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','hourly', 160000, 0  -- 04 PM
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','hourly', 180000, 0  -- 06 PM
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','hourly', 200000, 0  -- 08 PM
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','hourly', 220000, 0  -- 10 PM
Exec CreateBkpJob 'CalcuQuote_Caltronics', 'D:\DBBackup','hourly', 000000, 0  -- 12 AM

--CalcuQuote_EMINC

Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','daily', 000000, 1  -- Sun 12
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','daily', 000000, 2  -- MON 12
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','daily', 000000, 4  -- Tue 12
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','daily', 000000, 8  -- Wed 12 
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','daily', 000000, 16  -- THu 12
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','daily', 000000, 32  -- FRI 12
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','daily', 000000, 64  -- Sat 12
				   
-- hourly		   
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','hourly', 100000, 0  -- 10 AM
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','hourly', 120000, 0  -- 12 PM
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','hourly', 140000, 0  -- 02 PM
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','hourly', 160000, 0  -- 04 PM
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','hourly', 180000, 0  -- 06 PM
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','hourly', 200000, 0  -- 08 PM
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','hourly', 220000, 0  -- 10 PM
Exec CreateBkpJob 'CalcuQuote_EMINC', 'D:\DBBackup','hourly', 000000, 0  -- 12 AM

--CalcuQuote_IPS

Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','daily', 000000, 1  -- Sun 12
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','daily', 000000, 2  -- MON 12
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','daily', 000000, 4  -- Tue 12
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','daily', 000000, 8  -- Wed 12 
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','daily', 000000, 16  -- THu 12
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','daily', 000000, 32  -- FRI 12
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','daily', 000000, 64  -- Sat 12
				   
-- hourly		   
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','hourly', 100000, 0  -- 10 AM
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','hourly', 120000, 0  -- 12 PM
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','hourly', 140000, 0  -- 02 PM
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','hourly', 160000, 0  -- 04 PM
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','hourly', 180000, 0  -- 06 PM
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','hourly', 200000, 0  -- 08 PM
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','hourly', 220000, 0  -- 10 PM
Exec CreateBkpJob 'CalcuQuote_IPS', 'D:\DBBackup','hourly', 000000, 0  -- 12 AM

--CalcuQuote_proactiveng

Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','daily', 000000, 1  -- Sun 12
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','daily', 000000, 2  -- MON 12
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','daily', 000000, 4  -- Tue 12
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','daily', 000000, 8  -- Wed 12 
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','daily', 000000, 16  -- THu 12
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','daily', 000000, 32  -- FRI 12
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','daily', 000000, 64  -- Sat 12
				   
-- hourly		   
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','hourly', 100000, 0  -- 10 AM
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','hourly', 120000, 0  -- 12 PM
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','hourly', 140000, 0  -- 02 PM
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','hourly', 160000, 0  -- 04 PM
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','hourly', 180000, 0  -- 06 PM
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','hourly', 200000, 0  -- 08 PM
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','hourly', 220000, 0  -- 10 PM
Exec CreateBkpJob 'CalcuQuote_proactiveng', 'D:\DBBackup','hourly', 000000, 0  -- 12 AM

--CalcuQuote_TeamMfg


Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','daily', 000000, 1  -- Sun 12
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','daily', 000000, 2  -- MON 12
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','daily', 000000, 4  -- Tue 12
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','daily', 000000, 8  -- Wed 12 
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','daily', 000000, 16  -- THu 12
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','daily', 000000, 32  -- FRI 12
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','daily', 000000, 64  -- Sat 12
				   
-- hourly		   
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','hourly', 100000, 0  -- 10 AM
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','hourly', 120000, 0  -- 12 PM
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','hourly', 140000, 0  -- 02 PM
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','hourly', 160000, 0  -- 04 PM
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','hourly', 180000, 0  -- 06 PM
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','hourly', 200000, 0  -- 08 PM
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','hourly', 220000, 0  -- 10 PM
Exec CreateBkpJob 'CalcuQuote_TeamMfg', 'D:\DBBackup','hourly', 000000, 0  -- 12 AM