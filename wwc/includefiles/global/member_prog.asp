<% response.expires=-1000 %>
<!--#include file='../../LIB/_headInclude.asp'-->
<%
'	getRequest
'	REQUEST_POST
dim ProgressID, obj, Progid
ProgID = request.QueryString("ProgressID")
set objUpload=server.CreateObject("DEXT.FileUpload")
objUpload.SetProgress(ProgID)
objUpload.AutoMakeFolder = True
objUpload.defaultpath = DATAFILE_FOLDER&"\MEMBER\"

seq				= objUpload.Form("seq" )
arng			= objUpload.Form("arng" )
UserID			= Trim(objUpload.Form("UserID" ))
UserID			= replace(UserID," ","")
User_NM			= Trim(objUpload.Form("User_NM" ))
User_NM			= replace(User_NM," ","")
User_PW			= objUpload.Form("User_PW" )
UserEmail		= objUpload.Form("UserEmail" )
user_ph1		= objUpload.Form("user_ph1" )
user_ph2		= objUpload.Form("user_ph2" )
user_ph3		= objUpload.Form("user_ph3" )
NickName		= objUpload.Form("NickName" )
mem_type		= objUpload.Form("mem_type" )

user_hp3		= objUpload.Form("user_hp3" )
ADDR1			= objUpload.Form("ADDR1" )
ADDR2			= objUpload.Form("ADDR2" )
insti_Nm		= objUpload.Form("insti_Name" )
Userinfo		= objUpload.Form("Userinfo" )
profileImg		= objUpload.Form("profileImg" )
delChk			= objUpload.Form("delChk" )

mem_gubun		= objUpload.Form("mem_gubun" )


intranet		= 0
state			= 1
UserLevel		= mem_type

RegDate			= now()
UserPhone		= user_ph1 & "-" & user_ph2 & "-" & user_ph3

Set Crypt		=  New CryptHash
User_PW			= Crypt.hash(User_PW)
Set Crypt		= Nothing
'RW(Insti_File1)
'Response.End

if arng = "edit" Then
	StrSQl              = "select profileImg From tbl_members where seq="&seq
    edit_profileImg        = SqlValue(strSql, 1)
	
	if delChk = "Y" or profileImg <> ""  then        
        if edit_profileImg <> "" Then			
            Call FileDelete(objUpload.defaultpath  & edit_profileImg)
			filename1  = ""
        end if
    end If   
end if

if profileImg <> "" then
    filesize	       = objUpload.Form("profileImg" ).FileLen
    filePath           = objUpload.defaultpath
    filelen			   = 1024*1024*2
    If filesize > filelen Then  Call EndGoURL("파일 용량 제한입니다.\n\n 2메가 이하의 자료만 업로드 할수 있습니다.")
    filename1 = DEXTUpload_global(filePath, 500,"profileImg", "I")
end if
'RW(Insti_NM)
'Response.End

Select Case arng
	Case "write"
		insFlds = "UserID, User_NM, UserPW, UserEmail, UserPhone, MacAddr, regDate "
		insFlds = insFlds & ", state, intranet, UserLevel, NickName, zipcode, Addr1, Addr2, profileImg"
		insFlds = insFlds & ", Userinfo, memgubun"
		
		valFlds = "'"&UserID&"', '"&User_NM&"', '"&User_PW&"', '"&UserEmail&"', '"&UserPhone&"', '"&MacAddr&"', '"&regDate&"'"
		valFlds = valFlds & ", '"&state&"', '"&intranet&"', '"&UserLevel&"', '"&NickName&"', '"&zipcode&"', '"&Addr1&"', '"&Addr2&"', '"&filename1&"'"
		valFlds = valFlds & ", '"&Userinfo&"', '"&mem_gubun&"'"	

		StrSql = "INSERT INTO TBL_MEMBERS ("&insFlds&") VALUES ("&valFlds&")"
		'RW(StrSql)		
		Call DB.execute(strSql,1)
		'Response.End 
		MSG		= "등록되었습니다."
	Case "edit"
		If objUpload.form("User_PW") <> "" Then
			PWSQL = ", UserPw ='"&User_PW&"'"
		End If
		If objUpload.form("profileImg") <> "" Or delChk = "Y" Then
			IMGSql1 = ", profileImg ='"&filename1&"'"
		End If		
		
		insFlds = "User_NM='"&User_NM&"', UserEmail='"&UserEmail&"', UserPhone='"&UserPhone&"', state='"&state&"', UserLevel='"&UserLevel&"'"		
		insFlds = insFlds &",NickName='"&NickName&"',  Addr1='"&Addr1&"', Addr2='"&Addr2&"', memgubun='"&mem_gubun&"'"
		
		insFlds = insFlds &", Userinfo='"&Userinfo&"'" & PWSQL & IMGSql1 
		StrSql = "UPDATE TBL_MEMBERS SET  "& insFlds &" where Seq="&seq
		Call DB.execute(strSql,1)
		MSG		= "수정되었습니다."
	Case "del"
		StrSQl              = "select profileImg From TBL_MEMBERS where seq="&seq
		ed_Filename         = SqlVAlue(strSql, 1)

		if ed_Filename <> "" Then Call FileDelete(objUpload.defaultpath  & ed_Filename)
		StrSql = "DELETE FROM TBL_MEMBERS WHERE UserID='"&MYID&"'"
		Call DB.execute(strSql,1)
		'MSG		= "삭제되었습니다."
		'response.redirect "../../member/member.asp?page="&page
		'response.end
End Select
Call submitGetURL( "/", "_self", Array( _
	Array("page", page), _
	Array("search", search), _
	Array("searchstr", searchstr) _
	))
Call closeDB
Call EndGoTopURL(MSG,"/")%>