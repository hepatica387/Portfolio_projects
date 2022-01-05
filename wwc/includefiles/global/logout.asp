<% response.expires=-1000 %>
<!--#include file='../../LIB/_headInclude.asp'-->
<%
valueDate = "loging = 0"
whereSQl = " where UserNo="&UserNo&" and UserIP = '"& getIp &"'"
StrSql = "Update tbl_UserLog set "&valueDate & whereSQl
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