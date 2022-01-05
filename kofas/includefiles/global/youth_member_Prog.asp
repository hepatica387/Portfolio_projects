<!--#include virtual="/LIB/_Headinclude.asp"-->
<!--#include virtual="/LIB/CharSet_utf.asp"-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<%
Call group_member() ' 브라보실버/멘토/청소년 조직화
wdate			= now()
name			= getRequest("name" , REQUEST_POST)
birthDay		= getRequest("birthDay" , REQUEST_POST)
sch_gubun		= getRequest("sch_gubun" , REQUEST_POST)
id				= getRequest("id" , REQUEST_POST)
pwd				= getRequest("pwd" , REQUEST_POST)
email1			= getRequest("email1" , REQUEST_POST)
email2			= getRequest("email2" , REQUEST_POST)
email3			= getRequest("email3" , REQUEST_POST)
If email2 = "" Then email2 = email3
email			= email1&"@"&email2
hp1				= getRequest("hp1" , REQUEST_POST)
hp2				= getRequest("hp2" , REQUEST_POST)
hp3				= getRequest("hp3" , REQUEST_POST)
phone			= hp1 &"-"& hp2 &"-"& hp3
zipcode			= getRequest("zipcode" , REQUEST_POST)
addr1			= getRequest("addr1" , REQUEST_POST)
addr2			= getRequest("addr2" , REQUEST_POST)
memGubun		= getRequest("memGubun" , REQUEST_POST)
spam_code		= getRequest("spam_code" , REQUEST_POST)
arng			= getRequest("arng" , REQUEST_POST)
seq				= getRequest("seq" , REQUEST_POST)
Set Crypt		=  New CryptHash
User_PW			= Crypt.hash(pwd)
Set Crypt		= Nothing



'Call rwFormItem ("")

'Response.End
Select Case arng
	Case "INS"
		If Not checkCSRPToken(spam_code) Then
			Call EndGoURL("바른경로에서 입력하세요")
		End if
		sql="select id from member where id='"&id&"'"
		re_id = SqlValue(Sql, 1)
		If IsNull(re_id) Then
			sql="select ser_id from service where (ser_id='"&id&"')"
			re_id = SqlValue(Sql, 1)
			If isnull(re_id) Then
				sql="select id from group_member  where (id='"&id&"' and name='"&name&"' and birthDay='"&birthDay&"')"
				re_id = SqlValue(Sql, 1)
			End if
		End if
		if not IsNull(re_id) Then Call EndGoURL("등록된 회원정보입니다.\n\n다시 확인하십시요")
		SqlFlds  = "id, pwd ,name ,phone, sch_gubun ,birthDay ,gubun ,state ,wDate ,zipcode ,addr1 ,addr2, email "
		SqlValues = "'"&id&"','"& User_PW&"' ,'"&name&"' ,'"&phone&"' ,'"&sch_gubun&"' ,'"&birthDay&"' ,'"&memGubun&"' ,'0' ,'"&wDate&"' ,'"&zipcode&"' ,'"&addr1&"' ,'"&addr2&"','"&email&"'"

		Sql = "insert into Group_member ("&SqlFlds&") values ("&SqlValues&")"
		Call RunSql(Sql, 1)
		mstr = "회원등록이 완료 되었습니다."
	Case "UPD"
		If pwd <> "" Then pwd_sql = ", pwd = '"&User_PW&"'"
		Sql_values = "name ='"&name&"' ,phone = '"&phone&"', sch_gubun = '"&sch_gubun&"' ,birthDay='"&birthDay&"' ,zipcode= '"&zipcode&"' ,addr1='"&addr1&"' ,addr2='"&addr2&"' ,email='"&email&"' "& pwd_sql
		StrSql = "update group_member set "&Sql_Values&" where seq = "&seq
'		RW(StrSQL)
		Call RunSql(strSql,1)
		mstr = "회원수정이 완료 되었습니다."
End Select



'response.write seq&"<br>"
'response.write page&"<br>"
'response.write name&"<br>"
'response.write content&"<br>"
'response.write co_ref&"<br>"
'response.write co_re_step&"<br>"
'response.write co_re_level&"<br>"
'Response.write StrSql
'response.end
Select Case MYDEPART
	Case "silver"
		Call EndGoTopURL(mstr,"/contents/sub06/?act=Y&st=sub06&sMenu=03")
	Case "youth"
		Call EndGoTopURL(mstr,"/contents/sub07/?act=Y&st=sub07&sMenu=03")
	Case else
		Call EndGoTopURL(mstr,"/")
End Select
Response.end
%>