#### IF YOU HAVE SOME PROBLEM TO CONNECT AS USER: ROOT ON YOUR SQL SERVER (like MariaDB or MySQL) THERE IS A USEFUL SCRIPT
#### THAT RESOLVES YOUR PROBLEMS (SEE ERROR 1698 OR 1044 OR 1045):
''''

sudo mysql -u root
use mysql;
update user set plugin='' where User='root';
flush privileges;
exit;
''''
