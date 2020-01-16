Use python selenium module
=====

```python
from selenium import webdriver

url = "http://naver.com/"

# Extract Chrome Driver
browser = webdriver.Chrome('chrome_driver_주소')

# Wait 3 seconds
browser.implicitly_wait(3)

# Read URL
browser.get(url)

# Capture and save screen
browser.save_screenshot("Website.png")

# Quit your browser
browser.quit()
```