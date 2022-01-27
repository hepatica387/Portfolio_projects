<?php
  session_start();
  include_once "join_sql.php";

  if(empty($_POST['UsernameInput']) || empty($_POST['UseridInput']) || empty($_POST['UserpwInput']) || empty($_POST['UserpwCheckInput']) ||
  empty($_POST['UserBirthYear']) || empty($_POST['UserBirthMon']) || empty($_POST['UserBirthDay']) || empty($_POST['UserPhoneNum1']) ||
  empty($_POST['UserPhoneNum2']) || empty($_POST['UserPhoneNum3']) || empty($_POST['UserZipCode']) || empty($_POST['UserAddr1'])){
    echo "<script>alert('입력되지 않은 정보가 있습니다.')</script>";
    echo("<script>history.back();</script>");
    exit;
  }

  if($_POST['CheckID'] == "false"){
    echo "<script>alert('아이디 중복확인 해주세요.')</script>";
    echo("<script>history.back();</script>");
    exit;
  }

  // 회원가입 폼에서 유저 정보 받은 값
  $name = $_POST['UsernameInput'];
  $id = $_POST['UseridInput'];
  $pw = $_POST['UserpwInput'];
  $pw_check = $_POST['UserpwCheckInput'];

  $birthday = $_POST['UserBirthYear']."-".$_POST['UserBirthMon']."-".$_POST['UserBirthDay'];
  $phone_num = $_POST['UserPhoneNum1'].$_POST['UserPhoneNum2'].$_POST['UserPhoneNum3'];

  $zipcode = $_POST['UserZipCode'];
  $addr1 = $_POST['UserAddr1'];
  $addr2 = $_POST['UserAddr2'];

  $selt = CreateSelt(16);
  $ip = $_SERVER["REMOTE_ADDR"];

  $result = InsertJoinUser($dbconn, $name, $id, $pw, $birthday, $phone_num, $zipcode, $addr1, $addr2, $selt, $ip);

  if($result){
    echo "<script>alert('성공')</script>";
    echo("<script>location.href='../view/login.php';</script>");
    exit;
  }else{
    echo "<script>alert('실패')</script>";
    echo("<script>history.back();</script>");
    // echo("<script>location.href='../view/join.php';</script>");
    exit;
  }

  // 랜덤 16자리 selt생성
  function CreateSelt($length){
     $characters  = "0123456789";
     $characters .= "abcdefghijklmnopqrstuvwxyz";
     $characters .= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

     $string_generated = "";
     $nmr_loops = $length;

     while ($nmr_loops--){
         $string_generated .= $characters[mt_rand(0, strlen($characters) - 1)];
     }

     return $string_generated;
  }
 ?>
