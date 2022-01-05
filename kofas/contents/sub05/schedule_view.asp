<!--#include virtual="/LIB/_headinclude.asp"-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/includefiles/global/global_head.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<%
mode			= getRequest("mode", REQUEST_GET)
seq				= getRequest("seq", REQUEST_GET)
mode_MSG		= "내용"
cur_date		= getRequest("cur_Date", REQUEST_GET)
cur_Year		= Year(Cur_Date)
cur_Month		= Month(Cur_Date)
cur_Day			= Day(Cur_Date)
If mode = "view" Then 
	sFlds = "shour, sminute, subject, content, sYear, sMonth, sDay"
	strSql = "exec pro_hepatica_select tbl_schedule, '"&sFlds&"',' where seq="&seq&"'"
	arrFlds = sqlArray(strSql, 1)
		shour					= arrFlds(0,0)
		sminute					= arrFlds(1,0)
		subject					= arrFlds(2,0)
		content					= Replace(arrFlds(3,0), vblf ,"<br/>")
		sYear					= arrFlds(4,0)
		sMonth					= arrFlds(5,0)
		sDay					= arrFlds(6,0)
		
		start_date				= sYear&"년 "&sMonth&"월 "&sDay &"일 "& FormatDateTime(shour&":"&sminute)
		
End If%>
<nav class="pdr10 navbar navbar-default shadow">
  <div class="container-fluid">
	<div class="navbar-header pdl20 f-left"><h4 class="bold t-primary">일정<%=mode_MSG%></h4></div>	
	<div class="navbar-header pdl20 f-right"><a href="javascript:;" onclick="$('#schedule').hide();$('#d-<%=seq%>').focus();" class="btn-close"><span class="el el-remove mgt15 text-gray"></span><span class="ir">닫기</span></a></div>	
  </div>
</nav>	
<div class="cols-100 center" style="overflow-y:scroll;margin:-18px 0 0 0;height:550px">	
	<table class="table table-bordered">	
		<caption>일정 세부내용입니다.</caption>
		<colgroup>
			<col class="cols-20">
			<col class="cols-80">
		</colgroup>
		<tbody>
		<tr>
			<th class="active center"><label>제목</label></th>
			<td class="left"  colspan="3"><%=subject%></td>
		</tr>
		<tr>
			<th class="active center"><label>일정 시간</label></th>
			<td class="left" colspan="3"><%=start_date%> </td>
		</tr>									
		<tr>
			<th class="active center"><label>내용</label></th>
			<td class="hid300 left top" colspan="3"><%=content%></td>
		</tr>	
		</tbody>
	</table>
	<div class="cols-md-12 center pdb50">									
		<a href="javascript:;" onclick="$('#schedule').hide();$('#d-<%=seq%>').focus();" class="btn btn-default">닫기</a>
	 </div>
</div>	
<script>
	$(document).ready(function(){
		$(".btn-close").focus();
	});

</script>
<!--#include virtual="/includefiles/global/global_foot.asp"-->