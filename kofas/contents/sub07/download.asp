<%@ Language=VBScript EnableSessionState="False"%>
<!--#include virtual="/includefiles/func/function.file.asp"-->
<%

seq = Request("seq")
boardid= request("boardid")
Filename = Request("filename")
FilePath = server.mappath("\")&"\datafiles\sub07\"
filepath  = filepath&filename
up_component = "DEXT"

set objFS=server.createobject("scripting.filesystemobject")
if not objFS.fileexists(filepath) then %>
	<script language="javascript">
		alert("파일이 존재하지 않습니다");
		history.go(-1)
	</script>
<%End if
Set objFS = Nothing
	fnExt = fileExt(fileName)
	encodename = Server.UrlEncode(filename)
	delimiter  = InStrRev(encodename, "%2E")
	if delimiter <> 0 then
		tempname   = Left  ( encodename,  delimiter - 1 )
		temptype   = Right ( encodename,  Len(encodename) - delimiter - 2 )
		encodename = replace( tempname & "." & temptype, "+" ,"%20" )
	end if
	Response.AddHeader "Content-Disposition", "attachment;filename=" & encodename
  Select Case up_component
	Case "DEXT"

		set objDownload=Server.Createobject("dext.filedownload")
		objDownload.Download filepath, filename, true, false
		set objDownload=Nothing
	Case "TABS3.0","TABS4.0"
		Set objDownload = Server.CreateObject("TABS.Download")
		'웹 브라우저로 데이터를 전송합니다.

		boardid= request("boardid")
		Filename = Request("filename")
		FilePath = server.mappath("\")&"\board\data\"&boardid&"\"&Filename
		objDownload.FilePath = FilePath
		objDownload.TransferFile True

 End select

Set objDownload = Nothing
response.end%>