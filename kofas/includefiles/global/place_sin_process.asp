<!--#include virtual="/LIB/_headInclude.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<%
name			= getRequest("name" , REQUEST_POST)
phone1			= getRequest("phone1" , REQUEST_POST)
phone2			= getRequest("phone2" , REQUEST_POST)
phone3			= getRequest("phone3" , REQUEST_POST)
phone			= phone1&"-"&phone2&"-"&phone3
addr1			= getRequest("addr1" , REQUEST_POST)
addr2			= getRequest("addr2" , REQUEST_POST)
plc_price		= getRequest("plc_price" , REQUEST_POST)
place_date		= getRequest("place_date" , REQUEST_POST)
place_time		= getRequest("place_time" , REQUEST_POST)
place			= getRequest("place" , REQUEST_POST)
place_info		= getRequest("place_info" , REQUEST_POST)
sinCode			= getRequest("sinCode" , REQUEST_POST)
spam_code		= getRequest("spam_code" , REQUEST_POST)

If Not checkCSRPToken(spam_code) Then
	Call EndGoURL("바른경로에서 입력하세요")
End if
'Call rwFormItem ("")
'Response.End

'Response.write request.form
Dim adoRs, context
Set adoRs = Server.CreateObject("ADODB.RecordSet")
adoRs.Open "place_sin", Sql_Connect, adOpenStatic, adLockPessimistic, adCmdTable

with adoRs
	.AddNew
	.Fields("Name")				= Name
	.Fields("phone")			= phone
	.Fields("addr1")			= addr1
	.Fields("addr2")			= addr2
	.Fields("place_date")		= place_date
	.Fields("place_time")		= place_time
	.Fields("place_info")		= place_info
	.Fields("plc_price")		= plc_price
	.Fields("place")			= place
	.Fields("regDate")			= Now()
	.Fields("displayYN")		= "N"
	.Fields("sin_code")			= sinCode
  .Update
  .Close
end with
Set adoRs = Nothing
Call GoURL(Name&"님 신청이 완료 되었습니다.\n\n감사합니다.","/")

Call DBclose
Response.end
%>
