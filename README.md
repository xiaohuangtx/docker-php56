
# docker-compose.yml
```
version: '3.8'
services:
  php:
    container_name: php56
    image: xiaohuangtx/php56:latest
    restart: always
    privileged: true
    ports:
      - "9000:9000"
    volumes:
      - "./www:/var/www/html"
      
```
# 已安装扩展
```bash  
root@c130a48ac8a6:/var/www/html# php -m 
[PHP Modules] 
bcmath Core ctype curl date dom ereg fileinfo filter 
ftp gd gettext hash iconv json libxml mbstring mcrypt 
mhash mysql mysqli mysqlnd openssl pcntl pcre PDO 
pdo_mysql pdo_sqlite Phar posix readline redis 
Reflection session shmop SimpleXML soap sockets SPL 
sqlite3 standard sysvsem tokenizer xml xmlreader 
xmlrpc xmlwriter zip zlib  
[Zend Modules]   
```  
