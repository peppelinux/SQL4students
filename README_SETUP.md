## TROUBLESHOOTING SECTION:
### THERE ARE THE INSTRUCTION FOR RESOLVE THE FREQUENTLY SETUP ERRORS UNSING SQL:

#### ERROR 1698 OR 1044 OR 1045 (IF YOU HAVE SOME PROBLEM TO CONNECT AS USER: ROOT ON YOUR SQL SERVER (like MariaDB or MySQL)):
````
sudo mysql -u root
use mysql;
update user set plugin='' where User='root';
flush privileges;
exit;
````
