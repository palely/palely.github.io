@echo off

Set MYSQL_HOME="D:\PC_webserver\mysql"
Set MYSQL="%MYSQL_HOME%\bin\mysql.exe"
Set SQL_FILE="sql.txt"

REM ��ȡsql�ļ��е����
REM # �ſ�ʼ���б�����
set sql=
setLocal EnableDelayedExpansion
for /F "eol=# delims=" %%I in ('type %SQL_FILE%') do set sql=!sql!%%I
setLocal DisableDelayedExpansion

REM ��¼��ִ��sql���
%MYSQL% -uroot -p123456 -e "%sql%"
pause >nul
