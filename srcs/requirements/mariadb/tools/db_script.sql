-- Vai executar apenas se não existir enão criar erros
-- IF NOT EXISTS
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'password';
--substituir o mydb pela bd necessária ao wordpress
GRANT ALL PRIVILEGES ON mydb.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
ALTER USER 'root'@'%' IDENTIFIED BY 'password';
