<?php
  include_once "header.php";

  if(isset($_SESSION['login_succ'])){
    echo("<script>location.href='../view/'</script>");
    exit;
  }

  $date_y = date("Y");
  /*
  넘겨줄 회원정보 변수
  UsernameInput
  UseridInput
  UserpwInput
  UserBirthday
  UserZipCode
  UserAddr1
  UserAddr2
  */
 ?>
 <style media="screen">
  html { width: 100%;}
  body {
    background: #76a5ee;
    background: -moz-linear-gradient(45deg, #76a5ee 0%, #ef788e 100%);
    background: -webkit-linear-gradient(45deg, #76a5ee 0%, #ef788e 100%);
    background: -o-linear-gradient(45deg, #76a5ee 0%, #ef788e 100%);
    background: -ms-linear-gradient(45deg, #76a5ee 0%, #ef788e 100%);
    background: linear-gradient(45deg, #76a5ee 0%, #ef788e 100%);
  }
  input {
    width: 100%;
    margin-bottom: 10px;
    background: rgba(0,0,0,0.3);
    border: none;
    outline: none;
    padding: 10px;
    font-size: 13px;
    color: #fff;
    border: 1px solid rgba(0,0,0,0.3);
    border-radius: 4px;
    box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
    -webkit-transition: box-shadow .5s ease;
    -moz-transition: box-shadow .5s ease;
    -o-transition: box-shadow .5s ease;
    -ms-transition: box-shadow .5s ease;
    transition: box-shadow .5s ease;
  }
  input:focus { box-shadow: inset 0 -5px 45px rgba(100,100,100,0.4), 0 1px 1px rgba(255,255,255,0.2); }
  input::placeholder{opacity: .5 !important;}
  .col-form-label{text-align: left;}
  footer > div > p {color:#fff;}
 </style>

 <div class="container">
   <div class="row">
   <div class="col-md-6 txt-center" style="margin:0 auto;padding-top:7rem;padding-bottom:7rem;">
     <h1 class="white my-5">회원가입</h1>
     <form method="post" action="../DB/join_form.php" id="JoinForm" onsubmit="return CheckSubmit()">
      <div class="form-group row">
        <label for="UsernameInput" class="col-md-3 col-form-label white">이름</label>
        <div class="col-md-9">
          <input type="text" class="form-control m-0" id="UsernameInput" name="UsernameInput" placeholder="이름을 입력하세요.">
        </div>
      </div>
      <div class="form-group row">
        <label for="UseridInput" class="col-md-3 col-form-label white">아이디</label>
        <div class="col-md-7" id="IdCheck">
          <input type="text" class="form-control m-0" id="UseridInput" name="UseridInput" placeholder="아이디를 입력하세요.">
        </div>
        <div class="col-md-2 p-0 txt-left">
          <button type="button" class="btn btn-primary" id="CheckID" style="padding:.4rem;">중복확인</button>
          <input type="hidden" name="CheckID" value="false" style="display:none;">
        </div>
      </div>
      <div class="form-group row">
        <label for="UserpwInput" class="col-md-3 col-form-label white">비밀번호</label>
        <div class="col-md-9">
          <input type="password" class="form-control m-0" id="UserpwInput"name="UserpwInput"  placeholder="비밀번호를 입력하세요.">
        </div>
      </div>
      <div class="form-group row">
        <label for="UserpwCheckInput" class="col-md-3 col-form-label white">비밀번호 확인</label>
        <div class="col-md-9" id="PwCheck">
          <input type="password" class="form-control m-0" id="UserpwCheckInput" name="UserpwCheckInput" placeholder="비밀번호를 입력하세요.">
        </div>
      </div>
      <div class="form-group row">
        <label for="UserBirthday" class="col-md-3 col-form-label white">생일</label>
        <div class="col-md-3">
          <select id="UserBirthYear" class="form-control" name="UserBirthYear">
            <?php for($i=$date_y;$i>=1900;$i--){ ?>
            <option value="<?=$i?>"><?=$i?>년</option>
            <?php } ?>
          </select>
        </div>
        <p class="mt-1 mb-0 p-0 white"></p>
        <div class="col-md-3">
          <select id="UserBirthMon" class="form-control" name="UserBirthMon">
            <?php for($i=1;$i<=12;$i++){ ?>
            <option value="<?=$i?>"><?=$i?>월</option>
            <?php } ?>
          </select>
        </div>
        <div class="col-md-3">
          <select id="UserBirthDay" class="form-control" name="UserBirthDay">
            <?php for($i=1;$i<=31;$i++){ ?>
            <option value="<?=$i?>"><?=$i?>일</option>
            <?php } ?>
          </select>
        </div>
      </div>
      <div class="form-group row">
        <label for="UserPhoneNum2" class="col-md-3 col-form-label white">휴대폰 번호</label>
        <div class="col-md-2">
          <input type="text" class="form-control m-0" id="UserPhoneNum1" name="UserPhoneNum1" maxlength="3">
        </div>
        <p class="mt-1 mb-0 p-0 white">-</p>
        <div class="col-md-2">
          <input type="text" class="form-control m-0" id="UserPhoneNum2" name="UserPhoneNum2" maxlength="4">
        </div>
        <p class="mt-1 mb-0 p-0 white">-</p>
        <div class="col-md-2">
          <input type="text" class="form-control m-0" id="UserPhoneNum3" name="UserPhoneNum3" maxlength="4">
        </div>
      </div>
      <div class="form-group row">
        <label for="UserZipCode" class="col-md-3 col-form-label white">우편번호</label>
        <div class="col-md-4">
          <input type="text" class="form-control m-0" id="UserZipCode" name="UserZipCode" placeholder="우편번호">
        </div>
        <button type="button" class="btn btn-primary" id="BtnZipCode" style="padding: 0 .4rem;">우편번호찾기</button>
      </div>
      <div class="form-group row">
        <label for="UserAddr1" class="col-md-3 col-form-label white">주소</label>
        <div class="col-md-7">
          <input type="text" class="form-control m-0" id="UserAddr1" name="UserAddr1" placeholder="주소">
        </div>
        <button type="button" class="btn btn-primary" id="BtnAddr1" style="padding: 0 .4rem;">주소찾기</button>
      </div>
      <div class="form-group row">
        <label for="UserAddr2" class="col-md-3 col-form-label white">상세주소</label>
        <div class="col-md-9">
          <input type="text" class="form-control m-0" id="UserAddr2" name="UserAddr2" placeholder="상세주소를 입력하세요.">
        </div>
      </div>

      <button type="submit" id="submit" class="btn btn-primary btn-block">회원가입</button>
     </form>
     </div>
   </div>
 </div>

<script type="text/javascript">
  $(document).ready(function(){
    $("#CheckID").on("click",function(){
      if($("#UseridInput").val() == ""){
        alert("아이디를 입력해주세요!");
      }else{
        $.ajax({
          url: '../proc/join_ajax.php',
          type: 'GET',
          data: { 'userid': $("#UseridInput").val() },
          dataType: "text",
          success: function(data){
            if(data != "error"){
              if(!$("#UseridInput").hasClass("is-valid")){
                $("#UseridInput").removeClass("is-invalid");
                $(".invalid-feedback").remove();
                $("#UseridInput").addClass("is-valid");
                $("#IdCheck").append("<div class='valid-feedback'>사용가능한 아이디입니다!</div>");
                $("input[name=CheckID]").val("true");
              }
            }else{
              if(!$("#UseridInput").hasClass("is-invalid")){
                $("#UseridInput").removeClass("is-valid");
                $(".valid-feedback").remove();
                $("#UseridInput").addClass("is-invalid");
                $("#IdCheck").append("<div class='invalid-feedback'>사용불가능한 아이디입니다!</div>");
                $("input[name=CheckID]").val("false");
              }
            }
          },
          error: function(e){
            console.log(e);
          }
        });
      }
    });

    $("#UserpwCheckInput").blur(function(){
      $.ajax({
        url: '../proc/join_ajax.php',
        type: 'GET',
        data: { userpw: $("#UserpwInput").val(), pw_check: $("#UserpwCheckInput").val() },
        dataType: "text",
        success: function(data){
          if(data != "error"){
            if(!$("#UserpwCheckInput").hasClass("is-valid")){
              $("#UserpwCheckInput").removeClass("is-invalid");
              $(".invalid-feedback").remove();
            }
          }else{
            if(!$("#UserpwCheckInput").hasClass("is-invalid")){
              $("#UserpwCheckInput").removeClass("is-valid");
              $(".valid-feedback").remove();
              $("#UserpwCheckInput").addClass("is-invalid");
              $("#PwCheck").append("<div class='invalid-feedback'>비밀번호가 다릅니다!</div>");
            }
          }
        },
        error: function(e){
          console.log(e);
        }
      });
    });

    $("#BtnZipCode").on("click",function(){
      new daum.Postcode({
        oncomplete: function(data) {
          $("#UserZipCode").val(data.zonecode);
          $("#UserAddr1").val(data.address);
        }
      }).open();
    });
    $("#BtnAddr1").on("click",function(){
      new daum.Postcode({
        oncomplete: function(data) {
          $("#UserZipCode").val(data.zonecode);
          $("#UserAddr1").val(data.address);
        }
      }).open();
    });

    $("#UserPhoneNum1").on("keyup",function(){
      if($("#UserPhoneNum1").val().length == 3)
        $("#UserPhoneNum2").focus();
    });
    $("#UserPhoneNum2").on("keyup",function(){
      if($("#UserPhoneNum2").val().length == 4)
        $("#UserPhoneNum3").focus();
    });

    function CheckSubmit(){
      var result = "";

      if($('input[name=CheckID]').val() == "true"){
        result = true;
      }else{
        result = false;
      }

      return result;
    }
  });
</script>

<!-- 다음 주소 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<?php
  include_once "footer.php";
 ?>
