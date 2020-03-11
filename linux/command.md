
cd ..
cd /home/pc32/
cd /home/user/
cd Ubuntu

l
ls
ls -a
ls -al
ls -alrt

mkdir Ubuntu
cd Ubuntu
echo "hello"
echo "hello" > lg.txt

# >가 2개일 경우 내용을 덧붙이게 된다.
echo "hello" >> lg.txt
cat lg2.txt

pwd

cp lg.txt lg2.txt
mv lg.txt ../
cd ..
mv lg.txt Ubuntu/maple.txt
mv ./maple.txt ./maple2.txt

grep -i hello ./*.txt
grep -i hello lg.txt

find /home/pc32/ -name "*.java"
find /home/pc32/ -name "*.java" > javafile.txt

find more /home/pc32/ -name "*.py"
find /home/pc32/ -name "*.py" | more
find more /home/pc32/ -name "*.py" | grep -i fx
find /home/pc32/ -name "*.java" | xargs grep -i fx
find /home/pc32/ -name "*.py" | xargs grep -i python

xeyes
xeyes &

jobs
history
history > myhistory.txt

!
!!

ps
ps -ef
ps -ef | grep -i xeyes

kill 29728
kill -9 20489

cp lg2.txt samsung.txt
cp *.txt ./Test
cp Test

rmdir Test
rm -fr Test

man
man rm

alias
alias rmall='rm -fr'

mkdir Test
cp *.txt ./Test
rmall Test

alias
unalias rmall
alias > keyboard.txt

tar -cvf mytar.tar *.txt
gzip mytar.tar

cd ../
gunzip mytar.tar.gz
tar xvf mytar.tar

cd Ubuntu
tar cvfz mytar.tar.gz *.txt
gunzip mytar.tar.gz

which java
which javac
which python

whereis java
whereis python

whoami
who

sudo apt update
sudo apt upgrade

# 읽기, 쓰기, 실행 권한 수정하기
chmod 700 hobby.txt
chmod 070 keyboard.txt
chmod 007 lg2.txt
chmod 777 myhistory.txt
chmod 277 -----
chmod 477 -----
chmod 644 

7 = rwx
6 = rw
5 = rx
4 = r
3 = wx
2 = w
1 = x

# 루트 권한 바꾸기
sudo chown root:root keyboard.txt

# 작업상 최고 관리자로 계속 업무를 해야하는 경우
sudo su
exit
whoami
ls

# 파일에 적혀있는 명령어를 실행하기
echo "ls -al" > myList
cat myList
source myList
. myList
echo $SHELL

# 명령어를 저장하기
# 현재 디렉토리를 정확하게 알려주지 않으면 찾기가힘들다.
./myList
sudo ln -s /home/pc32/Ubuntu/myList /usr/bin/myList
cat myList >> sansung.txt

# 빈 파일 만들기
touch aaa

# IP확인하기
ifconfig -a

# 하드디스크 사용량
df -H

# 하드디스크 특정 구간 사용량
sudo du -sh /home


# vi 에디터 활용하기
:set number
:set nonumber
:5
:5, 8d
:1, $y

/hello
:1, $s/sss/global
:1, $s/global/match/g

:w
:wq
:wq!

:!ls 