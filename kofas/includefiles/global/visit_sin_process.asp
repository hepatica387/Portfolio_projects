<!--#include virtual="/LIB/_headInclude.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<%
stype			= getRequest("stype", REQUEST_POST)
sname			= getRequest("sname" , REQUEST_POST)
visit_date		= getRequest("visit_date" , REQUEST_POST)
visit_time		= getRequest("visit_time" , REQUEST_POST)

visitDateTime	= visit_date &" "&visit_time
many_date1		= getRequest("many_date1" , REQUEST_POST)
many_time1		= getRequest("many_time1" , REQUEST_POST)
manyDateTime1	= many_date1 &" "&many_time1

many_date2		= getRequest("many_date2" , REQUEST_POST)
many_time2		= getRequest("many_time2" , REQUEST_POST)
manyDateTime2	= many_date2 &" "&many_time2

sEmail			= getRequest("sEmail" , REQUEST_POST)
phone1			= getRequest("phone1" , REQUEST_POST)
phone2			= getRequest("phone2" , REQUEST_POST)
phone3			= getRequest("phone3" , REQUEST_POST)
phone			= phone1&"-"&phone2&"-"&phone3

profName		= getRequest("profName" , REQUEST_POST)
visit_int		= getRequest("visit_int" , REQUEST_POST)

uni_depart		= getRequest("uni_depart" , REQUEST_POST)
uni_name		= getRequest("uni_name" , REQUEST_POST)
grade			= getRequest("grade" , REQUEST_POST)
uni_subject		= getRequest("uni_subject" , REQUEST_POST)
visit_purpose	= getRequest("visit_purpose" , REQUEST_POST)
interview		= getRequest("interview" , REQUEST_POST)
etc_coment		= getRequest("etc_coment" , REQUEST_POST)

spam_code		= getRequest("spam_code" , REQUEST_POST)
sinCode			= getRequest("sinCode" , REQUEST_POST)



If Not checkCSRPToken(spam_code) Then
	Call EndGoURL("바른경로에서 입력하세요")
End if
'Call rwFormItem ("F")
'Response.End

'Response.write request.form
Dim adoRs, context
Set adoRs = Server.CreateObject("ADODB.RecordSet")
adoRs.Open "insti_visit_sin", Sql_Connect, adOpenStatic, adLockPessimistic, adCmdTable

with adoRs
	.AddNew
	.Fields("sType")			= sType
	.Fields("visit_date")		= visitDateTime
	.Fields("many_date1")		= manyDateTime1
	.Fields("many_date2")		= manyDateTime2
	.Fields("sname")			= sname
	.Fields("sPhone")			= phone
	.Fields("sEmail")			= sEmail
	.Fields("visit_int")		= visit_int
	.Fields("uni_name")			= uni_name
	.Fields("uni_depart")		= uni_depart
	.Fields("grade")			= grade
	.Fields("uni_subject")		= uni_subject
	.Fields("profName")			= profName
	.Fields("visit_purpose")	= visit_purpose
	.Fields("interview")		= interview
	.Fields("etc_coment")		= etc_coment
	.Fields("regDate")			= Now()
	.Fields("displayYN")		= "N"
	.Fields("sin_code")			= sinCode
  .Update
  .Close
end with
Set adoRs = Nothing
Call GoURL(sname&"님 신청이 완료 되었습니다.\n\n감사합니다.","/")

Call DBclose
Response.end
%>
