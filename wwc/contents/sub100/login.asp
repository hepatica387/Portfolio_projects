<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<% MEMBERKEY		= Request.cookies("MEMBERKEY")
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
  <title>Document</title>
<style>
@media(max-width:767px){
	.cont_body	{position:relative;width:100%;height:369px;background:url('/images/sub06/loginBG.jpg') no-repeat 0 ;background-size:cover; }
	.log_table  {margin:150px auto;}
}
@media (min-width: 768px) {
.cont_body	{position:relative;width:100%;height:369px;background:url('/images/sub06/loginBG.jpg') no-repeat 0 ;background-size:cover;padding-left:350px }
.log_table  {margin:130px auto;}
}
</style>
 </head>
 <body>
  <div id="sub_content">
	<div class="sub-body-content left  ">
		<div style="" class="cont_body m_border_input cols-80 center ">
		<form action="/includefiles/global/login_end.asp" id="frm" name="frm" method="post" onsubmit="return false" class="form-inline" >
			<table class="log_table" summary="로그인 폼">
				<tr>
					<td><label for="LogID"><input type="text" name="LogID" id="LogID" maxlength=20  style="width:180px;ime-mode:inactive" class="form-control " placeholder="아이디" tabindex="1" title="아이디" value="<%=UserID%>" /></label></td>
					<td rowspan="2"><div style="margin:-8px 0 0 5px;"><a href="javascript:;" onclick="sendIt()" tabindex="3" title="로그인" class="btn btn-warning hid80 bold middle" style="padding:25px">로그인</a></div></td>
				</tr>
				<tr>
					<td><label for="LogPW"><input type="password" name="LogPW" id="LogPW" maxlength="100" style="width:180px;ime-mode:inactive"  class="form-control "  tabindex="2" onkeydown="if(event.keyCode == 13) sendIt();" placeholder="비밀번호" title="비밀번호" value="<%=UserPw%>"/></label></td>
				</tr>
				<tr class="">
					<td colspan="2">
						<div class="cols-100 left">
							<input type="checkbox" name="id_save" value="Y"  id="IDSAVE" <%If UserID <> "" Then RW("checked")%>/> <label for="IDSAVE">아이디 저장</label>
							<input type="checkbox" name="simpleLog" value="Y" id="simpleLog" <%If UserPw <> "" Then RW("checked")%>/> <label for="simpleLog">자동로그인</label>
						</div>
						<div class="col-100 left visible-lg visible-md visible-sm">
							<a href="javascript:;" onclick="pwFnd('PW')" class="btn btn-info btn-xs">비밀번호 찾기</a>
							<a href="javascript:;" onclick="pwFnd('ID')" class="btn btn-info btn-xs">아이디 찾기</a>
						</div>
					</td>
				</tr>
			</table>
			<input type="hidden" name="turn_url" value="<%=request.ServerVariables("HTTP_REFERER")%>" />
			<input type="hidden" name="MEMBERKEY" value="<%=MEMBERKEY%>" />
		</form>

		</div>

	</div>
 </div>
 </body>
</html>
<script type="text/javascript">
	function sendIt(){
	var x = document.frm;
	if (!$("#LogID").val()){
		alert("아이디를 입력하세요");
		$("#frm #name").focus();
		return false;
	}
	if (!$("#LogPW").val()){
		alert("비밀번호를 입력하세요");
		$("#frm #LogPW").focus();
		return false;
	}
	x.submit();
	return ;
}

function pwFnd(gubun){
	$(".cont_body").load("../../includefiles/global/idpw_find_result.asp?gubun="+gubun);
}
</script>