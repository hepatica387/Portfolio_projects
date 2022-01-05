<!--#include virtual="/LIB/_Headinclude.asp"-->
<!--#include virtual="/includefiles/global/_array.asp"-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<!--#include virtual="/LIB/CharSet_utf.asp"-->
<!-- 데이터베이스에 일정 저장하는 페이지 -->
<%
set uploadform=server.CreateObject("DEXT.FileUpload")
'DEXTUpload Professional 버전에서 AutoMakeFolder 프로퍼티가 생겼다.
'이것을 TRUE로 설정하면 DefaultPath, SaveAs 등등에 지정한 폴더가 존재하지 않을 경우 폴더를 자동으로 생성한다.
uploadform.AutoMakeFolder		= True
uploadform.defaultpath = server.mappath("\datafiles\")&"\sub07\"
uploadform.MaxFileLen			= 1024*1024*5

	id				= myId
	act				= uploadform.Form("act")
	st				= uploadform.Form("st")
	sMenu			= uploadform.Form("sMenu")
	arng			= uploadform.Form("arng")
	mode			= uploadform.Form("mode")
	name			= uploadform.Form("name")
	GR_INFO			= uploadform.Form("GR_INFO")
	group_			= Split(GR_INFO,"$$")
	group_seq		= group_(0)
	group_Name		= group_(1)
	'Response.write GR_INFO
	'respponse.end
	If arng <> "delete" Then start_time		= cdate(uploadform.Form("start_hour")&":"&uploadform.Form("start_minute"))
	If arng <> "delete" Then playTime		= uploadform.Form("playTime")
	end_time		= dateadd("n",playTime,start_time)
	content			= replace(uploadform.form("content"),"'","")
	reference		= replace(uploadform.form("reference"),"'","")
	hereafter		= uploadform.form("hereafter")
	If arng <> "delete" Then wdate			= cdate(uploadform.Form("w_year")&"-"&uploadform.Form("w_month")&"-"&uploadform.Form("w_day"))
	sYear			= uploadform.Form("w_year")
	sMonth			= uploadform.Form("w_month")
	sDay			= uploadform.Form("w_day")
	wte_device		= uploadform.Form("wte_device")
	seq				= uploadform.Form("seq")
	del_chk1		= uploadform.Form("del_chk1")
	del_chk2		= uploadform.Form("del_chk2")
	del_chk3		= uploadform.Form("del_chk3")
	state			= uploadform.Form("state")
	If state = ""  Then state = "0"


	filename1		= uploadform.Form("fn1").FileName
	filepath1		= uploadform.DefaultPath&"\"&filename1
	filesize1		= uploadform.Form("fn1").FileLen

	filename2		= uploadform.Form("fn2").FileName
	filepath2		= uploadform.DefaultPath&"\"&filename2
	filesize2		= uploadform.Form("fn2").FileLen

	filename3		= uploadform.Form("fn3").FileName
	filepath3		= uploadform.DefaultPath&"\"&filename3
	filesize3		= uploadform.Form("fn3").FileLen
	Gubun			= Request.cookies("member")("depart")
	user_ip			= request.servervariables("REMOTE_ADDR")
If arng = "write" Then
	sql="select count(*) from [GROUP_contents] where group_seq = "&group_seq&" and sDate='"&wdate&"'"
	Cnt =	SqlValue(Sql,1)
	If cnt > 0 Then
		Call EndGoURL("활동일지가 이미 등록되어 있습니다.")
	End if
	set rs=server.createobject("adodb.recordset")
	rs.open "GROUP_contents", Sql_connect(), adopenstatic, adlockpessimistic,adcmdtable
ElseIf arng = "edit" Or arng = "del" Then
	sql="select filename1, filename2, filename3 from [GROUP_contents] where seq="&seq
	filename_arr = SqlValue(Sql, 1)

	If del_chk1 = "on" Or filename1 <> "" Then
		If uploadform.FileExists(uploadform.DefaultPath & filename_arr(0,0)) then
			uploadform.DeleteFile uploadform.DefaultPath & filename_arr(0,0)
		end If
	End if
	If del_chk2 = "on" Or filename2 <> "" Then
		If uploadform.FileExists(uploadform.DefaultPath & filename_arr(1,0)) then
			uploadform.DeleteFile uploadform.DefaultPath & filename_arr(1,0)
		end If
	End if
	If del_chk3 = "on" Or filename3 <> "" Then
		If uploadform.FileExists(uploadform.DefaultPath & filename_arr(2,0)) then
			uploadform.DeleteFile uploadform.DefaultPath & filename_arr(2,0)
		end If
	End if
End If

If filename1 <> "" Then
	filename1 = file_name(filename1, "fn1")
End If
If filename2 <> "" Then
	filename2 = file_name(filename2, "fn2")
End If
If filename3 <> "" Then
	filename3 = file_name(filename3, "fn3")
End if

Select Case arng
	Case "write"
			with rs
				.addnew
				.fields("name")				= name
				.fields("id")				= id
				.fields("start_time")		= start_time
				.fields("end_time")			= end_time
				.fields("contents")			= content
				.fields("reference")		= reference
				.fields("hereAfter")		= hereAfter
				.fields("sDate")			= wdate
				.fields("playTime")			= playTime
				.fields("regDate")			= now()
				.fields("Gubun")			= gubun
				.fields("Filename1")		= Filename1
				.fields("Filename2")		= Filename2
				.fields("Filename3")		= Filename3
				.fields("group_seq")		= group_seq
				.fields("group_name")		= group_name
				.fields("wte_device")		= wte_device
				.fields("ip")				= user_ip
				.fields("state")			= 1
				.update
				.close
			end with
		If mode <> "admin" Then
			sql="select * from GROUP_MEMBER_attendance where id = '"&id&"' and group_seq="&group_seq&" and  sYear="&sYear&" and sMOnth="&sMonth
			rs.open sql, Sql_connect(), adopenstatic, adlockpessimistic,adcmdtext
			If rs.eof then
				rs.close
				rs.open "GROUP_MEMBER_attendance", Sql_connect(), adopenstatic, adlockpessimistic,adcmdtable
				with rs
					.addnew
					.fields("id")			= id
					.fields("name")			= Name
					.fields("sYear")		= sYear
					.fields("sMonth")		= Int(sMonth)
					.fields(""&int(sDay)&"")			= "1"
					.fields("group_name")	= group_name
					.fields("group_seq")	= group_seq
					.update
					.close
				 end with
			Else
					rs.close
					sql="select * from GROUP_MEMBER_attendance where id = '"&id&"' and group_seq="&group_seq&" and sYear="&sYear&" and sMOnth="&int(sMonth)
					rs.open sql, Sql_connect(), adopenstatic, adlockpessimistic, adcmdtext
					with rs
						.fields(""&int(sDay)&"")		= "1"
						.update
						.close
					 end with

			End If
		 End if
 Case "edit"
			set rs=server.createobject("adodb.recordset")
			sql="select * from GROUP_contents where seq="&seq
			rs.open sql, Sql_connect(), adopenstatic, adlockpessimistic,adcmdtext
			with rs
				.fields("start_time")		= start_time
				.fields("end_time")			= end_time
				.fields("contents")			= content
				.fields("reference")		= reference
				.fields("hereAfter")		= hereAfter
				.fields("sDate")			= wdate
				.fields("playTime")			= playTime
				If filename1 <> "" Then		.fields("Filename1")		= Filename1
				If filename2 <> "" Then		.fields("Filename2")		= Filename2
				If filename3 <> "" Then		.fields("Filename3")		= Filename3
				.fields("group_seq")		= group_seq
				.fields("group_name")		= group_name
				If state <> "" Then .fields("state")			= state
				.update
				.close
			end with
				'Response.write Sql
		If mode <> "admin" Then
			sql="select * from GROUP_MEMBER_attendance where id = '"&id&"' and group_seq="&group_seq&" and sYear="&sYear&" and sMOnth="&int(sMonth)
			rs.open sql, Sql_connect(), adopenstatic, adlockpessimistic,adcmdtext
			If rs.eof then
				rs.close
				rs.open "GROUP_MEMBER_attendance", Sql_connect, adopenstatic, adlockpessimistic, adcmdtable
				with rs
					.addnew
					.fields("id")			= id
					.fields("name")			= Name
					.fields("sYear")		= sYear
					.fields("sMonth")		= int(sMonth)
					.fields(""&int(sDay)&"")		= "1"
					.fields("group_name")	= group_name
					.fields("group_seq")	= group_seq
					.update
					.close
				 end with

			Else
				rs.close
				sql="select * from GROUP_MEMBER_attendance where id = '"&id&"' and group_seq="&group_seq&" and sYear="&sYear&" and sMOnth="&int(sMonth)
				rs.open sql, Sql_connect(), adopenstatic, adlockpessimistic, adcmdtext
				with rs
					.fields(int(sDay))			= "1"
					.update
					.close
				 end with
			End If
		End if
 Case "delete"
		Sql = "delete from GROUP_contents where Seq="&seq
		Sql = Sql &"; update GROUP_MEMBER_attendance set ["&int(sDay)&"] = NULL  where id = '"&id&"' and group_seq="&group_seq&" and sYear="&sYear&" and sMOnth="&Int(sMonth)
		'Response.write Sql
		Call RunSql(sql, 1)
 End Select
set rs=Nothing
If mode = "admin" Then
	response.redirect "/administrator/youth_group/gr_contents_list.asp?page="&page&"&GR_INFO="&GR_INFO
else
	response.redirect "/contents/sub07/?act="&act&"&st="&st&"&sMenu="&sMenu&"&page="&page&"&GR_INFO="&GR_INFO
End if
response.end
Call closeDB
Function file_name(filename, fileFlds)
		filepath		= uploadform.DefaultPath&"\"& filename

		If uploadform.Form(fileFlds).FileLen > 1024*1024*5 Then  '파일 용랼 제한
			Response.Write "<script language=javascript>"
			Response.Write " alert('파일 용량 제한입니다.\n\n1메가 이하의 자료만 업로드 할수 있습니다.');"
		    Response.Write " history.back();"
		    Response.Write "</script>"
		    Response.End
		end If
			'Response.write Mid(filename, InStrRev(filename, "."))
			if uploadform.FileExists(filepath) then
			   If InStrRev(filename, ".") <> 0 Then
				  filenameonly = Left(filename, InStrRev(filename, ".") - 1) '
				  file_ext = Mid(filename, InStrRev(filename, "."))
			   Else
				  filenameonly = filename
				  file_ext = ""
			   End If
				  i = 2
			   Do While (1)
				  filepath =  uploadform.DefaultPath & "\" & filenameonly & "[" & i & "]" & file_ext
				  If Not uploadform.FileExists(filepath) Then Exit Do
				  i = i + 1
			   Loop
				filename=filenameonly & "[" & i & "]" & file_ext
			end if
				UploadForm(fileFlds).SaveAs filepath
		file_name = filename
End Function


%>