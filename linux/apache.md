# before Apache Setup
$ sudo apt update

# 우분투 원격저장수(Remote Repository)에 아파치가 있는가 괜히 확인
$ apt-cache search apache2

# Apache Setup
$ sudo apt install apache2
$ sudo service apache2 start
$ sudo service apache2 stop
$ sudo service apache2 restart

# Apache condition
$ ps -ef | grep -i apache2

# ACCESS
브라우저 창에 localhost를 입력

# Apache dir
$ cd /var/www/html/index.html

