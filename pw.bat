@echo off

set PASSWORD=123456

REM mysql安装目录及mysql程序路径
set MYSQL_HOME=D:\PC_webserver\mysql
set MYSQL_BIN=%MYSQL_HOME%\bin

REM 服务名称
set SERVICE_NAME=mysql

REM 修改配置文件
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


rem 重启服务
call :RESTART "%SERVICE_NAME%"

rem 重置密码
cd /d "%MYSQL_BIN%"
mysql --user=root -e "use mysql; UPDATE user SET Password = Password ( '%PASSWORD%' ) WHERE User = 'root'; flush privileges;"

REM 还原配置文件
del "%OFILE%" && ren "%OFILE%%BFEX%" "%OFN%"

rem 重启服务
call :RESTART "%SERVICE_NAME%"

pause >nul
goto :EOF

:RESTART
net stop %1
net start %1
goto :EOF
