if [ `ls /var/lib/mysql/unity | wc -l` -le "1" ]; then
echo "Importing database"
cp -vr /backup/mysql /var/lib
chown -R mysql:mysql /var/lib/mysql
else
chown -R mysql:mysql /var/lib/mysql
fi
/usr/bin/mysqld_safe --datadir=/var/lib/mysql --socket=/var/lib/mysql/mysql.sock  --pid-file=/var/run/mysqld/mysqld.pid --basedir=/usr --user=mysql 
