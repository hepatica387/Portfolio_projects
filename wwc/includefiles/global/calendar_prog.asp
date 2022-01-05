<!--#include virtual="/LIB/Head_include.asp"-->
<!--#include virtual="/LIB/CharSet_utf.asp"-->
<!-- 데이터베이스에 일정 저장하는 페이지 -->
<%
Call MemberChk(MYID, MyLevel, 12, 12, "admin")
	arng			= Request.Form("arng")
	st				= Request.Form("st")
	sMenu			= Request.Form("sMenu")
	dYear			= Request.Form("dYear")
	dMonth			= Request.Form("dMonth")
	dDay			= Request.Form("dDay")
	content			= Request.Form("content")
	content			= replace(content,"'","")
	subject			= Request.Form("subject")
	subject			= replace(subject,"'","")
	seq				= Request.Form("seq")
	
'Response.write Request.form
set rs=server.createobject("adodb.recordset")
Select Case arng
	Case "write"			
			rs.open "calendar", Sql_connect(), adopenstatic, adlockpessimistic, adcmdtable
			with rs
				.addnew
				.fields("dYear")		= dYear
				.fields("dMonth")		= dMonth			
				.fields("dDay")			= dDay
				.fields("content")		= content
				.fields("subject")		= subject
				.fields("visit")		= 0
				.fields("wDate")		= now()				
				.update
				.close
			end with		
		
	Case "edit"			
			sql="select * from calendar where seq="&seq
			rs.open sql, Sql_connect(), adopenstatic, adlockpessimistic, adcmdtext
			with rs
				.fields("dYear")		= dYear
				.fields("dMonth")		= dMonth			
				.fields("dDay")			= dDay
				.fields("content")		= content
				.fields("subject")		= subject	
				.fields("wDate")		= now()		
				.update
				.close
			end with
				
	Case "delete"
		Sql = "delete from calendar where Seq="&seq		
		'Response.write Sql
		Call RunSql(sql, 1)
 End Select 

set rs=Nothing

refer_url = Request.ServerVariables("HTTP_REFERER")
If refer_url = "" Then
	Call EndGoTopURL("","/contents/?st="&st&"&sMenu="&sMenu)
Else
	Call EndGoTopURL("",refer_url)
End if
%>