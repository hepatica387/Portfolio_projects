<?php
  include_once "./../view/header.php";

  $url = $_SERVER["REQUEST_URI"];
  $explode_url = explode("?", $url);
  $explode_url[1];
?>
<style media="screen">
  .ftco-navbar-light{
    padding-top:0;
    top:0;
    background: linear-gradient(45deg, #76a5ee 0%, #ef788e 100%) !important;
  }
</style>

 <div class="container" id="wapper">
   <div class="row">
     <?php
      include_once "./sub".$explode_url[1]."/01.php";
     ?>
   </div>
</div>
