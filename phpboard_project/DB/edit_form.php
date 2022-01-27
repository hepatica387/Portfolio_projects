<?php
  //error_reporting(E_ALL);
  //ini_set("display_errors", 1);
  include_once "all_sql.php";

  if(empty($_POST['Titleinput']) && empty($_POST['ContentsForm']))
  {
    echo "<script>alert('채우지 않은 양식이 있습니다.')</script>";
    echo("<script>location.href='../view/edit.php';</script>");
  }

  $board_num = $_POST['boardNum'];
  $title = $_POST['Titleinput'];
  $contents = $_POST['ContentsForm'];


  $result = UpdateList($dbconn, $board_num, $title, $contents);

  if($result){
    echo("<script>alert('수정완료');</script>");
    echo("<script>location.href='../view/boardmain.php';</script>");
  }else{
    echo "error!";
    exit;
  }

  mysqli_close($dbconn);
 ?>
