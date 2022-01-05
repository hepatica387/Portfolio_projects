<% response.expires=-1000 %>
<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include file="../../includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/Frm_injection_Chk.asp"-->
<%
RW("<!DOCTYPE html><html lang=""ko""><head><meta charset=""utf-8"" /><title>경로오류</title>")
Set Crypt	=  New CryptHash
LogID		= getRequest("LogID", REQUEST_POST)
LogPW		= getRequest("LogPW", REQUEST_POST)
id_save		= getRequest("id_save", REQUEST_POST)
simpleLog	= getRequest("simpleLog", REQUEST_POST)
MEMBERKEY	= getRequest("MEMBERKEY", REQUEST_POST)
secure_code	= getRequest("secure_code", REQUEST_POST)
If Not checkCSRPToken(secure_code) Then Call EndGoURL("바른경로에서 로그인 하세요!")
LogPW		= Crypt.hash(LogPW)
turn_url	= Request.form("turn_url")
turn_url	= "/"
'RW(turn_url)
'Response.end
'LogPW		= "f215faf9d88b7f0a881632ee22459ee452a296c808d261b6cc993d3a1fd0600e"
'If turn_url = "" Then turn_url = request.ServerVariables("HTTP_REFERER")
If LogID = "" Then
	Call EndGoURL("아이디를 입력하세요")
Else

		WhereSql = " where UserId='"&LCase(Replace(LogID,"'",""))&"' and state=1"
		strSql = "select UserId, UserPw, UserLevel, seq, intranet from tbl_members "
		strSql = strSql& WhereSql
		arrFlds = DB.execRsList(strSql, DB_CMDTYPE_TEXT, , , 1)
		'*****************처음 로그인 할때 회원 로그인 ***************************
		If Not IsNull(arrFlds) then '회원이 아닐때..		        
				Userid			= arrFlds(0,0)				' 아이디
				UserPw			= arrFlds(1,0)				' 아이디
				Level			= arrFlds(2,0)				' 회원 레벨
				UserNo			= arrFlds(3,0)				' 아이디
				login_time		= now()					' 로그인 시간
				memGubun		= GradeName(arrFlds(2,0))	' 회원구분명
				intranet		= arrFlds(4,0)				' 인트라넷 이용
'				RWBR(strSql)
'				RWbr("UserPw =>" & UserPw)
'				RWbr("LogPW =>" & LogPW)
				'Response.End 
				If MEMBERKEY = "" Then
					If UserPw <> LogPW Then Call EndGoURL("이용 권한이 없습니다.")
				End if
				
				If intranet Then logInet = 1 Else logInet = 0
				Set objCrypt = New CryptAES
					UserKey		= objCrypt.Encode(Join(Array(UserNo, Level, Userid), vbCrLf), SITENAME)
					secureKey   = objCrypt.Encode(Session.sessionID, SITENAME)
				Set objCrypt = Nothing
				UserKind =  BD_SELECT_Value("tbl_UserLog", "count(*)", "where UserNo="&UserNo&" and UserIP=''"&getIp&"''")
				Response.Cookies("AUTH_USERKEY") = UserKey
				If UserKind > 0 Then
					valueDate = "loging = 0, intranet=0"
					whereSQl = " where UserNo="&UserNo&" and UserIP <> '"& getIp &"'"
					StrSql = "Update tbl_UserLog set "&valueDate & whereSQl
					' 중복 접속 제거
					valueDate = "userKey='"&secureKey&"', intranet="&logInet&", UserIP='"&getIp&"', RegDate='"&now()&"', visitCount=visitCount+1, loging=1 "
					whereSQl = "where UserNo="&UserNo&" and UserIP='"& getIp &"'"

					strSql = strSql &"; Update tbl_UserLog set "&valueDate & whereSQl
					Call DB.execute(strSql, 1)
				Else
					log_flds		= "UserNo,  UserKey, UserIP, intranet, visitCount, RegDate, loging"
					log_values		= UserNo &",'"&secureKey&"','"&getIp&"',"&logInet&",1,'"&now()&"', 1"
					Call BD_INST("tbl_UserLog", log_flds, log_values)
				End If
				If simpleLog = "Y" Then
					Response.cookies("MEMBERKEY")			= secureKey
					Response.cookies("MEMBERKEY").Expires	= Date()+5
					Response.Cookies("UserID").Expires		= Date()-1
				Else
					If id_save = "Y" Then Response.Cookies("UserID") = LogID Else Response.Cookies("UserID") = ""
					Response.cookies("MEMBERKEY").Expires	= Date()-1
				End if
				'RW(Len(sso))
				'response.redirect
				Call EndGoTopURL("",turn_url)
				'Call pageHearder()
				'response.redirect "/"

		Else
			Call EndGoURL("회원정보가 없습니다.")
		End If
	response.end
End If
Set Crypt = Nothing
Call closeDB
RW("</head><body></body></html>")%>
