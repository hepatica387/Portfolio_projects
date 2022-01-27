<?php
  include_once $link."/DB/all_sql.php";
  include_once $link."/DB/member_sql.php";
 ?>
  <body>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="/">IMJS</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>
      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <!-- <li class="nav-item active"><a href="/" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="/contents/?01" class="nav-link">About</a></li>
          <li class="nav-item"><a href="/contents/?02" class="nav-link">Services</a></li>
          <li class="nav-item"><a href="/contents/?03" class="nav-link">Contact</a></li> -->
          <?php if(isset($_SESSION['login_succ'])) :?>
          <li class="nav-item">
            <a class="nav-link" href="/view/logout.php">Logout</a>
          </li>
          <li class="nav-item">
            <p class="nav-link m-0"><?=$_SESSION['user_name']?>님 환영합니다.</p>
          </li>
          <?php else :?>
          <li class="nav-item">
            <a class="nav-link" href="/view/login.php">Login</a>
          </li>
          <?php endif;?>
        </ul>
      </div>
    </div>
  </nav>
