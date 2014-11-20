@echo off

set PASSWORD=123456

REM mysql��װĿ¼��mysql����·��
set MYSQL_HOME=D:\PC_webserver\mysql
set MYSQL_BIN=%MYSQL_HOME%\bin

REM ��������
set SERVICE_NAME=mysql

REM �޸������ļ�
set OFILE=%MYSQL_HOME%\my.ini
set TFILE=%MYSQL_HOME%\tmp_my.ini
set BFEX=.back

if not exist "%OFILE%" (
	echo not find %OFILE%
	pause >nul
	goto :EOF
)

for /F %%I in ("%OFILE%") do set OFN=%%~nI%%~xI

set /p a=<nul >"%TFILE%"

for /F "eol=# delims=" %%I in ('type "%OFILE%"') do (
	echo %%I >>"%TFILE%"
	if "%%I" == "[mysqld]" echo skip-grant-tables >>"%TFILE%"
)

copy "%OFILE%" "%OFILE%%BFEX%" >nul && del "%OFILE%" && ren "%TFILE%" "%OFN%"

if exist "%OFILE%%BFEX%" (
	echo alter my.ini ok
) else (
	echo alter my.ini no
)


rem ��������
call :RESTART "%SERVICE_NAME%"

rem ��������
cd /d "%MYSQL_BIN%"
mysql --user=root -e "use mysql; UPDATE user SET Password = Password ( '%PASSWORD%' ) WHERE User = 'root'; flush privileges;"

REM ��ԭ�����ļ�
del "%OFILE%" && ren "%OFILE%%BFEX%" "%OFN%"

rem ��������
call :RESTART "%SERVICE_NAME%"

pause >nul
goto :EOF

:RESTART
net stop %1
net start %1
goto :EOF
