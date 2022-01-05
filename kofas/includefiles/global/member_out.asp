<% response.expires=-1000 %>
<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include file="../../includefiles/func/function.auth.asp"-->
<%
If Request.cookies("AUTH_USERKEY") <> "" Then
	valueDate = "loging = 0"
	whereSQl = " where UserNo="&MyNo&" and UserIP = '"& getIp &"' and member_gubun='"&MYDEPART&"'"
	StrSql = "Update tbl_UserLog set "&valueDate & whereSQl
End If
Call closeDb

If MyID = "admin" Then
	Call EndGoTopURL("최고관리자는 회원탈퇴가 불가능합니다.","/")
Else
	Set Crypt	=  New CryptHash
	LogUser_PW	= getRequest("LogPW", REQUEST_POST)
	LogPW		= Crypt.hash(LogUser_PW)
	Set Crypt	= Nothing
	StrSQl              = "select UserPw From tbl_members where Userid='"&MYID&"'"
	User_Pw         = SqlVAlue(strSql, 1)
	RWBR(User_Pw)
	RWBR(LogPW)
	If User_Pw = LogPW Then
		response.cookies("AUTH_USERKEY")			= ""
		response.cookies("AUTH_USERKEY").Expires	=  Date()-1
		Response.cookies("MEMBERKEY")				= ""
		Response.cookies("MEMBERKEY").Expires		= Date()-1
		response.cookies("InstiNo").Expires			=  Date()-1
		session.Contents.RemoveAll()
		session.Abandon
		strSql = "delete from tbl_members where UserId='"&Myid&"'"
		'RW(strSql)

		Call RunSql(strSql, 1)
		Call EndGoTopURL("회원탈퇴가 완료되었습니다.","/")

	Else
		Call EndGoTopURL("비밀번호가 맞지않습니다.","javascript:history.go(-1);")
	End if
End If
Call closeDB%>
