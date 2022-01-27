<?php
  include_once "header.php";
 ?>
<link rel="stylesheet" href="/assets/css/login.css">

<div class="container" id="wapper">
 <div class="row">
   <div class="col-md-4 txt-center" style="margin:0 auto;padding-top:7rem;padding-bottom:7rem;">
     <h1 class="white my-5">로그인</h1>
     <form method="post" action="/DB/login_form.php">
       <input type="text" name="userid" placeholder="아이디를 입력하세요"/>
       <input type="password" name="userpw" placeholder="비밀번호를 입력하세요" />
       <button type="submit" class="btn btn-primary btn-block">로그인</button>
     </form>
     <p class="mt-3"><a href="/view/join.php">회원가입</a></p>
     <p class="mt-3"><a href="javascript:void(0);">아이디/비밀번호를 잊어버렸습니까?</a></p>
   </div>
 </div>
</div>

<?php
  include_once "footer.php";
 ?>
