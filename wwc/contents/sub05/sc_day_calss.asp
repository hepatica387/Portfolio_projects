<!--#include virtual="/LIB/_headinclude.asp"-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<% 
UserID			= request("UserID")
If UserID  = "" Then UserID	= MYID
week_day		= request("week_day")
um_day			= request("um_day")
Cur_Date		= request("Cur_Date")
Cur_Year		= request("Cur_Year")
Cur_Month		= request("Cur_Month")
If Cur_Date = "" And Cur_Year = "" Then 
	cur_date		= Date()	
ElseIf Cur_Date = "" And Cur_Year <> "" Then 
	Cur_Year		= request("Cur_Year")
	Cur_Month		= request("Cur_Month")
	Cur_Date		= dateserial(Cur_Year, Cur_Month, Day(now))
End If 


cur_Year		= Year(Cur_Date)
cur_Month		= Month(Cur_Date)
cur_Day			= Day(Cur_Date)
%>
<div id="contents_wrap" >	
	<!--#include virtual="/includefiles/global/curDate.asp" -->
	<!--#include virtual="/includefiles/global/cal_lunartosol.asp"-->	
	<div class="contecnt_wrap pdb20">
		<div class="ul-li-title left title2 bold cols-100"><%=cur_Year%>년 <%=cur_Month%>월 <%=cur_Day%>일 </div>
		<div class=" pdt20 f-right row" >		 
		<select name="curYear" class="form-input f-left mgr5" id="curYear" title="년">
			<%For i = 2018 To Year(now)+2%>
				<option value="<%=i%>" <%If Cur_Year = i Then RW("selected")%>><%=i%>년</option>
			<%next%>
		</select>
		<select name="CurMonth" class="form-input f-left mgr5" id="CurMonth" onchange="dateGo($('#curDay').val())" title="월">
			<%For i = 1 To 12%>
				<option value="<%=i%>" <%If Cur_Month = i Then RW("selected")%>><%=i%>월</option>
			<%next%>
		</select>
		<select name="curDay" class="form-input f-left mgr5" onchange="dateGo(this.value)" id="curDay" title="일">
			<%For i = 1 To 31%>
				<option value="<%=i%>" <%If cur_Day = i Then RW("selected")%>><%=i%>일</option>
			<%next%>
		</select>	
	</div>
		<table class="table table-bordered cols-100">
			<caption><%=curDate%> 시간별 일정표</caption>
			<colgroup>
				<col>
				<col>
			</colgroup>
			<thead>
			<tr>
			    <th scope="col" style="width:100px;" class="hid40 center active" > 시간 </th>
				<th scope="col" class="hid40 center active" > 내용</th>							
			</tr>
			</thead>
		<% For i = 0 To 23
			s_msg = ""
			If i = 0 Then 
				s_msg = "오전 12"
			ElseIf i < 12 Then 									
				s_msg = "오전 "&i
			ElseIf i = 12 Then
				s_msg = "낮 "&i								
			else
				s_msg = "오후 "&i-12
			End If	%>
			<tr>
			</thead>
			<tbody>
			<td style="width:100px;" class="bold right active" ><div style="width:90px;" class="mgr20"><%=s_msg%> 시</div></td>
				<% SFields = "seq, shour, sminute, subject, content, gubun"		
					  WhereSql = " where syear="&cur_Year&" and smonth = "&cur_month&" and sday="&cur_day 
					  whereSql = whereSql&" and sHour="&i
					  whereSql = whereSql & classNameSQl &"  order by seq"								
					  arrFlds  = SELECT_DATA("tbl_schedule", whereSql, SFields )
					  %>
					<td class="left">
						<%If Not IsNull(arrFlds) Then 
							For n = 0 To UBound(arrFlds,2)
								seq				= arrFlds(0,n)									
								shour			= arrFlds(1,n)
								If shour < 10 Then shour = "0"&shour
								sminute			= arrFlds(2,n)
								If sMinute < 10 Then sMinute = "0"&sMinute
								subject			= arrFlds(3,n)
								subject_v		= subject
								content			= arrFlds(4,n)
								gubun			= arrFlds(5,n)											
								startTime		= shour&":"&sMinute%>
								<a href="javascript:;" class="<%=colr%> hand mgt2 t_raudis_schedule pdl3 pdb2"  style="z-index:9999" onclick="etc_atten('<%=seq%>','view')" ><%=startTime& " " &subject_v %></a>
								<div>
							<%	Next							
						  End if%>		
					</td>							
			</tr>
		 <%next%>
		 </tbody>
		</table>		 
	</div>
</div>
<%
If IsObject(Db) Then
	If Not Db Is Nothing Then Set Db = Nothing
End If
%>

<script type="text/javascript">
 function dateGo() {	
	 var yy = $("#curYear").val(); 
	 var mm = $("#CurMonth").val(); 
	 var dd = $("#curDay").val(); 
	 var curDate	 = yy+'-'+mm+'-'+dd;
	$("#clasName").load("<%=self_page%>?sMenu=<%=sMenu%>&st=<%=st%>&cur_Date="+curDate);
}
</script>