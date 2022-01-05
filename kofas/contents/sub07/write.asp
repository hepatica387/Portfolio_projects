<!--#include virtual="/LIB/_Headinclude.asp"-->
<%  act		= Request("act") %>
<!--#include virtual="/includefiles/global/board_header.asp"-->
<!--#include virtual="/LIB/pageFind.asp"-->
<%
Call youth_member()' 브라보실버/멘토/청소년 조직화
GR_INFO = Request("GR_INFO")
 If  GR_INFO <> "" Then
	group_			= Split(GR_INFO,"$$")
	group_seq		= group_(0)
	group_Name		= group_(1)
	group_sql		= " and group_seq="&group_seq
End if
seq			= request("seq")
page		= request("pae")
arng		= request("arng")
If arng   = "" Then arng  = "write"

If arng = "edit" Then

	sqlFields = "name, id, start_time, end_time, contents, reference, hereAfter, sDate, playTime, Filename1, Filename2, Filename3, group_seq, group_name "
	sql = "select "&sqlFields&" from [GROUP_contents] where seq = "&seq
	'Response.write Sql
	'Response.end
	arrFlds = SqlArray(Sql,1)

	if not IsNull(arrFlds) then

		name			= arrFlds(0,0)
		id				= arrFlds(1,0)
		start_time		= arrFlds(2,0)
		end_time		= arrFlds(3,0)
		contents		= arrFlds(4,0)
		reference		= arrFlds(5,0)
		hereAfter		= arrFlds(6,0)
		sDate			= arrFlds(7,0)
		w_year			= left(sDate,4)
		w_month			= mid(sDate,6,2)
		w_day			= right(sDate,2)
		start_hour	= Replace(Mid(start_time,4,2),":","")
		start_m		=  Split(start_time,":")
		start_minute = start_m(1)
		playTime		= arrFlds(8,0)
		Filename1		= arrFlds(9,0)
		Filename2		= arrFlds(10,0)
		Filename3		= arrFlds(11,0)
		group_seq		= arrFlds(12,0)
		group_name		= arrFlds(13,0)

	end If
Else
	w_year			= Year(now)
	w_month			= Month(now)
	w_day			= day(now)
	start_hour		= hour(now)
	start_minute	= minute(now)
	id				= MyID
	name			= MyName
End If
%>

<script language="javascript">
<!--
function send_it(form)
{
	var wte_device = check_device(); // 디바이스 이름
	form.wte_device.value = wte_device;
	//이름
	if (form.name.value==""){
		alert("이름 입력하세요.");
		form.name.focus();
		return false; }
	//아이디
	if (form.GR_INFO[0].selected == true)
	{  alert("그룹을 선택하세요");
		return false;
	}
	//아이디
	if (form.playTime.value==""){
		alert("활동한시간을 입력하세요.");
		form.playTime.focus();
		return false;}
	if (isNaN(form.playTime.value)){
		alert("활동시간은 숫자만 입력이 가능합니다.");
		form.playTime.focus();
		return false;}
	//비밀번호
	if (form.content.value==""){
		alert("내용을 입력하세요.");
		form.content.focus();
			return false;}
	if (!form.fn1.value && !form.fn2.value && !form.fn3.value )	{
		alert("사진파일을 하나 이상 등록해야합니다.");
		form.content.focus();
			return false;
	}


	  form.submit();
	return;
}
//-->
</script>
 <link rel="stylesheet" href="/includefiles/css/sub03.css" type="text/css" />
 <div id="sub_content" class="cols-90 col-rg-100 col-md-100 col-sm-100 col-mi-12">
			<div id="sub03-01" class="pdl10 ">
					<form  method="post" name="form1" onsubmit="return send_it(this)" enctype="multipart/form-data"  class="form-inline" role="form" action="/includefiles/global/group_contents_prog.asp">
						<TABLE cellspacing="0" class="table table-bordered">
						  <tr>
							<th class="center" bgcolor="#FAFEFA"><label for="name" class="pdt5">이름</label></th>
							<td><input type="text" name="name" maxlength="20" value="<%=name%>" readonly  placeholder="이름" class="form-control wid200"/></td>
						  </tr>
						  <tr>
							<th class="center middle" bgcolor="#FAFEFA"><label for="t_name" class="pdt5">활동 그룹</label></th>
							<td><select name="GR_INFO" class="form-control">
									<option value="">그룹 선택</option>
						<% sql="select distinct group_seq, group_name from youth_GROUP_MEMBER where id='"&myID&"'  order by group_name"
						   arrflds = SqlArray(Sql, 1)
							 If Not IsNull(arrflds) Then
								For i = 0 To UBound(arrflds,2)
									'seq			= arrflds(0,i)
									GR_SEQ		= arrflds(0,i)
									GR_NAME		= arrflds(1,i)%>
									<option value='<%=GR_SEQ&"$$"&GR_NAME%>' <%If CStr(GR_SEQ) = CStr(group_seq) Then  Response.write "selected"%> ><%=GR_NAME%></option>
								<%Next
							End If
							%>
							</select>
							</td>
						  </tr>
						  <tr>
							<th class="center" bgcolor="#FAFEFA"><label for="w_year" class="pdt5">활동일</label></th>
							<td><select name="w_year" class="form-control">
										<% for i = Year(now)-1 to Year(now)+1 %>
										<option value="<%=i%>" <%if i = CInt(w_year) then response.write "selected" %>><%=i%>년</option>
										<%next%>
									   </select>
									   <select name="w_month" class="form-control">
										<% for i = 1 to 12 %>
										<option value="<%=i%>" <%if i = CInt(w_month) then response.write "selected" %>><%=i%>월</option>
										<%next%>
									   </select>
									   <select name="w_day" class="form-control">
										<% for i = 1 to 31 %>
										<option value="<%=i%>" <%if i = CInt(w_day) then response.write "selected" %>><%=i%>일</option>
										<%next%>
									   </select>
									   <select name="start_hour" class="form-control">
										<% for i = 1 to 24 %>
										<option value="<%=i%>" <%if CStr(i) = Cstr(start_hour) then response.write "selected" %>><%=i%>시</option>
										<%next%>
									   </select>
									   <select name="start_minute" class="form-control">
										<% for i = 0 to 59 step 1
												If i < 10 Then i = "0"&i%>
										<option value="<%=i%>" <%if CStr(i) = Cstr(start_minute) then response.write "selected" %>><%=i%>분</option>
										<%next%>
								 </select>
								</td>
						  </tr>
						  <tr>
							<th class="center" bgcolor="#FAFEFA"><label for="action_time" class="pdt5">활동시간</th>
							<td class=TD1><input name="playTime" type="text" id="playTime" size="5" maxlength="3" class="form-control" placeholder="60" value="<%=playTime%>" /> <span class="pdt5">분 (숫자로 입력하세요)</span></td>
						  </tr>
						  <tr>
							<th class="center " bgcolor="#FAFEFA" ><label for="content1">활동내용</label></th>
							<td><textarea name="content" style="width:95%;height:100px"  class="form-control" id="content" wrap="virtual"><%=contents%></textarea>
						  </tr>
						  <tr>
							<th class="center" bgcolor="#FAFEFA"><label for="reference">전달 및 문의사항</label></th>
							<td><textarea name="reference" style="width:95%;height:100px"  class="form-control" id="reference" wrap="virtual"><%=reference%></textarea></td>
						  </tr>
						  <tr>
							<th class="center" bgcolor="#FAFEFA"><label for="hereafter">향후계획</label></th>
							<td><textarea name="hereafter" style="width:95%;height:100px"  class="form-control" id="hereafter" wrap="virtual"><%=hereafter%></textarea></td>
						  </tr>
						  <tr>
							<th class="center" bgcolor="#FAFEFA"><label for="fn">첨부파일</label></th>
							<td> <input type="file" name="fn1" class="col-xs-80 hid25" />
								 <% If arng = "edit" And filename1 <> "" Then %>
									이전파일 : <%=filename1%> <input type="checkbox" name="del_chk1" > <label for="del_chk1">삭제</label>
								 <%End if%>
								 <input type="file" name="fn2" class="col-xs-80 hid25 mgt5" />
								 <% If arng = "edit" And filename2 <> "" Then %>
									이전파일 : <%=filename2%>  <input type="checkbox" name="del_chk2" > <label for="del_chk2">삭제</label>
								<%End if%>
								 <input type="file" name="fn3" class="col-xs-80 hid25 mgt5" />
								 <% If arng = "edit" And filename3 <> "" Then %>
									이전파일 : <%=filename3%>  <input type="checkbox" name="del_chk3" > <label for="del_chk3">삭제</label>
								<%End if%>
							</td>
						  </tr>
						  </td>
						  </tr>
						</table>
						<div class="center">
							 <a href="javascript:;" class="btn btn-primary btn-lg " onclick="send_it(document.form1)" />완료</a>
							 <a href="javascript:;" onclick="history.go(-1)" class="btn btn-default btn-lg" >취소</a>
						</div>
						<input type="hidden" name="st" value="<%=Request("st")%>">
						<input type="hidden" name="sMenu" value="<%=Request("sMenu")%>">
						<input type="hidden" name="arng" value="<%=arng%>">
						<input type="hidden" name="seq" value="<%=seq%>">
						<input type="hidden" name="page" value="<%=page%>">
						<input type="hidden" name="act" value="<%=act%>">
						<input type="hidden" name="wte_device" value="">
					</form>

			</div>
		</div>
	</div>
</div>
<!--#include virtual="/includefiles/global/board_footer.asp"-->

