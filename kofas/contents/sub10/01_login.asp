<!--#include file='../../LIB/_headInclude.asp'-->
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
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>로그인폼</title>
 </head>
 <body>
  <div class="section1">
    <div class="Login pdt10 pdb100  mgl0">
      <div class="login-10 row">
        <div class="title5">Login</div>
        <div>구립중림데이케어센터 홈페이지 관리자로그인 페이지입니다.</div>
        <form name="LogFrm" method="post" class="form form-inline" action="/includefiles/global/login_end.asp" onsubmit="return sendit()">
          <div class="cols-100">
            <div class="mgt10 cols-70 f-left ">
              <label for="LogID" class="hidden">아이디</label>
		          <input type="text" name="LogID" id="LogID" maxlength=20  style="width:100%;ime-mode:inactive" class="form-control hid50" placeholder="아이디"  title="아이디" value="<%=UserID%>" />
              <label for="LogPW"  class="hidden">비밀번호</label><input type="password" name="LogPW" id="LogPW" maxlength="100" style="width:100%;ime-mode:inactive"  class="form-control hid50 mgt5"   onkeydown="if(event.keyCode == 13) sendIt();" placeholder="비밀번호" title="비밀번호" value="<%=UserPw%>"/>
            </div>
            <div class="f-left" style="margin:10px 0 0 5px;width:100px" >
              <input type="submit" value="로그인" class="btn btn-warning bold title1" style="height:105px;width:100%;padding:37px 0"/>
            </div>
          </div>
          <input type="hidden" name="secure_code" value="<%=createCSRPToken()%>" />
        </form>
      </div>
      <div class="cols-100 center pdt20">※ 구립중림데이케어센터 홈페이지는 회원가입없이 이용이 가능합니다.</div>
    </div>
  </div>
 <script>
	function sendit(){
	var x = document.LogFrm;
	if (!x.LogID.value){alert("아이디를 입력하세요");x.LogID.focus();return false;}
    if (!x.LogPW.value){alert("비밀번호를 입력하세요");x.LogPW.focus();return false;}
	return ;
}
</script>
 </body>
</html>
