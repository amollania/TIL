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
(http://127.0.0.1/)

# Apache dir
$ cd /var/www/html/index.html

$ ping mail3.nextit.or.kr

$ cd /etc
$ ls h*
$ vi hosts

# localhost 접속 신호 확인하기
$ ping localhost

# 내 아이피 확인하기
$ ifconfig

# Ubuntu 환경변수
$ cd /etc/apache2
$ ls
$ cat envvars

# Localhost 경로 확인하기
$ cd /etc/apache2/sites-enabled
$ ls
$ sudo cp 000-default.conf 000-default-copy.conf
$ vi 000-default.conf
$ ls -al

# Localhost 경로 바꾸기
$ cd /etc/apache2/sites-enabled
$ sudo vi 000-default-copy.conf

# 아파치 conf 설정하기
$ sudo cp apache2.conf apache2.conf_org
$ sudo vi apache2.conf
: set number

```
150번 라인부터 시작하는 아래 실행문 수정
<Directory />
Options Indexes FollowSymLinks
AllowOverride All
Require all granted
</Directory>

<Directory /usr/share>
Options Indexes FollowSymLinks
Require all granted
AllowOverride All
</Directory>

<Directory /var/www/>
Options Indexes FollowSymLinks
AllowOverride All
Require all granted
</Directory>
```

$ sudo service apache2 restart

