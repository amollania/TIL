
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
