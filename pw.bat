@echo off

REM mysql��װĿ¼��mysql����·��
Set MYSQL_HOME="D:\PC_webserver\mysql"
Set MYSQL="%MYSQL_HOME%\bin\mysql.exe"

REM ��������
Set SERVICE_NAME="mysql" 

echo step 1
echo -------------------------------------
echo ���������ļ���������¼��֤
echo.
echo [mysqld] 
echo ...
echo skip-grant-tables
echo ...

echo.
start /max "" "%MYSQL_HOME%"

pause >nul

echo.
echo step 2
echo -------------------------------------
echo ��������
net stop %SERVICE_NAME%
net start %SERVICE_NAME%

echo step 3
echo -------------------------------------
echo ��¼mysql���������У�ִ��һ�����
echo .
echo USE mysql
echo UPDATE user SET Password = password ( '123456' ) WHERE User = 'root';
echo flush privileges;
echo quit

echo.
%MYSQL% -u root

echo.
echo step 4
echo -------------------------------------
echo ���������ļ���ע��������¼��֤����������
echo.
echo [mysqld] 
echo ...
echo #skip-grant-tables
echo ...

pause >nul
net stop %SERVICE_NAME%
net start %SERVICE_NAME%
