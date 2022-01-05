<% response.expires=-1000 %>
<!--#include file='../../LIB/_headInclude.asp'-->
<%
UserID	= getRequest("UserID", REQUEST_GET)
email	= getRequest("email", REQUEST_GET)
arng	= getRequest("arng", REQUEST_GET)
If arng = "ID" Then
	StrSql  = "select count(*) from tbl_members where UserID=?"
	arrParams = Array( _
		DB.makeParam("@UserID", adVarchar, adParamInput, Len(UserID)+1, UserID) _
	)
	FindData = DB.execRsData(strSql, DB_CMDTYPE_TEXT, arrParams, 1)
	If FindData > 0 Then
		RW("<script type=""text/javascript""> " &_
			" alert(""사용 불가능한 아이디 입니다."");" &_
			" parent.document.FRM.UserID.value=''; "&_
			" parent.document.FRM.UserID.focus();" &_
			"</script>" )
	Else
		RW("<script type=""text/javascript""> " &_
			"parent.document.FRM.idChk.value='Y';" &_
			" alert(""사용 가능한 아이디 입니다."");" &_
			"</script>" )
	End If
elseIf arng = "email" Then
	strSQl = "select count(seq) from tbl_members where UserEmail='"&email&"'"
	FindData	= SqlVAlue(strSql, 1)
	If FindData > 0 Then
		RW("<script type=""text/javascript""> " &_
			" alert(""이미 등록되어 있는 메일입니다."");" &_
			" parent.document.FRM.UserEmail.value=''; "&_
			" parent.document.FRM.UserEmail.focus();" &_
			"</script>" )
	Else
		RW("<script type=""text/javascript""> " &_
			"parent.document.FRM.emailChk.value='Y';" &_
			" alert(""사용 가능한 이메일입니다."");" &_
			"</script>" )
	End If
Else	
	strSQl = "select count(seq) from tbl_members where nickName='"&UserID&"'"
	FindData	= SqlVAlue(strSql, 1)
	If FindData > 0 Then
		RW("<script type=""text/javascript""> " &_
			" alert(""사용 불가능한 닉네임입니다."");" &_
			" parent.document.FRM.NickName.value=''; "&_
			" parent.document.FRM.NickName.focus();" &_
			"</script>" )
	Else
		RW("<script type=""text/javascript""> " &_
			"parent.document.FRM.nickChk.value='Y';" &_
			" alert(""사용 가능한 닉네임입니다."");" &_
			"</script>" )
	End If
End If
Response.End 
Call closeDB%>