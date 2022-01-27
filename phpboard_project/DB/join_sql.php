<?php
include_once "db_conn.php";

if (mysqli_connect_errno()){
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

function CheckingUser($dbconn, $id, $phone_num){
  $sql = "SELECT * FROM login_member WHERE id = '$id' or phone = '$phone_num'";
  $result = mysqli_query($dbconn, $sql);

  return $result;
}

// 회원등록
 function InsertJoinUser($dbconn, $name, $id, $pw, $birthday, $phone_num, $zipcode, $addr1, $addr2, $selt, $ip){
  $sql = "INSERT INTO login_member values(0, '$name', '$id', password('$pw'), '$birthday', '$phone_num', '$zipcode', '$addr1', '$addr2', '$selt', '$ip', NOW())";
  $result = mysqli_query($dbconn, $sql);

  return $result;
}
?>
