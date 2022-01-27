<?php
  session_start();
  session_destroy();
  $back = $_SERVER["HTTP_REFERER"];

  header("Location: ".$back);
 ?>
