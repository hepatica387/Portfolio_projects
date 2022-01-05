<%
page			= request("page")
search			= request("search")
searchstr		= request("searchstr")
if page = "" or page = "0" then	page = 1

if searchstr <> "" And search <> "" Then
	searchSql  = " and "&search&" like '%"&searchstr&"%'"
end If

setParams		= "page="&page&"&search="&search&"&searchstr="&searchStr

pageSize		= 15
whereSql		= " where A.Userid='"&MYID&"' " & searchSql
Flds			= " count(A.seq) "

db_table			= " TBL_APPLY A INNER JOIN TBL_PRODUCT B ON A.product_seq = B.seq"
Field			= " A.seq, B.kofascode, A.apply_company, B.category, A.phone, A.email, convert(varchar(10), A.regDate, 120)  regdate, A.apply_state, A.status"
Field			= Field &", B.titlefirst, B.titlesecond "
strSql			= "select "&Flds&" from "& db_table & whereSql
RS_COUNT		= SqlValue(strSql, 1)

	pagecount = int((rs_count - 1) / pagesize ) + 1
	sub_Top_Limit = (rs_count - ( page-1 ) * pagesize )
    Top_Limit = pagesize
    if Top_Limit > sub_Top_Limit then Top_Limit = sub_Top_Limit
	strSql = "Select * from (select row_number() over(order by A.seq desc) as rowNo "
	StrSql = strSql & ", "&Field &" from "&db_table & whereSql &") C  where C.Rowno between "&(pagesize*(Page-1))+1& " and "&(Top_Limit + (pagesize*(Page-1)))

	arrFields	= SqlArray(strSql, 1)
	%>
	 <table class="table table-hover border-bottom "  summary="메뉴 목록">
		<tr class="bg-mute ">
			<th style="padding:10px " class="center t500">번호</th>
			<th class="center t500">카테고리</th>
			<th class="center t500">부품영</th>
			<th class="center t500">코파스코드</th>
			<th class="center t500">주문여부</th>
			<th class="center t500">상 태</th>
			<th class="center t500">주문일</th>
		</tr>
		<%If Not isnull(arrFields) Then
			For i = 0 To ubound(arrFields, 2)
				num = rs_count - i - (page -1) * pagesize
				seq					= arrFields(1,i)
				kofascode			= arrFields(2,i)
				apply_company		= arrFields(3,i)
				cstrcategory		= arrFields(4,i)
				phone				= arrFields(5,i)
				email				= arrFields(6,i)
				regDate				= Replace(arrFields(7,i), "-",".")
				apply_state			= arrFields(8,i)
				If apply_state = "Y" Then
					apply_MSG		= "주문"
					font_cancel		= ""
				Else
					apply_MSG		= "<span class=""t-danger"">주문취소</span>"
					font_cancel		= "style=""text-decoration-line:line-through;color:#c0c0c0"""
				End If
				status				= arrFields(9,i)
				If status = "N" Then status_MSG	= "처리전" Else status_MSG	= "<span class=""t-success"">처리완료</span>"
				titlefirst			= arrFields(10,i)
				titlefirst			= arrFields(11,i)				%>
		<tr>
			<td style="padding:15px 10px"  class="center"><%=num%></td>
			<td <%=font_cancel%> class="center"><%=cstrcategory%></td>
			<td <%=font_cancel%> class="left EllipsText">
				<%If apply_state = "Y" Then%>
					<a href="javascript:;" onclick="product_view('<%=seq%>')">
				<%End if%>
				<%=titlefirst%></a>
			</td>
			<td <%=font_cancel%> class="center"><%=kofascode%></td>
			<td <%=font_cancel%> class="center"><%=apply_MSG%></td>
			<td <%=font_cancel%> class="center"><%=status_MSG%></td>
			<td <%=font_cancel%> class="center"><%=regDate%></td>
		 </tr>
		<% Next
		End If%>
	</table>
	<% Call ajaxPage("/contents/sub100/product_apply.asp","body-cont") %>