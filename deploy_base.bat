@ECHO OFF
CALL config.bat

REM Deploying all .backup files from LATESTBACKUP folder
FOR %%F IN ("%LATESTBACKUP%\*.backup") DO (
    REM Extract filename
    FOR %%I IN (%%~nF) DO (
        SET DBNAME=%%I
        SET LOGFILE=%DBNAME%_Deploy_%DATETIME%.log
        SET LOGPATHFILE="%LOGPATH%\%DBNAME%\%LOGFILE%"

        REM Log
        ECHO Start deploy for %DBNAME%: %DATETIME% >>%LOGPATHFILE%

        REM Setting PostgreSQL password
        SET PGPASSWORD=%PGPASSWORD%

        REM Restoring database from backup
        ECHO Restoring database %DBNAME% from %%F >>%LOGPATHFILE%
        CALL "%PGBIN%\pg_restore.exe" -h %PGHOST% -U %PGUSER% -d %DBNAME% -v "%%F" 2>>%LOGPATHFILE%
        ECHO Database %DBNAME% restored from %%F >>%LOGPATHFILE%
    )
)

ECHO All databases from backups are restored.
