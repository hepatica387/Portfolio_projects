<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include virtual="/LIB/CharSet_utf.asp"-->
<%
ID = LCase(Request.QueryString("ID"))
sql="select count(UserID) from tbl_members where Userid='"&ID&"'"
ID_cnt = SqlValue(Sql,1)
with response
	.write "<script language='javascript'>"
If ID_cnt = 0 Then
	.write " alert('등록가능한 아이디 입니다.');"
	.write " parent.document.form1.Userid.value = '"&ID&"';"
	.write " parent.document.form1.id.readOnly = true; "
Else
	.write " alert('이미 등록된 아이디 입니다.');"
End If
	.write "</script>"
End with%>