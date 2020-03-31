<?php
    // echo phpinfo();
    // php에서 변수 선언은 $로 시작, 문자열 더하기는
    // 서버에서 실행
    // test.php 파일이 넘어가는 것이 아니고, 실행결과 값이 넘어간다는 점을 숙지할 것.
    $_name = $_GET["nextId"]; // GET방식으로 값 받기
    echo "<h1>Hello!! Your name ".$_name."</h1>";
?>