<% response.expires=-1000 %>
<!--#include file='../../LIB/_headInclude.asp'-->
<%
If Request.cookies("AUTH_USERKEY") <> "" Then
	Set objCrypt		= New CryptAES
		UserKey			= objCrypt.Decode(Request.cookies("AUTH_USERKEY"), SITENAME)
		secureKey		= objCrypt.Encode(Session.sessionID, SITENAME)
		arr_Userinfo	= Split(UserKey, vbCrLf)
		MyNo			= arr_Userinfo(0)
		Myid			= arr_Userinfo(2)
		MYDEPART		= arr_Userinfo(3)
		Set objCrypt = Nothing
	valueDate = "loging = 0"
	whereSQl = " where UserNo="&MyNo&" and UserIP = '"& getIp &"' and member_gubun='"&MYDEPART&"'"
	StrSql = "Update tbl_UserLog set "&valueDate & whereSQl
End If
Call closeDb
response.cookies("AUTH_USERKEY")			= ""
response.cookies("AUTH_USERKEY").Expires	=  Date()-1
Response.cookies("MEMBERKEY")				= ""
Response.cookies("MEMBERKEY").Expires		= Date()-1
response.cookies("InstiNo").Expires			=  Date()-1
session.Contents.RemoveAll()
session.Abandon%>
<script>
	top.location.href="/";
</script>