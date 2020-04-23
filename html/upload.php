<?php
    $_email = $_GET["te"]; // GET email
    $_title = $_GET["tt"]; // GET title
    $_context = $_GET["tc"]; // GET textarea
    $_mainck = $_GET["ck1"]; // GET check
    $_serveck = $_GET["ck2"]; // GET check

    $myfile = fopen("writed/contact.txt", "a") or die("Unable to open");
    fwrite($myfile, $email."\n");
    fwrite($myfile, $_title."\n");
    fwrite($myfile, "촬영요청".$_mainck."\n");
    fwrite($myfile, "협업요청".$_serveck."\n");
    fwrite($myfile, $_context."\n");
    fwrite($myfile, "------------");
    fclose($myfile);

?>
<script>
    alert("문의 발송완료! \n 문의 답변은 "+"<?=$_email?>" + "로 발송됩니다."
    +"<?=$_mainck ?>" + "<?=$_serveck ?>");
</script>
