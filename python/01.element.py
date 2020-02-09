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
# 'Your number is 20'

# 문자열 바로 대입
"Your {0} is mine".format("computer")
# "Your computer is mine"

# int 변수로 대입
number=352
"Your number is {0}".format(number)
# 'Your number is 352'

# 2개 이상의 값
number=1977
brand="Daiso"
"He later founded {1} in {0}.".format(number, brand)
# 'He later founded Daiso in 1977.'

# 변수 이름으로 쓰기
"He later founded {number} in {brand}.".format(number=1977, brand="Daiso")

# 정렬
"{0:<10}".format("python")
"{0:<10}".format("python")
"{0:^10}".format("python")
# result
'python    '
'    python'
'  python  '

# 공백 채우기
"{0:=^10}".format("python")
"{0:!^10}".format("python")
'==python=='
'!!python!!'

# 소수점 표현
x = 3.241234
"{0:0.4f}".format(x) # '3.2412'



# 리스트 자료형

head = [1, 6, 5, 4, 3, 2]
head[1] # 6

head = [1, 2, ['a', 'b', ['star', 'craft']]]
head[2][2][1] # 'craft'

head=[1,2,3,4,5,6,7]
head[0:3] #head[:3] # [1, 2, 3]

head2 = [8,9,10]
head+head2 # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# 리스트 삭제
head=[1,2,3,4,5,6,7]
head[1:3] =[] #2,3 # [1, 4, 5, 6, 7]

# 삭제 함수
del head[2] # [1, 4, 6, 7]

# 추가 함수
head.append(3)
head.append([4, 6])
# [1, 4, 6, 7, 3]
# [1, 4, 6, 7, 3, [4, 6]]

# 정렬 함수 (문자도 가능)
head=[1,2,5,6,7,3,4]
head.sort() # [1, 2, 3, 4, 5, 6, 7]

head.reverse() # [7, 6, 5, 4, 3, 2, 1]

# 위치 반환(index)
head.index(4) # 3
head.index(7) # 0
# 값이 존재하지 않으면 오류 반환

# 리스트 삽입
head.insert(0, 8) # [8 ,7, 6, 5, 4, 3, 2, 1]

# 리스트 삭제 : 중복된 값일 경우 리스트에 존재하는 첫번째 값을 삭제
head.remove(4) # [7, 6, 5, 3, 2, 1]

# 리스트 요소 끄집어 내기
head = [1,2,3,5]
head.pop() # 5 #head [1, 2, 3]
head.pop(1) # 2 #head [1, 3]

# 리스트에 포함된 요소 세기
head = [1,2,3,4,3,2,3,2,3]
head.count(3) # 4

# 리스트 확장
head = [4, 2, 1]
head.extend([3,4,5,6]) # [4, 2, 1, 3, 4, 5, 6]



# 튜플 자료형

# 튜플은 상수와 같이 배열의 값을 바꿀 수 없다.
text = (1, 2, 'a', 'b')
text[0] # 1
text[:] # (1, 2, 'a', 'b')

text2 = (4, 5)
text + text2
(1, 2, 'a', 'b', 4, 5)

text *2 # (1, 2, 'a', 'b', 1, 2, 'a', 'b')



# 딕셔너리
# {Key1:Value1, Key2:Value2, Key3:Value3 ...}

dir = {'name':'mei', 'number':'52', 'hobby':'computer'}
# {'name': 'mei', 'number': '52', 'hobby': 'computer'}

dir['name']= 'pey'
# {'name': 'pey', 'number': '52', 'hobby': 'computer'}

dir['name2']= 'mei'
# {'name': 'pey', 'number': '52', 'hobby': 'computer', 'name2': 'mei'}

# 딕셔너리 삭제하기(키 포함)
del dir['name']
# {'number': '52', 'hobby': 'computer', 'name2': 'mei'}

dir['name2'] # mei



# 딕셔너리 관련 함수

# keys
# 키값 가져오기
dir.keys() # dict_keys(['number', 'hobby', 'name2'])
a =list(dir.keys()) # ['number', 'hobby', 'name2']
a[1] # 'hobby'

# 또 다른 방법 for문
for i in dir.keys():
    print(i)

# value
# 딕셔너리 결과값만 가져오기
dir.values() # dict_values(['52', 'computer', 'mei'])

# items
# 키값, 결과값 튜플형태로 가져오기
dir.items() # dict_items([('number', '52'), ('hobby', 'computer'), ('name2', 'mei')])

# clear
# 키값, 결과값 모두 지우기
dir.clear()
dir # {}

# get
# 키값으로 결과값 얻기
dir = {'name':'mei', 'number':'52', 'hobby':'computer'}
dir.get('number') # 52
# 값이 없을 경우 None를 리턴

# 기타 해당 딕셔너리 안에 키가 있는지 조사하기
'name' in dir # True
'programs' in dir # False



# 집합 자료형

# 집합 자료형 생성
here = set([1,2,3,4])
here # {1, 2, 3, 4}

here2 = set("Python PP")
here2 # {'o', 'n', 'y', 'h', 't', 'P'}

# 튜플, 리스트로 변환
s1 = list(here)
# ['o', 'n', 'y', 'h', 't', 'P']

s2 = tuple(here)
# ('o', 'n', 'y', 'h', 't', 'P')

# 교집합, 합집합, 차집합 구하기
num1 = set([1,2,3,4,5])
num2 = set([4,5,6,7,8,9])
# 교집합
num1 & num2 # {4, 5}
# 합집합
num1 | num2 # {1, 2, 3, 4, 5, 6, 7, 8, 9}
num1.union(num2) # {1, 2, 3, 4, 5, 6, 7, 8, 9}
# 차집합
num1 - num2 # {1, 2, 3}
num2 - num1 # {8, 9, 6, 7}
num1.difference(num2) # {1, 2, 3}
num2.difference(num1) # {8, 9, 6, 7}

# 집합 자료형 관련 함수
# 값 1개 추가
num1 = set([1,2,3,4])
num1.add(5) # {1, 2, 3, 4, 5}

# 값 여러개 추가와 삭제
num1 = set([1,2,3,4])
num1.update([5,6,7,8]) # {1, 2, 3, 4, 5, 6, 7, 8}
num1.remove(4) # {1, 2, 3, 5, 6, 7, 8}



# 자료형의 참과 거짓
num1 = set([1,2,3,4])
while num1:
    num1.pop() # 1 2 3 4



# 리스트 num2로 복사하기
num1 = [2,3,5]
num2 = num1[:]

# Copy 모듈을 이용
from copy import copy
c = copy(num1)