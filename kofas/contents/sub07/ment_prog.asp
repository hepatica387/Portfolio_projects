<!--#include virtual="/LIB/CharSet_utf.asp"-->
<!--#include virtual="/LIB/_Headinclude.asp"-->
<!--#include virtual="/LIB/frm_injection_chk.asp"-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<%
Dim Page, name, content, seq, ref, re_step, re_level,pwd, boardid, group
parent_seq			= Request("parent_seq")
name				= Request.form("name")
content				= Request.form("ment")
content				= noScript(content)
content				= replace(content,"""","&quot;")
content				= replace(content,"'","&#39;")
pwd					= Request.form("pwd")
seq					= Request.form("seq")
db_table			= request.form("db_table")
user_ip				= request.servervariables("REMOTE_ADDR")
ID					= Request("id")
page				= Request("page")
arng				= Request.form("arng")
wte_device			= Request.form("wte_device")


Select Case arng
	Case "write" ,"reply"
		SqlFields = "Max(co_ref)"
	    coSql = "exec Pro_hepatica_select '"&db_table&"','"&SqlFields&"', '"&whereSql&"'"
		Response.write coSql
		co_ref = SqlValue(coSql, 1)
		if Isnull(co_ref) then		'현재까지 가져온 데이타가 없을 경우
			number = 1			'현재 글번호용 변수에 1을 셋팅한다.
		else						'현재 가져온 데이터가 있을경우
			number = co_ref + 1		'그 번호에 1을 더해서 현재의 글의 넘버에 셋팅한다.
		end If
		if request("co_ref") <> "" then
			co_ref = Request("co_ref")
			co_re_step = Request("co_re_step")
			co_re_level = Request("co_re_level")
			Call coRefUpdateQuery()
			co_re_step=co_re_step + 1
			co_re_level=co_re_level + 1
		else
			co_ref = number
			co_re_step=0
			co_re_level=0
		end If

		SqlField = "PARENT_SEQ, NAME, ID, PWD, WDATE, CO_REF, CO_RE_LEVEL, CO_RE_STEP, IP, MENT, wte_device "
		valueFields = PARENT_SEQ&",'"&NAME&"','"&ID&"','"&PWD&"','"&Now()&"',"&CO_REF&","&CO_RE_LEVEL&","&CO_RE_STEP&",'"&user_ip&"','"&content&"','"&wte_device&"'"
		strSql = "Insert into "&db_table&" ("&SqlField&") values ("&valueFields&")"
		'Response.write StrSql
		Call RunSQL(strSQL, 1)
	Case "edit"
		if (Myid = id and Myid <> "" ) or adminView then
			strSql = "update "&db_table&" set ment = '"&content&"', ip = '"&user_ip&"' where seq="&seq
			'RW(strSql)
			'Response.end
			Call RunSQL(strSQL, 1)
		End If

	Case "del"
		if (Myid = id And myID <> "") or adminView then
			Sql = "delete from "&db_table&" where seq="&seq
			Call RunSql(Sql, 1)
		End If
End Select



'response.write seq&"<br>"
'response.write page&"<br>"
'response.write name&"<br>"
'response.write content&"<br>"
'response.write co_ref&"<br>"
'response.write co_re_step&"<br>"
'response.write co_re_level&"<br>"
'Response.write Sql
'response.end

'Call ComentInsertQuery()
context = "Page="&Page&"&parent_seq="&parent_seq&"&ref="&ref&"&re_step="&re_step&"&re_level="&re_level&"&boardid="&boardid&"&db_table="&db_table&"&coment_write_chk="&coment_write_chk
'skin/genieN/bottom_list.asp?boardid=support_board&page=1&parent_seq=7658&st=sub03&smenu=06&search=name&searchstr=&category=
%>
<script type="text/javascript">
	parent.coment_load( "coment_<%=parent_seq%>" ,"<%=parent_seq%>")
</script>
