<!--#include file='../../LIB/_headInclude.asp'-->
<%

Userid			= getRequest("Userid" , REQUEST_POST)
name			= getRequest("name" , REQUEST_POST)
id				= getRequest("id" , REQUEST_POST)
id				= Replace(id," ","")
pwd				= getRequest("pwd" , REQUEST_POST)
email1			= getRequest("email1" , REQUEST_POST)
email2			= getRequest("email2" , REQUEST_POST)
email3			= getRequest("email3" , REQUEST_POST)
If email2 = "" Then email2 = email3
email			= email1&"@"&email2
hp1				= getRequest("hp1" , REQUEST_POST)
hp2				= getRequest("hp2" , REQUEST_POST)
hp3				= getRequest("hp3" , REQUEST_POST)
pcs				= hp1 &"-"& hp2 &"-"& hp3
zipcode			= getRequest("zipcode" , REQUEST_POST)
addr1			= getRequest("addr1" , REQUEST_POST)
addr2			= getRequest("addr2" , REQUEST_POST)
arng			= getRequest("arng" , REQUEST_POST)
Insti_name      = getRequest("Insti_name" , REQUEST_POST)
spam_code		= getRequest("spam_code" , REQUEST_POST)
mem_level		= 13
wdate			= now()
Set Crypt		=  New CryptHash
User_PW			= Crypt.hash(pwd)
Set Crypt		= Nothing

'Call rwFormItem ("F")
'Response.End
Select Case arng
		Case  "join"
			If Not checkCSRPToken(spam_code) Then
				Call EndGoURL("바른경로에서 입력하세요")
			End if

			'response.write idx&"<br>"
			'response.write page&"<br>"
			'response.write name&"<br>"
			'response.write content&"<br>"
			'response.write ref&"<br>"
			'response.write re_step&"<br>"
			'response.write re_level&"<br>"


			Dim adoRs, context
			Set adoRs = Server.CreateObject("ADODB.RecordSet")
			adoRs.Open "tbl_members", Sql_Connect(), adOpenStatic, adLockPessimistic, adCmdTable

			with adoRs
				.AddNew
				.Fields("User_NM")		= name
				.Fields("Userid")		= id
				.Fields("Insti_name")	= Insti_name
			'	.Fields("phone")	= phone
				.Fields("UserPhone")	= pcs
				.Fields("zipcode")		= zipcode
				.Fields("addr1")		= addr1
				.Fields("addr2")		= addr2
				.Fields("UserPW")		= User_PW
				.Fields("UserEmail")	= email
				.Fields("UserLevel")	= mem_level
				.Fields("regDate")		= wdate
				.Fields("intranet")		= "0"
				.Fields("state")		= "1"
				.Fields("memGubun")		= "Y"
			  .Update
			  .Close
			end with
			Set adoRs = nothing
			Call EndGoTopURL("회원가입이 완료 되었습니다.","/")
		Case "edit"
			set rs=server.createobject("adodb.recordset")
			sql="select * from [tbl_members] where Userid='"&id&"'"
			rs.open sql, Sql_Connect(), adopenstatic, adlockpessimistic,adcmdtext
			with Rs
				.Fields("Insti_name")		= Insti_name
				.Fields("UserPhone")		= pcs
				.Fields("zipcode")			= Left(zipcode, 5)
				.Fields("addr1")			= addr1
				.Fields("addr2")			= addr2
				If pwd <> "" Then .Fields("UserPW") = User_PW
				.Fields("UserEmail")		= email
				.Fields("User_NM")			= User_NM
			  .Update
			  .Close
			end with
			Set Rs = Nothing

			Call EndGoTopURL("회원정보가 수정되었습니다.","/")
		Case "DEL"
			sql="delete from [tbl_members] where id='"&Request.Form("Userid")&"'"
			Call RUNSQL(Sql, 1)
			Call EndGoTopURL("회원탈퇴가 완료되었습니다.","/")
End Select
%>