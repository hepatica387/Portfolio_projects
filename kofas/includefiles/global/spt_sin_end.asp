<!--#include virtual="/LIB/_headInclude.asp"-->
<%

Name		= getRequest("Name" , REQUEST_POST)
ssn			= getRequest("ssn1" , REQUEST_POST)
phone1		= getRequest("phone1" , REQUEST_POST)
phone2		= getRequest("phone2" , REQUEST_POST)
phone3		= getRequest("phone3" , REQUEST_POST)
phone		= phone1 &"-" & phone2 &"-"& phone3
zipcode		= getRequest("zipcode" , REQUEST_POST)
addr1		= getRequest("addr1" , REQUEST_POST)
addr2		= getRequest("addr2" , REQUEST_POST)
kind		= getRequest("kind" , REQUEST_POST)
sp_money	= getRequest("sp_money" , REQUEST_POST)
sp_method	= getRequest("sp_method" , REQUEST_POST)
wdate		= now()
bank_name	= getRequest("bank_name" , REQUEST_POST)
bank_number = getRequest("bank_number" , REQUEST_POST)
bank_master = getRequest("bank_master" , REQUEST_POST)
transfer	= getRequest("transfer" , REQUEST_POST)
chu_Name	= getRequest("chu_Name" , REQUEST_POST)
spam_code	= getRequest("spam_code" , REQUEST_POST)

If Not checkCSRPToken(spam_code) Then
	Call EndGoURL("바른경로에서 입력하세요")
End if

'Call rwFormItem ("F")

'Response.End
'Response.write request.form
Dim adoRs, context
Set adoRs = Server.CreateObject("ADODB.RecordSet")
adoRs.Open "support", Sql_Connect, adOpenStatic, adLockPessimistic, adCmdTable

with adoRs
	.AddNew
	.Fields("name")			= name
	.Fields("ssn")			= ssn
	.Fields("birthday")		= ssn
	.Fields("phone")		= phone
	.Fields("pcs")			= pcs
	.Fields("zipcode")		= zipcode
	.Fields("addr1")		= addr1
	.Fields("addr2")		= addr2
	.Fields("sp_kind")		= kind
	.Fields("sp_money")		= sp_money
	.Fields("sp_method")	= sp_method
	.Fields("wdate")		= wdate
	.Fields("chu_Name")		= chu_Name
	If sp_method = "CMS" Then
		.Fields("bank_name")	= bank_name
		.Fields("bank_number")	= bank_number
		.Fields("bank_master")	= bank_master
		.Fields("transfer")		= transfer
	End If
  .Update
  .Close
end with
Set adoRs = Nothing
Call GoURL(name&"님 후원신청이 등록 되었습니다.\n\n감사합니다.","/sub03/01")

Call DBclose
Response.end
%>
