<?php
  include_once "../DB/db_conn.php";

  if(isset($_REQUEST['userid'])){
    $id = $_REQUEST['userid'];
  }else if(isset($_REQUEST['userpw']) && isset($_REQUEST['pw_check'])){
    $pw = $_REQUEST['userpw'];
    $pw_check = $_REQUEST['pw_check'];
  }else{
    echo "error";
  }

  if(isset($id)){
    $sql = "SELECT * FROM login_member where id='$id'";
    $result = mysqli_query($dbconn, $sql);
    $row_num = mysqli_num_rows($result);

    if($row_num <= 0){
      echo "succ";
    }else{
      echo "error";
    }
  }else if(isset($pw) && isset($pw_check)){
    if($pw == $pw_check){
      echo "succ";
    }else{
      echo "error";
    }
  }else{
    echo "error";
  }


 ?>
