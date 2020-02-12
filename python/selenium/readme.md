Selenium 사용하기
====

리눅스 환경 기준으로 설치 진행
----
먼저 pip 패키지를 통해 selenium 다운로드
$ pip3 install selenium

그리고 사용할 브라우저 환경에 따라 전용 브라우저 다운로드
(여기서는 크롬 헤들리스 사용)

$ sudo apt install linuxbrew-wrapper
$ brew install chromedriver


```python
from selenium import webdriver

driver = webdriver.Chrome() #주소 필요없음

driver.get('https://naver.com')
driver.implicitly_wait(3)
driver.get_screenshot_as_file('navercom.png')

driver.quit()
```