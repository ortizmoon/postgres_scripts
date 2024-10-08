@ECHO OFF
CALL config.bat

REM Performing maintenance for each database
FOR %%D IN (%DBS%) DO (
    SET DBLOGPATH=%LOGPATH%\%%D

    REM Creating log
    SET DATETIME=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%
    SET LOGFILE=%%D_%DATETIME%.log
    SET LOGPATHFILE="%DBLOGPATH%\%LOGFILE%"

    REM Start log
    ECHO Start maintenance: %DATETIME% >>%LOGPATHFILE%

    REM Set password for PostgreSQL
    SET PGPASSWORD=%PGPASSWORD%

    REM Performing VACUUM
    ECHO Performing VACUUM for %%D >>%LOGPATHFILE%
    CALL "%PGBIN%\psql.exe" -h %PGHOST% -U %PGUSER% -d %%D -c "VACUUM VERBOSE;" 2>>%LOGPATHFILE%
    ECHO VACUUM completed for %%D >>%LOGPATHFILE%

    REM Performing ANALYZE
    ECHO Performing ANALYZE for %%D >>%LOGPATHFILE%
    CALL "%PGBIN%\psql.exe" -h %PGHOST% -U %PGUSER% -d %%D -c "ANALYZE;" 2>>%LOGPATHFILE%
    ECHO ANALYZE completed for %%D >>%LOGPATHFILE%

    REM Performing REINDEX
    ECHO Performing REINDEX for %%D >>%LOGPATHFILE%
    CALL "%PGBIN%\psql.exe" -h %PGHOST% -U %PGUSER% -d %%D -c "REINDEX DATABASE %%D;" 2>>%LOGPATHFILE%
    ECHO REINDEX completed for %%D >>%LOGPATHFILE%
)

ECHO All maintenance tasks are completed.