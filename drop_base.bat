@ECHO OFF
CALL config.bat

REM Dropping each database from the config
FOR %%D IN (%DBS%) DO (
    SET DATETIME=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%
    SET LOGFILE=%%D_Delete_%DATETIME%.log
    SET LOGPATHFILE="%LOGPATH%\%%D\%LOGFILE%"

    REM Logging the start of the deletion process
    ECHO Start delete: %DATETIME% >>%LOGPATHFILE%

    REM Setting PostgreSQL password
    SET PGPASSWORD=%PGPASSWORD%

    REM Drop database
    ECHO Deleting database %%D >>%LOGPATHFILE%
    CALL "%PGBIN%\psql.exe" -h %PGHOST% -U %PGUSER% -c "DROP DATABASE %%D;" 2>>%LOGPATHFILE%
    ECHO Database %%D deleted >>%LOGPATHFILE%
)

ECHO All databases are deleted.
