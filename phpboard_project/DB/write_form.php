<?php
  // error_reporting(E_ALL);
  // ini_set("display_errors", 1);
  include_once "login_sql.php";

  if(empty($_POST['UserName'])){
    echo "<script>alert('로그인이 해주세요.')</script>";
    echo("<script>location.href='../view/login.php';</script>");
    exit;
  }

  if(empty($_POST['Titleinput']) || empty($_POST['ContentsForm']))
  {
    echo "<script>alert('채우지 않은 양식이 있습니다.')</script>";
    echo("<script>history.back(-1)</script>");
    exit;
  }

  $user_id = $_POST['UserName'];
  $user_result = SelectUserId($dbconn, $user_id);
  $user_row = mysqli_fetch_array($user_result);

  // 폼 양식 POST방식으로 값을 가져와서 할당
  $title = $_POST['Titleinput'];
  $content = $_POST['ContentsForm'];
  $user_name = $user_row['name'];
  $user_ip = $_SERVER["REMOTE_ADDR"];
  $date = "DEFAULT";
  $view = 0;

  if(!empty($_POST["Ref"])){
    $explode_url = explode("&", $_POST["Ref"]);
    $ref = $explode_url[0];
    $depth = $explode_url[1];
    $step = $explode_url[2];
  }else{
    $ref = 0;
    $depth = 0;
    $step = 0;
  }

  InsertAdd($dbconn, $title, $content, $user_name, $date, $user_ip, $view, $ref, $depth, $step);

  echo "<script>alert('글쓰기 성공')</script>";
  echo("<script>location.href='/view/boardmain.php';</script>");

  mysqli_close($dbconn);
 ?>
