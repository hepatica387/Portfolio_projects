<?php
  // error_reporting(E_ALL);
  // ini_set("display_errors", 1);
  include_once "all_sql.php";

  $url = $_SERVER["HTTP_REFERER"];    // 이전주소

  // if(empty($_SESSION['user_name'])){
  //   echo "<script>alert('로그인이 해주세요.')</script>";
  //   echo("<script>location.href='/view/login.php';</script>");
  //   exit;
  // }

  if(empty($_POST['uesr_comments'])){
    echo "<script>alert('댓글을 입력하지 않았습니다.');</script>";
    echo "<script>history.back();</script>";
    exit;
  }

  if(!empty($_POST['list_info'])){
    $list_info = explode('&' ,$_POST['list_info']);

    $list_num = $list_info[0];
    $user_id = $list_info[1];
    $user_name = $list_info[2];

    if(isset($list_info[3]))
      $rowid = $list_info[3];

    if(isset($_POST['comt_type']))
      $comt_type = $_POST['comt_type'];
    else
      $comt_type = '';

    $comment = $_POST['uesr_comments'];
    $user_ip = $_SERVER["REMOTE_ADDR"];

    if(isset($_POST['comt_rds'])){
      $rds = explode('&', $_POST['comt_rds']);
      $ref = $rds[0];
      $depth = $rds[1];
      $step = $rds[2];
    }else{
      $ref = 0;
      $depth = 0;
      $step = 0;
    }

    // echo $list_num."<br>";
    // echo $user_id."<br>";
    // echo $user_name."<br>";
    // echo $rowid."<br>";
    // echo $comt_type."<br>";
    // echo $comment."<br>";
    // echo $user_ip."<br>";
    // echo $ref."<br>";
    // echo $depth."<br>";
    // echo $step;
    // exit;

    if($comt_type == '' || $comt_type == 'comt')
      InsertComments($dbconn, $list_num, $user_id, $user_name, $comment, $user_ip, $ref, $depth, $step);
    else if($comt_type == 'updt')
      UpdtSelComment($dbconn, $rowid, $comment);

    echo("<script>location.href='$url';</script>");

  }else{
    echo "error";
    echo "<script>console.log('error');</script>";
    exit;
  }


?>
