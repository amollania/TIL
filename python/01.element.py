# Element Function

# count
# 문자 개수 세아려 주기
a = "hobby"
a.count('b')

# find
# 위치 알려주기
a = "I hate you"
a.find('h')
# 만약 존재하지 않으면 -1 반환

# index
# 마찬가지로 위치를 알려준다.
a = "I hate you, Mr.kim"
a.index('t')
# 결과 : 3

# join
# 문자열 삽입
a="/"
a.join('abcdsf')
# 결과 : 'a/b/c/d/s/f'

# upper
# 소문자를 대문자로 바꾼다.
a="You are here!"
a.upper()
# 결과 : 'YOU ARE HERE!'

# lower
# 반대로 소문자로
a="WHO ARE YOU?"
a.lower()
# 결과 : 'who are you?'

# lstrip
# 왼쪽 공백을 지운다.
a="  Oi"
a.lstrip()
# 결과 : 'Oi'
# 오른쪽 공백 지우는 함수는 rstrip
# 양쪽 공백 지우는 함수는 strip

# replace
# 문자열 바꾸기
a="This is good"
a.replace("good", "not bad")
'This is not bad'

# split
# 문자열 나누기
a="This is good"
a.split()
# 결과 : ['This', 'is', 'good']
# 괄호 안에 아무것도 넣지 않으면 공백을 기준으로 문자열을 나누어 준다.
# 값을 넣으면 값을 기준으로 문자열을 나눈다.
a.split('s')
# 결과 : ['Thi', ' i', ' good']



# Element string formatting

# 숫자로 바로 대입
"Your number is {0}".format(20)
# result
'Your number is 20'

# 문자열 바로 대입
"Your {0} is mine".format("computer")
# result
"Your computer is mine"

# int 변수로 대입
number=352
"Your number is {0}".format(number)
# result
'Your number is 352'

# 2개 이상의 값
number=1977
brand="Daiso"
"He later founded {1} in {0}.".format(number, brand)
# result
'He later founded Daiso in 1977.'

