mysqld --initialize --defaults-file=C:\mysql\my1.ini
mysqld --initialize --defaults-file=C:\mysql\my2.ini

# Install them as two window service 
mysqld --install MySQL3036 --defaults-file=C:\mysql\my1.ini
mysqld --install MySQL3037 --defaults-file=C:\mysql\my2.ini


net start MySQL3036
net start MySQL3037