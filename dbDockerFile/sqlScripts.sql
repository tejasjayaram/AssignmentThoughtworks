CREATE USER 'wiki'@'localhost' IDENTIFIED BY 'THISpasswordSHOULDbeCHANGED';
CREATE DATABASE wikidatabase;  
GRANT ALL PRIVILEGES ON wikidatabase.* TO 'wiki'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'wiki'@'localhost';
exit