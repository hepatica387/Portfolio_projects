<?php
  session_start();

  $link = $_SERVER["DOCUMENT_ROOT"];      // 절대주소
  $url = $_SERVER["REQUEST_URI"];         // 현재주소

?>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,700,800" rel="stylesheet">
    <title>PHP Board Project - IMJS</title>
    <script type="text/javascript" src="/assets/jquery/jquery-3.5.1.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/assets/css/style.css" type="text/css">
    <link rel="stylesheet" href="/assets/css/style-1.css" type="text/css">
  </head>

<?php
  include_once "main_nav.php";
 ?>
