ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

CREATE USER 'magento'@'localhost' IDENTIFIED BY 'password';
CREATE DATABASE magento;
GRANT ALL PRIVILEGES on magento.* to 'magento'@'localhost';
FLUSH PRIVILEGES;
