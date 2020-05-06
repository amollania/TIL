<?php
// 받아야 할 파라미터
$type = $_GET['type'];
$CKEditor = $_GET['CKEditor'];
$funcNum = $_GET['CKEditorFuncNum'];
 
// 이미지일 경우
if($type == 'image'){
    // 제한하고픈 확장자
    $allowed_extension = array(
      "png","jpg","jpeg","gif"
    );
 
    // 파일 확장자 
    $file_extension = pathinfo($_FILES["upload"]["name"], PATHINFO_EXTENSION);
 
    // 확장자 체크
    if(in_array(strtolower($file_extension),$allowed_extension)){
 
       // 파일 이동
       if(move_uploaded_file($_FILES['upload']['tmp_name'], "uploads/".$_FILES['upload']['name'])){
          // 페이지에 넣을 URL
          $url = "/CKEditor/uploads/".$_FILES['upload']['name'];
          echo '<script>window.parent.CKEDITOR.tools.callFunction('.$funcNum.', "'.$url.'")</script>';
       }
    }
 
    exit;
}
 
// 파일인 경우
if($type == 'file'){
 
    $allowed_extension = array(
       "doc","pdf","docx","csv"
    );
 
    $file_extension = pathinfo($_FILES["upload"]["name"], PATHINFO_EXTENSION);
 
    if(in_array(strtolower($file_extension),$allowed_extension)){
 
       if(move_uploaded_file($_FILES['upload']['tmp_name'], "uploads/".$_FILES['upload']['name'])){
          $url = "/study/study/freeboard/uploads/".$_FILES['upload']['name'];       
          echo '<script>window.parent.CKEDITOR.tools.callFunction('.$funcNum.', "'.$url.'")</script>';
       }
 
    }
 
    exit;
}
?>