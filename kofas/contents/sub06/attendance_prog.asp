<!--#include virtual="/LIB/_Headinclude.asp"-->
<!--#include virtual="/LIB/CharSet_utf.asp"-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<!-- 데이터베이스에 일정 저장하는 페이지 -->
<%
'Call MemberChk(MYID, MyLevel, 12, 12, "admin")
Call silver_member()
id			= Request.QueryString("ID")
GR_INFO		= Request.QueryString("GR_INFO")
 If  GR_INFO <> "" Then
	group_			= Split(GR_INFO,"$$")
	group_seq		= group_(0)
	group_Name		= group_(1)
End if
wDate			= Request.QueryString("wDate")
w_year			= Year(wDate)
w_month			= Month(wDate)
w_day			= Day(wDate)
page			= Request.QueryString("page")
name			= Request.QueryString("name")
'RW(w_day)
'Response.End

sql="select count(Seq) from GROUP_MEMBER_attendance where id = '"&id&"' and group_seq="&group_seq&" and  sYear="&w_year&" and sMOnth="&w_month
Cnt = SqlVAlue(Sql,1)
If cnt = 0 Then
insFlds		= "id, Name, sYear, sMonth, ["&int(w_Day)&"], group_name, group_seq "
vals		= "'"&id&"', '"&Name&"', '"&w_year&"', '"&w_month&"', 1, '"&group_name&"', '"&group_seq&"'"
Sql = "Insert Into GROUP_MEMBER_attendance ("&insFlds&") values ("&vals&")"

'set rs=server.createobject("adodb.recordset")
'sql="select * from GROUP_MEMBER_attendance where id = '"&id&"' and group_seq="&group_seq&" and  sYear="&w_year&" and sMOnth="&w_month
'rs.open sql, Sql_connect(), adopenstatic, adlockpessimistic,adcmdtext
'If rs.eof Or rs.bof then
'	rs.close
'	rs.open "GROUP_MEMBER_attendance", Sql_connect(), adopenstatic, adlockpessimistic,adcmdtable
'	with rs
'		.addnew
'		.fields("id")			= id
'		.fields("name")			= Name
'		.fields("sYear")		= w_year
'		.fields("sMonth")		= int(w_month)
'		.fields(int(w_day))		= "1"
'		.fields("group_name")	= group_name
'		.fields("group_seq")	= group_seq
'		.update
'		.close
'	 end with
' Set rs = nothing
Else
	SQl = "update GROUP_MEMBER_attendance set ["&int(w_day)&"] = 1 where id = '"&id&"' and group_seq="&group_seq&" and  sYear="&w_year&" and sMOnth="&int(w_month)
End If
 'RW(SQl)
 Call RunSql(Sql, 1)
response.redirect "/contents/sub06/?act=y&st=sub06&sMenu=03&page="&page&"&GR_INFO="&GR_INFO
Response.end
%>