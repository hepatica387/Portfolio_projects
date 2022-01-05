<% response.expires=-1000 %>
<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include file="../../includefiles/func/function.auth.asp"-->
<%
If MyID = "admin" Then
	Call EndGoTopURL("최고관리자는 회원탈퇴가 불가능합니다.","/") 
Else 
	StrSQl              = "select profileImg From TBL_MEMBERS where seq="&seq
	ed_Filename         = SqlVAlue(strSql, 1)
	if ed_Filename <> "" Then Call FileDelete(objUpload.defaultpath  & ed_Filename)

	strSql = "delete from tbl_members where UserId='"&Myid&"'" 
	strSql = strSql &" ;delete from jjim_table where UserId='"&Myid&"'" 
	
	Call DB.execute(strSql, 1)
	Call EndGoTopURL("회원탈퇴가 완료되었습니다.","/") 
End If 
Call closeDB%>
