import cx_Oracle
import os

os.putenv('NLS_LANG', '.UTF8')

# 연결에 필요한 기본 정보 (유저, 비밀번호, 데이터베이스 서버 주소)
connection = cx_Oracle.connect('study', 'study', 'localhost')

cursor = connection.cursor()

cursor.execute("""
    select column_name
   from 학생
   """

   ,
   texting = "테스트"
)

for name in cursor:
   print("테스트 이름 리스트 : ", name)