<?php
  include_once "db_conn.php";

  if (mysqli_connect_errno())
  {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

  $rowid = $_POST['rowid'];
  $title = $_POST['title'];
  $content = $_POST['content'];
  $name = $_POST['name'];
  $date = date("Y.m.d h:m:s");

  $sql = "update test_board set title='$title',content='$content',name='$name',date='$date' where rowid = '$rowid'";

  // echo "update test_board set title='$title',content='$content',name='$name',date='$date' where rowid = '$rowid'";
  $result = mysqli_query($dbconn,$sql);

  echo "<script>alert('수정되었습니다.');</script>";
  echo "<script>location.href='../view/index.php';</script>";
 ?>
