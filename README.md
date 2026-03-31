
# docker-compose.yml
```
version: '3.8'
services:
  php:
    container_name: php82
    image: xiaohuangtx/php82:latest
    restart: always
    privileged: true
    ports:
      - "9000:9000"
    volumes:
      - "./www:/var/www/html"
      
```
# 已安装扩展
```bash  
[PHP Modules] 
bcmath Core ctype curl date dom fileinfo filter 
ftp gd gettext hash iconv json libxml mbstring mcrypt 
mysqli mysqlnd openssl pcntl pcre PDO 
pdo_mysql pdo_sqlite Phar posix readline redis 
Reflection session shmop SimpleXML soap sockets SPL 
sqlite3 standard sysvsem tokenizer xml xmlreader 
xmlrpc xmlwriter zip zlib  
[Zend Modules]   
```  
