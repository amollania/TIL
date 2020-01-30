Git 아이디 패스워드 입력 안하는 방법
====

$ git config가 자주 사용되는 부분
보통 사용자 이름과 이메일을 등록할 경우 git config를 가장 많이 사용됩니다. 아래는 사용자 이름, 이메일을 등록하는 방법입니다. 이처럼 등록해두면 commit 수행시 등록된 사용자의 정보가 업데이트되어 반영될 것입니다.
```
$ git config --global user.name "이름"
$ git config --global user.email 이메일@webisfree.com
```
각각 이름, 이메일 등록 방법입니다.


아래는 매번 입력해야 하는 인증을 캐시에 저장하여 일정시간동안 입력하지 않는 방법입니다.
```
$ git config credential.helper store
```

이제 새롭게 git 명령어를 입력해봅니다. 아직 저장된  credential 정보가 없으므로 아래처럼 패스워드 및 아이디 입력창이 나타나는데 입력하도록 합니다.
Username for 'myRepo':
Password for 'myRepo':

계정을 입력한 후에는 정보가 서버에 저장되어 입력하지 않아도 됩니다. 이때 만료 시간을 입력하기 위해서 아래의 커맨드를 추가로 입력합니다.
```
$ git config --global credential.helper 'cache --timeout 7200'
```

timeout 뒤의 숫자는 초(second)입니다. 여기서는 7200만큼(2시간)의 만료시간을 추가했습니다. 시간이 지나면 당연히 다시 아이디, 패스워드 입력이 필요하게 됩니다.

```
1 day - 86,400
7 days - 604,800
30 days - 2,592,000
```
