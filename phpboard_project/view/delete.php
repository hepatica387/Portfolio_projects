<?php
  include_once "header.php";

  $url = $_SERVER["REQUEST_URI"];

  if (!isset($url)) {
    exit;
  }
  // echo $url;
  // exit;

  $explode_url = explode("?", $url);
  $board_explode = explode("&", $explode_url[1]);
  $page = $board_explode[0];
  $rowid = $board_explode[1];

  // echo $page;
  // echo $rowid;
  // exit;

  // echo "<script>
  //   if(confirm('정말 삭제하시겠습니까?') != false){
  //     alert('삭제되었습니다.');
  //     location.href='boardmain.php';
  //   }else{
  //     history.back(-1);
  //   }
  // </script>";

  if($page != "dvcmt"){
    $result = DeleteWrite($dbconn, $rowid);
    echo "<script>alert('삭제되었습니다.');location.href='boardmain.php';</script>";
  }else{
    $result = DelComment($dbconn, $rowid);
    echo "<script>alert('삭제되었습니다.');history.back(-1);</script>";
  }

 ?>
