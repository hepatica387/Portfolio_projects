<?php
  include_once "header.php";

  $url = $_SERVER["REQUEST_URI"];

  // echo $url;
  // exit;

  // if(empty($_POST['UserName'])){
  //   echo "<script>alert('로그인이 해주세요.')</script>";
  //   echo("<script>location.href='/view/login.php';</script>");
  //   exit;
  // }

  // if(empty($_POST['uesr_comments'])){
  //   echo "<script>alert('댓글을 입력하지 않았습니다.');</script>";
  //   echo "<script>history.back();</script>";
  //   exit;
  // }

  // $comment = $_POST['uesr_comments'];
  $explode_url = explode("?", $url);
  $comt_ref = explode("&", $explode_url[1]);
  $ref = $comt_ref[0];
  $depth = $comt_ref[1];
  $step = $comt_ref[2];

  if (!isset($explode_url)) {
    echo "<script>alert('잘못된 접근입니다.')</script>";
    echo("<script>history.back(-1)</script>");
    exit;
  }

  // echo $_POST['UserName']."<br>";
  // echo $comment."<br>";
  echo $ref."<br>";
  echo $depth."<br>";
  echo $step;
  exit;

  $sel_comt = UpdtSelComment($dbconn, $comment, $ref);
  $row = mysqli_fetch_array($sel_comt);

  echo "<script>alert('수정됐습니다.')</script>";
  echo("<script>history.back(-1)</script>");
  exit;

?>
