C:\Program Files\MySQL\MySQL Server 9.0\

C:\mysql\data1
C:\mysql\data2


my1.ini

[mysqld]
port=3036
basedir="C:/Program Files/MySQL/MySQL Server 9.0"
datadir=C:/mysql/data1

server-id=1

socket=mysql1

log-error=C:/mysql/error1.log

pid-file=C:/mysql/mysql1.pid

my2.ini


[mysqld]
port=3037
basedir="C:/Program Files/MySQL/MySQL Server 9.0"
datadir=C:/mysql/data2

server-id=2

socket=mysql2

log-error=C:/mysql/error2.log

pid-file=C:/mysql/mysql2.pid




<!-- Step 4 -->

mysqld --initialize --defaults-file=C:\mysql\my1.ini
mysqld --initialize --defaults-file=C:\mysql\my2.ini

<!-- Install them as two window service -->
mysqld --install MySQL3036 --defaults-file=C:\mysql\my1.ini
mysqld --install MySQL3037 --defaults-file=C:\mysql\my2.ini


net start MySQL3036
net start MySQL3037