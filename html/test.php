<?php
    // echo phpinfo();
    // php에서 변수 선언은 $로 시작, 문자열 더하기는
    // 서버에서 실행
    // test.php 파일이 넘어가는 것이 아니고, 실행결과 값이 넘어간다는 점을 숙지할 것.
    $_name = $_GET["nextId"]; // GET방식으로 값 받기
    echo "<h1>Hello!! Your name ".$_name."</h1>";
    // echo 는 out.print에 해당한다.
  
    // 한 페이지 내에 서버에서 실행되는 부분이 먼저 실행되고,
    // 그 결과값이 넣어진 문자열 전체가 클라이언트 쪽으로 넘어가서 문자열이
    // 브라우져에서 위에서 아래로 다시 해석된다.
    // 곧 페이지 내에 서버에서 실행되는 곳과 클라이언트에서 실행되는 것이 짬뽕
?>
<script>
    alert("안녕하세요!"+"<?=$_name?>"+ " Hong " );
</script>