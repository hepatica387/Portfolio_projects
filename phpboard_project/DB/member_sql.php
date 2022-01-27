<?php
include_once "db_conn.php";

if (mysqli_connect_errno()){
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

function SelectUser($dbconn, $id){
  $sql = "SELECT * FROM login_member where id='$id'";
  $result = mysqli_query($dbconn, $sql);

  return $result;
}

?>
