<% response.expires=-1000 %>
<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include file="popup_head.asp"-->
<%
userID		= getRequest("userID", REQUEST_POST)
userNM		= getRequest("userNM", REQUEST_POST)
to_mail		= getRequest("to_mail", REQUEST_POST)
gubun		= getRequest("gubun", REQUEST_POST)
st			= getRequest("st", REQUEST_POST)
sMenu		= getRequest("sMenu", REQUEST_POST)

'RW(Request.form)
'response.end

If gubun = "ID" Then
	strSql	= "select UserID from Tbl_members"
	strSql	= strSQl & " where User_NM = '"&userNM&"' and UserEmail='"&to_mail&"'"
	'RW(strSql)
	User_ID = SqlValue(strSql, 1)
	If Not IsNull(User_ID) Then
		Fnd_value = "조회하신 회원 정보가 존재합니다.<br/>아이디는 <span class='title2 t500 t-info'>"&User_ID&"</span> 입니다."
	else
		Fnd_value = "요청하신 회원정보가 존재하지 않습니다."
	End If
Else
	strSql	= "select count(seq) from Tbl_members"
	strSql	= strSQl & " where UserID = '"&LCase(Replace(userID,"'",""))&"' and UserEmail='"&to_mail&"'"
	memCnt = SqlValue(strSql, 1)
	'RW(strSql)
	randomize
	pwd = hex(int(rnd(1)*1000000000))
	If memCnt > 0 Then
	Set Crypt	=  New CryptHash
		Set Crypt	=  New CryptHash
			UserPw	= Crypt.hash(pwd)
		Set Crypt = Nothing
		strSql = "update Tbl_members set UserPw	='"&UserPw&"' where Userid = '"&LCase(Replace(userID,"'",""))&"' and UserEmail='"&to_mail&"'"
		Call RunSql(strSQl, 1)
		Fnd_value = "임시 비밀번호가 발급되었습니다.<br/> 비밀번호는 <span class='title2 bold t-info'>"&pwd&"</span> 입니다."
	Else
		Fnd_value = "요청하신 회원정보가 존재하지 않습니다."
	End If
End If
call CloseDB%>
 <div class="rows bg-mute cols-100" style="height:300px">
	<table class="table bg-default">
		<tr>
			<td colspan="2"><img src="/images/navi/logo.png" class="" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="cols-100 center pdt40 title1 pdb40"><%=Fnd_value%></div>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="bg-mute ">
				<div class="cols-100 right mgt5">
					<a href="javascript:;" onclick="parent.$('#haedal').hide();parent.location.href='/sub100/01'" class="btn btn-warning">로그인</a>
					<a href="javascript:;" onclick="parent.$('#haedal').hide();location.href='/includefiles/html/blank.asp';//parent.location.href='/contents/?st=sub100&sMenu=01'" class="btn btn-info">닫기</a>

					</div>
			</td>
		</tr>
	</table>

 </div>
<!--#include file="./global_foot.asp"-->
<script type="text/javascript">
	var x = parent.document.idFind;
	 <%if gubun = "PW" then%>
	  x.userID.value = "";
	<%else%>
	  x.userNM.value = "";
	<%end if%>
	  x.to_mail.value = "";
</script>
