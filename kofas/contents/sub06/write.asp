<!--#include virtual="/LIB/_Headinclude.asp"-->
<%  act		= Request("act") %>
<!--#include virtual="/includefiles/global/board_header.asp"-->
<!--#include virtual="/LIB/pageFind.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<%
Call silver_member()' 브라보실버/멘토/청소년 조직화
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

	sqlFields = "name, id, start_time, end_time, contents, reference, hereAfter, sDate, playTime, Filename1, Filename2, Filename3, group_seq, group_name, health, health_ment, home, home_ment, meal, meal_ment, tar_content, tar_ask "
	sql = "select "&sqlFields&" from [silver_contents] where seq = "&seq
'	Response.write Sql
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
		health			= arrFlds(14,0)
		Select Case health
			Case 1
				h_active1	= "active"
			Case 2
				h_active2	= "active"
			Case 3
				h_active3	= "active"
		End Select
		health_ment		= arrFlds(15,0)
		home			= arrFlds(16,0)
		Select Case home
			Case 1
				home_active1	= "active"
			Case 2
				home_active2	= "active"
			Case 3
				home_active3	= "active"
		End Select
		home_ment		= arrFlds(17,0)
		meal			= arrFlds(18,0)
		Select Case meal
			Case 2
				m_active2	= "active"
			Case 3
				m_active3	= "active"
		End Select
		meal_ment		= arrFlds(19,0)
		tar_content		= arrFlds(20,0)
		tar_ask			= arrFlds(21,0)
	end If
Else
	w_year			= Year(now)
	w_month			= Month(now)
	w_day			= day(now)
	start_hour		= hour(now)
	start_minute	= minute(now)
	id				= MyID
	name			= MyName
	health			= 1
	h_active3		= "active"
	home_active3	= "active"
	m_active3		= "active"
	home			= 1
	meal			= 1
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
	  form.submit();
	return;
}
//-->
</script>
 <link rel="stylesheet" href="/includefiles/css/sub03.css" type="text/css" />
 <div id="sub_content" class="cols-100 col-rg-100 col-md-100 col-sm-100 col-mi-12">
			<div id="sub03-01" class="pdl10 pdt30">
					<form  method="post" name="form1" onsubmit="return send_it(this)" enctype="multipart/form-data"  class="form-inline" role="form" action="/includefiles/global/silver_contents_prog.asp">
						<TABLE cellspacing="0" class="table table-bordered">
						  <tr>
							<th class="center" bgcolor="#FAFEFA"><label for="name" class="pdt5">이름</label></th>
							<td><input type="text" name="name" maxlength="20" value="<%=MYname%>" readonly  placeholder="이름" class="form-control wid200"/></td>
						  </tr>
						  <tr>
							<th class="center middle" bgcolor="#FAFEFA"><label for="t_name" class="pdt5">활동 그룹</label></th>
							<td><select name="GR_INFO" class="form-control">
									<option value="">그룹 선택</option>
						<% sql="select distinct group_seq, group_name from youth_GROUP_MEMBER where id='"&myID&"' order by group_name"
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
							<th class="center " bgcolor="#FAFEFA"><label for="health" class="pdt5">어르신 상황</label></th>
							<td class="middle">
								<div class="flex mgl3">
								<label class="  mgr10">건강상태</label>
								<div class="btn-group " data-toggle="buttons">
									<label class="btn btn-default  <%=h_active3%>">
										<input type="radio" name="health" value="3" <%If health = "3" Then RW("checked")%>> 위급
									 </label>
									 <label class="btn btn-default  <%=h_active2%>">
										<input type="radio" name="health" value="2" <%If health = "2" Then RW("checked")%>> 약화
									 </label>
									 <label class="btn btn-default  mgr10 <%=h_active1%>">
										<input type="radio" name="health" value="1" <%If health = "1" Or health= "" Then RW("checked")%>> 양호
									 </label>
								 </div>
									 <input type="text" name="health_ment" value="<%=health_ment%>" placeholder="건강상태 의견"  class="form-control"/>
								</div>
								<div class="flex mgl3 mgt10">
									<label class="  mgr10">주거상태</label>
									<div class="btn-group " data-toggle="buttons">
										<label class="btn btn-default  <%=home_active3%>">
											<input type="radio" name="home" value="3" <%If home = "3" Then RW("checked")%>> 매우불결
										 </label>
										 <label class="btn btn-default  <%=home_active2%>">
											<input type="radio" name="home" value="2" <%If home = "2" Then RW("checked")%>> 약화
										 </label>
										 <label class="btn btn-default  mgr10 <%=home_active1%>">
											<input type="radio" name="home" value="1" <%If home = "1" Or home = "" Then RW("checked")%>> 양호
										 </label>
									 </div>
									<input type="text" name="home_ment" value="<%=home_ment%>" placeholder="주거상태 의견"  class="form-control"/>
								</div>
								<div class="flex mgl3 mgt10">
									<label class="  mgr10">식사지원</label>
									<div class="btn-group mgr10 " data-toggle="buttons">
										<label class="btn btn-default  <%=m_active3%>">
											<input type="radio" name="meal" value="3" <%If meal = "3" Then RW("checked")%>> 잘 챙겨드심
										 </label>
										 <label class="btn btn-default  <%=m_active2%>">
											<input type="radio" name="meal" value="2" <%If meal = "2" Or meal = "" Then RW("checked")%>> 잘 못드심
										 </label>
									 </div>
										<input type="text" name="meal_ment" value="<%=meal_ment%>" placeholder="식사사항 의견"  class="form-control"/>
									</div>
									<div class="mgt10">
										<label for="tar_content">기타어르신 상황</label>
										<textarea name="tar_content" style="width:95%;height:100px"  class="form-control" id="tar_content" wrap="virtual" placeholder="기타어르신 상황"><%=tar_content%></textarea>
									</div>
									<div class="mgt10">
										<label for="tar_ask">어르신 요청사황</label>
										<textarea name="tar_ask" style="width:95%;height:100px"  class="form-control" id="tar_ask" wrap="virtual" placeholder="기타어르신 상황"><%=tar_ask%></textarea>
									</div>
							</td>
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
							 <a href="javascript:;" style="color:#FFF" class="btn btn-primary btn-lg" onclick="send_it(document.form1)" />완료</a>
							 <a href="javascript:;" onclick="history.go(-1)" class="btn btn-default btn-lg" >취소</a>
						</div>
						<input type="hidden" name="st" value="<%=Request("st")%>">
						<input type="hidden" name="sMenu" value="<%=Request("sMenu")%>">
						<input type="hidden" name="arng" value="<%=arng%>">
						<input type="hidden" name="seq" value="<%=seq%>">
						<input type="hidden" name="page" value="<%=page%>">
						<input type="hidden" name="wte_device" value="">
					</form>

			</div>
		</div>
	</div>
</div>
<!--#include virtual="/includefiles/global/board_footer.asp"-->

<script type="text/javascript">
	  $(document).ready(function(){
		$('input[type=radio]').on('click',function(){
	      $(this).parent().eq(0).parent().eq(0).children().removeClass('active');
	      $(this).parent().eq(0).addClass('active');
	    });
	  });
</script>