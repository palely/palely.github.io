@echo off

Set MYSQL_HOME="D:\PC_webserver\mysql"
Set MYSQL="%MYSQL_HOME%\bin\mysql.exe"
Set SQL_FILE="sql.txt"

REM 读取sql文件中的语句
REM # 号开始的行被忽略
set sql=
setLocal EnableDelayedExpansion
for /F "eol=# delims=" %%I in ('type %SQL_FILE%') do set sql=!sql!%%I
setLocal DisableDelayedExpansion

REM 登录并执行sql语句
%MYSQL% -uroot -p123456 -e "%sql%"
pause >nul
