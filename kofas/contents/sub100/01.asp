<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<% MEMBERKEY		= Request.cookies("MEMBERKEY")
   mode             = Request.queryString("mode")
If MEMBERKEY <> "" Then
	strSql = "select A.UserID, A.UserPw from tbl_members A, tbl_UserLog B where A.Seq=B.UserNo and B.UserKey='"&MEMBERKEY&"'"
	strSql = strSql& WhereSql
	arrFlds = DB.execRsList(strSql, DB_CMDTYPE_TEXT, , , 1)
	If Not IsNull(arrFlds) then '회원이 아닐때..
		Userid			= arrFlds(0,0)				' 아이디
		UserPw			= arrFlds(1,0)				' 비번
	End if
Else
	UserID				= Request.Cookies("UserID")
End if
Call closeDB%>

<%
gubun       = Request.queryString("gubun")
mode       = Request.queryString("mode")
if mode = "" then mode  = "login"
if MYID <> "" then mode = "join"
if mode = "" or mode = "login" then
    strTitle        = "Login"
    str_subTitle    = "로그인 안내 페이지입니다."
elseif mode = "join" then
    strTitle        = "Registration"
    str_subTitle    = "회원가입을 하시면 다양한 혜택을 누리실 수 있습니다."
elseif mode = "idpw_find_result" then
    strTitle        = gubun  & " Find"
   str_subTitle    = " 찾을 이름(아이디)과 이메일로 검색합니다."
end if%>
  <section id="sub_content" class="sub10">
    <div class="cont01">
      <div class="login-title black">
        <h2>로그인</h2>
      </div>
      <div class="login-cont2">
        <img src="/images/login-img01.png" alt="" class="cols-100">
      </div>
      	<div class="login-cont1 center">
      		<form name="LogFrm" method="post" class="form form-inline" action="/includefiles/global/login_end.asp" onsubmit="return sendit()">
      			<div class="cols-100 login-cont1-form">
      				<div class="login-cont1-txt">
      					<label for="LogID" class="hidden">아이디</label>
      					<input type="text" name="LogID" id="LogID" maxlength=20  style="width:100%;" class="form-control hid50" placeholder="아이디" tabindex="" title="아이디" value="<%=UserID%>" />
      					<label for="LogPW"  class="hidden">비밀번호</label>
                <input type="password" name="LogPW" id="LogPW" maxlength="100" style="width:100%;"  class="form-control hid50 mgt5"  tabindex="" onkeydown="if(event.keyCode == 13) sendIt();" placeholder="비밀번호" title="비밀번호" value="<%=UserPw%>"/>
      				</div>
      				<div class="login-cont1-btn">
      					<input type="submit" value="로그인" class="btn btn-warning bold title1" />
      				</div>
      			</div>
      			<input type="hidden" name="secure_code" value="<%=createCSRPToken()%>" />
      		</form>
          <a href="javascript:;" onclick="$('.login-cont1').load('/contents/sub100/01_idpw_find_result.asp?gubun=ID')" title="아이디찾기">
            <div class="cont2-1" id="ctID">
              <div class=""><i class="fa fa-search" aria-hidden="true"></i></div>
              <div class="">아이디 찾기</div>
            </div>
          </a>
          <a href="javascript:;" onclick="$('.login-cont1').load('/contents/sub100/01_idpw_find_result.asp?gubun=PW')" title="비밀번호 찾기">
            <div class="cont2-1 mgl20" id="ctPW">
              <div class=""><i class="fa fa-unlock-alt" aria-hidden="true"></i></div>
              <div class="">비밀번호 찾기</div>
            </div>
          </a>
      	</div>
      </div>
    </section>
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
