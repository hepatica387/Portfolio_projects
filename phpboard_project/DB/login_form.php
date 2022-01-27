<?php
  session_start();
  include_once "login_sql.php";

  $userId = $_POST['userid'];
  $userPw = $_POST['userpw'];

  $result = SelectLogin($dbconn, $userId, $userPw);
  $row = mysqli_fetch_array($result);
  $result_num = mysqli_num_rows($result);

  if($result_num != 1){
    echo "<script>alert('없는 아이디입니다.');</script>";
    echo("<script>location.href='../view/login.php'</script>");
    exit;
  }

  if($result){
    $_SESSION['login_succ'] = true;
    $_SESSION['user_id'] = $userId;
    $_SESSION['user_name'] = $row['name'];
    echo "<script>history.go(-2);</script>";
    // setcookie("login_success", "success");
    // header("Location: ".$prevPage);
  }else{
    echo "<script>alert('아이디나 비밀번호가 다릅니다.');</script>";
    echo("<script>location.href='../view/login.php'</script>");
    exit;
  }

 ?>
