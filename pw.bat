@echo off

REM mysql安装目录及mysql程序路径
Set MYSQL_HOME="D:\PC_webserver\mysql"
Set MYSQL="%MYSQL_HOME%\bin\mysql.exe"

REM 服务名称
Set SERVICE_NAME="mysql" 

echo step 1
echo -------------------------------------
echo 设置配置文件，跳过登录验证
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
echo 重启服务
net stop %SERVICE_NAME%
net start %SERVICE_NAME%

echo step 3
echo -------------------------------------
echo 等录mysql管理命令行，执行一下语句
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
echo 设置配置文件，注释跳过登录验证，重启服务
echo.
echo [mysqld] 
echo ...
echo #skip-grant-tables
echo ...

pause >nul
net stop %SERVICE_NAME%
net start %SERVICE_NAME%
