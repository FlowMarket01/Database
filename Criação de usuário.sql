CREATE USER 'flowmarket_api'@'%' IDENTIFIED BY '1408Tech!';
SHOW GRANTS FOR 'flowmarket_api'@'%';

GRANT INSERT, SELECT ON usuario TO 'flowmarket_api'@'%';
GRANT INSERT, SELECT ON mercado TO 'flowmarket_api'@'%';
GRANT INSERT, SELECT ON timediff TO 'flowmarket_api'@'%';
GRANT INSERT, SELECT ON caixa TO 'flowmarket_api'@'%';
GRANT USAGE ON flowmarket.* TO 'flowmarket_api'@'%';