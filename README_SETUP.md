## Common Setup of a generic DB with privileged user

First modifiy "export" variables to your needs:
````
export USER='sqlstudent'
export PASS='sqlstudentpassw'
export HOST='%'
export DB='sqlstudentdb'

sudo mysql -u root -e "\
CREATE USER ${USER}@'${HOST}' IDENTIFIED BY '${PASS}';\
CREATE DATABASE ${DB} CHARACTER SET utf8 COLLATE utf8_general_ci;\
GRANT ALL PRIVILEGES ON ${DB}.* TO ${USER}@'${HOST}';"
````

## TROUBLESHOOTING SECTION:

#### ERROR 1698 OR 1044 OR 1045 (IF YOU HAVE SOME PROBLEM TO CONNECT AS USER: ROOT ON YOUR SQL SERVER (like MariaDB or MySQL)):
````
sudo mysql -u root
use mysql;
update user set plugin='' where User='root';
flush privileges;
exit;
````
