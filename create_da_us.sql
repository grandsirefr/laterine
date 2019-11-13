CREATE DATABASE laterine
CHARACTER SET utf8
COLLATE utf8_general_ci;

CREATE USER 'laterine'@'localhost' IDENTIFIED BY 'laterine';

USE mysql;

SELECT User,Host
FROM User
WHERE User ='laterine';

GRANT SELECT, INSERT, UPDATE, DELETE 
ON laterine.*
TO 'laterine'@'localhost';

FLUSH PRIVILEGES;
