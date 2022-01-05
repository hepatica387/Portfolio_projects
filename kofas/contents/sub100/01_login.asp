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
 <div class="Login pdt10 pdb100 mgl0 ">
		<div class="cols-100 left">
			<span style="border-top:1px solid #ff8000;" class="pdt3 t500 center title10 t-gray">Login</span>
		</div>
    <div class="login-l center mgt50 ">
        <div>REMIND 홈페이지 로그인 페이지입니다.</div>
        <form name="LogFrm" method="post" class="form form-inline" action="/includefiles/global/login_end.asp" onsubmit="return sendit()">
            <div class="cols-100">
                <div class="mgt10 cols-70 f-left ">
                    <label for="LogID" class="hidden">아이디</label>
					<input type="text" name="LogID" id="LogID" maxlength=20  style="width:100%;ime-mode:inactive" class="form-control hid50" placeholder="아이디" tabindex="1" title="아이디" value="<%=UserID%>" />

                    <label for="LogPW"  class="hidden">비밀번호</label><input type="password" name="LogPW" id="LogPW" maxlength="100" style="width:100%;ime-mode:inactive"  class="form-control hid50 mgt5"  tabindex="2" onkeydown="if(event.keyCode == 13) sendIt();" placeholder="비밀번호" title="비밀번호" value="<%=UserPw%>"/>
                </div>

                <div class="f-left" style="margin:10px 0 0 5px;width:100px" >
                    <input type="submit" value="로그인" class="btn btn-warning bold title1" style="height:105px;width:100%;padding:37px 0"/>
                </div>
            </div>
			 <input type="hidden" name="secure_code" value="<%=createCSRPToken()%>" />
        </form>
    </div>
    <div class="login-r">
        <div class="cols-100 pdt100">
            <div class="cols-100 ">
                 <ul class="all-unstyled">
                    <li class="cols-60 f-left pdt10">아이디를 잃어버리셨나요?</li>
                    <li class="cols-40 f-left"><a href="./?st=sub100&sMenu=01&mode=idpw_find_result&gubun=ID" title="아이디찾기" ><input type="button" class="sx-button center" value="아이디 찾기" /></a></li>
                </ul>
                <ul class="all-unstyled ">
                    <li class="cols-60 f-left pdt15">비밀번호를 잃어버리셨나요?</li>
                    <li class="cols-40 f-left pdt5"><a href="./?st=sub100&sMenu=01&mode=idpw_find_result&gubun=PW" title="비밀번호 찾기" ><input type="button" class="sx-button center" value="비밀번호 찾기" /></a></li>
                </ul>
            </div>
        </div>
    </div>
 </div>
 </body>
</html>
<script type="text/javascript">
	function sendit(){
	var x = document.LogFrm;
	if (!x.LogID.value){alert("아이디를 입력하세요");x.LogID.focus();return false;}
    if (!x.LogPW.value){alert("비밀번호를 입력하세요");x.LogPW.focus();return false;}
	return ;
}
</script>
