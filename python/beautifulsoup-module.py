＃
# 4番繰り返し指定したウェブサイトコンテンツタイトルを持ってくる。

from bs4 import BeautifulSoup
import urllib.request as req

num =1

while num < 5:
    url = "https://jpsk.jp/examination/genre/it.html?page="+str(num)
    res = req.urlopen(url)
    soup = BeautifulSoup(res, "html.parser")

    #모두 선택
    a_list = soup.select("#c_main article.examination .outline a.name")
    f = open("C:\Apache24\htdocs\japan_list.txt", 'a', encoding='UTF8')

    for a in a_list:
        name = a.text
        f.write(name)
    num = num+1
f.close()