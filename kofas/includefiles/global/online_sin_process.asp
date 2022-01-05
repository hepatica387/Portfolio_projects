<!--#include virtual="/LIB/_headInclude.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<%
apply_name		= getRequest("apply_name" , REQUEST_POST)
apply_hp1		= getRequest("apply_hp1" , REQUEST_POST)
apply_hp2		= getRequest("apply_hp2" , REQUEST_POST)
apply_hp3		= getRequest("apply_hp3" , REQUEST_POST)
apply_hp		= apply_hp1&"-"&apply_hp2&"-"&apply_hp3
sName			= getRequest("sName" , REQUEST_POST)
s_hp1			= getRequest("s_hp1" , REQUEST_POST)
s_hp2			= getRequest("s_hp2" , REQUEST_POST)
s_hp3			= getRequest("s_hp3" , REQUEST_POST)
sPhone			= s_hp1&"-"&s_hp2&"-"&s_hp3
sex				= getRequest("sex" , REQUEST_POST)
birth			= getRequest("birth" , REQUEST_POST)
economy			= getRequest("economy" , REQUEST_POST)
addr1			= getRequest("addr1" , REQUEST_POST)
addr2			= getRequest("addr2" , REQUEST_POST)
programName		= getRequest("programName" , REQUEST_POST)
programCode		= getRequest("programCode" , REQUEST_POST)
program_gubun	= getRequest("program_gubun" , REQUEST_POST)
spam_code		= getRequest("spam_code" , REQUEST_POST)
sinCode			= getRequest("sinCode" , REQUEST_POST)
sin_course		= getRequest("sin_course" , REQUEST_POST)
Relation		= getRequest("Relation" , REQUEST_POST)

If Not checkCSRPToken(spam_code) Then
	Call EndGoURL("바른경로에서 입력하세요")
End if
'Call rwFormItem ("F")
'Response.End

'Response.write request.form
Dim adoRs, context
Set adoRs = Server.CreateObject("ADODB.RecordSet")
adoRs.Open "Online_sin", Sql_Connect, adOpenStatic, adLockPessimistic, adCmdTable

with adoRs
	.AddNew
	.Fields("apply_name")		= apply_name
	.Fields("apply_phone")		= apply_hp
	.Fields("sName")			= sName
	.Fields("sPhone")			= sPhone
	.Fields("sex")				= sex
	.Fields("birth")			= birth
	.Fields("economy")			= economy
	.Fields("addr1")			= addr1
	.Fields("addr2")			= addr2
	.Fields("program_gubun")	= program_gubun
	.Fields("programCode")		= programCode
	.Fields("programName")		= programName
	.Fields("regDate")			= Now()
	.Fields("displayYN")		= "N"
	.Fields("sin_code")			= sinCode
	.Fields("sin_course")		= sin_course
	.Fields("Relation")			= Relation
  .Update
  .Close
end with
Set adoRs = Nothing
Call GoURL(apply_name&"님 "&program_gubun&" 신청이 완료 되었습니다.\n\n감사합니다.","/")

Call DBclose
Response.end
%>
