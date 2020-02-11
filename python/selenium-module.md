Use python selenium module
=====

```python
from selenium import webdriver

url = "http://naver.com/"

# Extract Chrome Driver
browser = webdriver.Chrome('Chrome Address')

# Wait 3 seconds
browser.implicitly_wait(3)

# Read URL
browser.get(url)

# Capture and save screen
browser.save_screenshot("Website.png")

# Quit your browser
browser.quit()
