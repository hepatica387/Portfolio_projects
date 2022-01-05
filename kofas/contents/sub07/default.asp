<!--#include virtual="/LIB/_Headinclude.asp"-->
<%  act		= Request("act") %>
<!--#include virtual="/includefiles/global/board_header.asp"-->
<!--#include virtual="/LIB/pageFind.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<%
'회원 이용 권한 제한 (회원아이디, 회원레벨, 항목이용권한, 메뉴이용권한, 관리자아이디)
'Call MemberChk(MYID, MyLevel, 12, 12, "admin")
Call youth_member() ' 브라보실버/멘토/청소년 조직화
 GR_INFO	= Request("GR_INFO")
 If  GR_INFO <> "" Then
	group_			= Split(GR_INFO,"$$")
	group_seq		= group_(0)
	group_Name		= group_(1)
	group_sql		= " and group_seq="&group_seq
Else
	group_sql = " and ("
	sql="select distinct group_seq, group_name from youth_GROUP_MEMBER where id='"&myID&"' order by group_name"
	arrflds = SqlArray(Sql, 1)
	If Not isnull(arrflds) Then
	  For l = 0 To ubound(arrflds,2)
		 group_sql = group_sql & " group_seq = "&arrflds(0,l)&" or"
	  Next
		group_sql = left(group_sql, Len(group_sql)-3) &" )"
	Else
		group_sql		= " and group_seq=0"
	End If
	'Response.write group_sql
	'Response.end
End if
dim page, boardid,arng
page = request("page")
if page="" or page = "0" then page=1


if request("searchstr")="" then
	search="name"
else
	search=request("search")
	searchstr=request("searchstr")
end if
st = Request("st")
sMenu = Request("sMenu")
pageSize = 2

 If CStr(myLevel) >= "12" then
	ID_SQL = " ID = '"&MyID&"' and "
	pro_ID_SQL = " ID = ''"&MyID&"'' and "
 End If


sql="select count(seq) as reccount from GROUP_contents where " &search&" like '%"&searchstr&"%'" & group_sql

rs_count  = SqlValue(sql, 1)
pagecount = int((rs_count-1)/pagesize)+1

sub_Top_Limit = ( rs_count - ( page-1 ) * pagesize )
Top_Limit = pagesize
if Top_Limit > sub_Top_Limit then Top_Limit = sub_Top_Limit

whereSql = "where  " & search&" like ''%"&searchstr&"%'' " & group_sql
sqlFields = "SEQ, name, id, start_time, end_time, contents, reference, hereAfter, sDate, playTime, regDate, Filename1, Filename2, Filename3, group_seq, group_name, wte_device, ip, state"
strSql = "exec pro_default_list '"&sqlFields&"', 'GROUP_contents', '"&Top_Limit&"','"&((Page-1) * pagesize)&"','"&whereSql&"'"
'Response.write strSql
'Response.end
arrFields = SQLArray(strSql, 1)%>
<script language="javascript">
function sch() {
	return ;
}
function del(seq, id, syear, smonth, sday, GR_INFO) {
	if (confirm('활동 보고서를 삭제 하겠습니까?')){
		//location.href ='/includefiles/global/group_contents_prog.asp?seq='+seq+'&sYear='+syear+'&smonth='+smonth+'&sday='+sday+'&id='+id+'&GR_INFO='+GR_INFO+'&st=<%=st%>&sMenu=<%=sMenu%>&page=<%=page%>&arng=del';
		document.form1.seq.value		= seq;
		document.form1.w_year.value		= syear;
		document.form1.w_month.value	= smonth;
		document.form1.w_day.value		= sday;
		document.form1.id.value			= id;
		document.form1.GR_INFO.value	= GR_INFO;
		document.form1.arng.value		= "delete";
		document.form1.submit();
	}

}

function coment_load( v1, v2 ) {
	$("#"+v1).load("coment.asp?parent_seq="+v2+"&page=<%=page%>&act=<%=act%>");
}
</script>
 <link rel="stylesheet" href="/includefiles/css/sub03.css" type="text/css" />
 <div id="sub_content" class="cols-90 col-rg-100 col-md-100 col-sm-100 col-mi-12">
			<div class="mgl10 ">
				<form name="search_frm" method="get" class="form-inline" role="form" onsubmit="return sch(this)">
							<div class="input-group">
							  <select name="GR_INFO" class="form-control wid200 ">
									<option value="">그룹 선택</option>
									<% sql="select distinct group_seq, group_name from youth_GROUP_MEMBER where id='"&myID&"' order by group_name"
										arrflds = SqlArray(Sql, 1)

									 If Not IsNull(arrflds) Then
										For z = 0 To UBound(arrflds,2)
											'seq			= arrflds(0,i)
											GR_SEQ		= arrflds(0,z)
											GR_NAME		= arrflds(1,z)%>
											<option value='<%=GR_SEQ&"$$"&GR_NAME%>' <%If CStr(GR_SEQ) = CStr(group_seq) Then  Response.write "selected"%> ><%=GR_NAME%></option>
										<%Next
									End If
									%>
								</select>
							  <span class="input-group-btn">
								<input type="submit" value="확인" class="btn btn-info"/>
							  </span>
							</div><!-- /input-group -->

					<input type="hidden" value="<%=st%>"  name="st"/>
					<input type="hidden" value="<%=sMenu%>"  name="sMenu"/>
					<input type="hidden" value="<%=page%>"  name="page"/>
				</form>
			</div>
			<div id="sub03-02" class="pdl10 mgt10 ">
<%	If Not 	IsNull(arrFields) Then
For i = 0 To UBound(arrFields,2)

	num = rs_count - i - (Page - 1) * PageSize
	SEQ				= arrFields(0,i)
	name			= arrFields(1,i)
	id				= arrFields(2,i)
	start_time		= arrFields(3,i)
	end_time		= arrFields(4,i)
	contents		= arrFields(5,i)
	contents			= replace(contents,vblf,"<br>")
	reference		= arrFields(6,i)
	reference		= replace(reference,vblf,"<br>")
	hereAfter		= arrFields(7,i)
	hereafter		= replace(hereafter,vblf,"<br>")
	sDate			= arrFields(8,i)
	w_year			= left(sDate,4)
	w_month			= mid(sDate,6,2)
	w_day			= right(sDate,2)
	playTime		= arrFields(9,i)
	regDate			= arrFields(10,i)
	Filename1		= arrFields(11,i)
	Filename2		= arrFields(12,i)
	Filename3		= arrFields(13,i)
	group_seq		= arrFields(14,i)
	group_name		= arrFields(15,i)
	wte_device		= arrFields(16,i)
	ip				= arrFields(17,i)
	state			= arrFields(18,i)
	content			= NoScript(content)
	reference		= NoScript(reference)
	hereafter		= NoScript(hereafter)
	Sql_str = "select ["&CInt(w_day)&"] from GROUP_MEMBER_attendance where id='"&MYID&"' and group_seq='"&group_seq&"' and sYear="&w_year&" and sMonth="&w_month
   	atten_state	= SqlValue(Sql_Str,1)

	%>
	<TABLE cellspacing="0" class="table table-bordered">
		 <tr align="center" >
			<th class="center "  bgcolor="#FAFEFA">활동 그룹</th>
			<td colspan="2" class="left"><%=Group_Name%></td>
			<th class="center" >
				<%If isnull(atten_state) Or atten_state = "" Then
					sql_str = "select name from youth_GROUP_MEMBER where id='"&MYID&"' and group_seq="&group_seq
					my_name = SqlValue(sql_str,1)

					If Not isnull(my_name) Then %>
					 <a href="attendance_prog.asp?act=<%=act%>&id=<%=MYID%>&GR_INFO=<%=group_seq&"$$"&server.Urlencode(group_name)%>&wDate=<%=sDate%>&page=<%=page%>&name=<%=server.Urlencode(Myname)%>" class="btn btn-success btn-xs">출석확인</a>
				<%	End if
				End if%>
			</th>
		  </tr>
		 <tr >
			<th class="center cols-15" bgcolor="#FAFEFA">등록자</th>
			<th class="center cols-30" bgcolor="#FAFEFA">날 짜</th>
			<th class="center cols-40" bgcolor="#FAFEFA">활동시간</th>
			<th class="cols-15 center"><div>
			<%if (Myid = ID And Myid <> "" ) or adminView then %>
			<a href="write.asp?act=<%=act%>&st=<%=st%>&sMenu=<%=sMenu%>&seq=<%=seq%>&arng=edit&gr_info=<%=group_seq&"$$"&server.Urlencode(group_Name)%>" class="btn btn-xs btn-default " >수정</a>
			<a href="#" onclick="del('<%=seq%>','<%=id%>','<%=Left(sDate,4)%>','<%=Mid(sDate,6,2)%>','<%=Mid(sDate,9,2)%>','<%=group_seq&"$$"&server.Urlencode(group_Name)%>')" class="btn btn-xs btn-danger" style="color:#FFF" >삭제</a>

			<%End if%>
			</div>
			</th>
		  </tr>
		  <tr align="center" >
			<td><%=name%></td>
			<td><%=sDate%></td>
			<td colspan="2"><%=start_time%> ~ <%=end_time%> (<%=playTime%>분)</td>
		  </tr>
		  <th class="center "  bgcolor="#FAFEFA">출석확인</th>
			<td colspan="3">
			<%Sql_str = "select name, ID from GROUP_MEMBER_attendance where group_seq='"&group_seq&"' and sYear="&w_year&" and sMonth="&w_month&" and ["&CInt(w_day)&"] = 1 order by seq"
			  ' Response.end
				atten_arr	= SqlArray(Sql_str,1)
				If not isnull(atten_arr) Then
					For z = 0 To ubound(atten_arr,2)
						atten_name		= atten_arr(0,z)
						birthDay    = atten_arr(1,z)%>
						<span class="label label-default"><%=atten_name%> [<%=birthDay%>]</span>
				<%	next
				 End If
			%>
			</td>
		  </tr>
		  <tr>
			<th bgcolor="#FAFEFA" class="cols-15 col-rg-15 col-md-15 col-sm-15 col-mi-20 center">활동내용</th>
			<td colspan="4"><div align="justify"><%=contents%></td>
		  </tr>
		  <tr>
			<th class="center" bgcolor="#FAFEFA"  >전달 및<br/> 문의사항</th>
			<td colspan="4"><%=reference%></td>
		  </tr>
		  <tr>
			<th class="center" bgcolor="#FAFEFA" >향후계획</th>
			<td colspan="4"><div align="justify"><%=hereafter%></td>
		  </tr>
		  <tr>
			<th class="center" bgcolor="#FAFEFA" >비고</td>
			<td colspan="4">
				<%If filename1 <> "" then%>
					<a href="download.asp?filename=<%=filename1%>&seq=<%=seq%>" class="btn btn-default btn-xs"><%=filename1%></a>
				<%End if%>
				<%If filename2 <> "" then%>
					<a href="download.asp?filename=<%=filename2%>&seq=<%=seq%>" class="btn btn-default btn-xs"><%=filename2%></a>
				<%End if%>
				<%If filename3 <> "" then%>
					<a href="download.asp?filename=<%=filename3%>&seq=<%=seq%>" class="btn btn-default btn-xs"><%=filename3%></a>
				<%End if%>

			</td>
	  </tr>
	</table>
	<Div id="coment_<%=seq%>"></div>
	<script>$('#coment_<%=seq%>').load("coment.asp?act=<%=act%>&st=<%=st%>&sMenu=05&parent_seq=<%=seq%>&page=<%=page%>");</script>
<% Next
End If%>
	<a href="write.asp?act=<%=act%>&st=<%=st%>&sMenu=<%=sMenu%>&GR_INFO=<%=server.UrlEncode(GR_INFO)%>" class="btn btn-default">글쓰기</a>
	<%=PageStr("./")%>
	</div>
</div>

<form  method="post" name="form1" enctype="multipart/form-data" action="/includefiles/global/group_contents_prog.asp">
	<input type="hidden" value=""  name="seq"/>
	<input type="hidden" value=""  name="w_year"/>
	<input type="hidden" value=""  name="w_month"/>
	<input type="hidden" value=""  name="w_day"/>
	<input type="hidden" value=""  name="id"/>
	<input type="hidden" value=""  name="GR_INFO"/>
	<input type="hidden" value="<%=st%>"  name="st"/>
	<input type="hidden" value="<%=sMenu%>"  name="sMenu"/>
	<input type="hidden" value="<%=page%>"  name="page"/>
	<input type="hidden" value="<%=act%>"  name="act"/>
	<input type="hidden" value=""  name="arng"/>
</form>
<!--#include virtual="/includefiles/global/board_footer.asp"-->

