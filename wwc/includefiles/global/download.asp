<%@ Language=VBScript EnableSessionState="False"%>
<!--#include virtual='/includefiles/func/function.file.asp'-->
<!--#include virtual='/includefiles/func/function.util.asp'-->
<% 
Response.CharSet = "UTF-8"
Filename	= Request("filename")
FilePath	= server.mappath("\")&"\dataFiles\"
filepath	= filepath&filename 

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

		set objDownload=Server.Createobject("dext.filedownload")
		objDownload.Download filepath, filename, true, false
		set objDownload=Nothing
Set objDownload = Nothing
response.end%>