@ECHO OFF
CALL config.bat

REM Creating dumps for each database
FOR %%D IN (%DBS%) DO (
    SET BACKPATH=%BACKUPPATH%\%%D

    REM Creating backup file name
    SET DATETIME=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%_%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%
    SET DNAME=%%D_%DATETIME%
    SET DUMPFILE=%DNAME%.backup
    SET LOGFILE=%DNAME%.log
    SET DUMPPATHFILE="%BACKPATH%\%DUMPFILE%"
    SET LOGPATHFILE="%BACKPATH%\%LOGFILE%"
    SET BACKFILE="%BACKPATH%\%DNAME%.7z"

    REM Logging the start of the process
    ECHO Start dump: %DATETIME% >>%LOGPATHFILE%

    REM Creating the dump
    CALL "%PGBIN%\pg_dump.exe" --format=c --verbose --file=%DUMPPATHFILE% 2>>%LOGPATHFILE%
    ECHO Dump creation attempted for %%D >>%LOGPATHFILE%

    REM Compressing the dump
    CALL "%ZIPPATH%\7z.exe" a %BACKFILE% %DUMPPATHFILE% -mmt=on >>%LOGPATHFILE%
    ECHO Compression attempted for %%D >>%LOGPATHFILE%

    REM Deleting the uncompressed dump file
    DEL %DUMPPATHFILE% /F /Q
    ECHO Deleted uncompressed dump file for %%D >>%LOGPATHFILE%
)

ECHO All dumps are completed.