<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<% Call closeDB%>


  <div id="sub_content" class="sub10">
    <div class="cont01">
      <div class="cols-100">
      <div class="login-cont2 ">
	  	<div class="cols-80 pdl20">
			<p><i class="fa fa-check-square-o"></i> 홈페이지 회원을 탈퇴합니다.</p>
			<p><i class="fa fa-check-square-o"></i> 비밀번호를 입력하여 회원검증을 완려해야 합니다.</p>
			<p><i class="fa fa-check-square-o"></i> 브라보 실버 회원이나 청소년 조직화 회원은 관리자에게 문의 바랍니다.</p>
		</div>
      </div>
      	<div class="login-cont1 center">
      		<form name="LogFrm" method="post" class="form form-inline" action="/includefiles/global/login_end.asp" onsubmit="return sendit()">
      			<div class="cols-100 login-cont1-form">
					<div class="login-cont1-txt">
						<label for="LogID" class="left"><i class="fa fa-check-square-o"></i> 회원 탈퇴를 위한 비밀번호를 입력하세요</label>
      					<label for="LogPW"  class="hidden">비밀번호</label>
						<input type="password" name="LogPW" id="LogPW" maxlength="100" style="width:100%;"  class="form-control hid50 mgt5"  tabindex="2" onkeydown="if(event.keyCode == 13) sendIt();" placeholder="비밀번호" title="비밀번호" value="<%=UserPw%>"/>
      				</div>
      				<div class="mgt5 mgl10">
      					<input type="submit" style="font-size:1.2em;padding:15px" value="확인" class="btn btn-warning t500" />
      				</div>
      			</div>
      			<input type="hidden" name="secure_code" value="<%=createCSRPToken()%>" />
      		</form>
      	</div>
      </div>
    </div>
  </div>
<script type="text/javascript">
  $(document).ready(function(){
   // $('#ctID').on('click',function(){
   //   window.open('./?st=sub100&sMenu=01&mode=idpw_find_result&gubun=ID','_self');
   // });
   // $('#ctPW').on('click',function(){
   //   window.open('./?st=sub100&sMenu=01&mode=idpw_find_result&gubun=PW','_self');
   // });
  });
</script>
