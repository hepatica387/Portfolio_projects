<?php
include_once "all_sql.php";

if (mysqli_connect_errno()){
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

// 아이디 검색
function SelectUserId($dbconn, $userid){
  $sql = "SELECT * FROM login_member WHERE id = '$userid'";
  $result = mysqli_query($dbconn, $sql);

  return $result;
}

function SelectLogin($dbconn, $userid, $userpw){
  $sql = "SELECT * FROM login_member WHERE id = '$userid' and pw = password('$userpw')";
  $result = mysqli_query($dbconn, $sql);

  return $result;
}

?>
