<?php
  include_once "header.php";

  $url = $_SERVER["REQUEST_URI"];

  if (!isset($url)) {
    exit;
  }
  // echo $url;
  // exit;

  $explode_url = explode("?", $url);
  $rowid = $explode_url[1];

  // echo $rowid;
  // exit;

  $result = DelComment($dbconn, $rowid);
  echo "<script>alert('삭제되었습니다.');</script>";
  echo("<script>history.back(-1)</script>");
  exit;

 ?>
