<!--#include virtual="/LIB/_headInclude.asp"-->
<!--#include virtual="/LIB/pageFind.asp"-->

<%
page = request("page")
arng  = "activi"
if page="" or page = "0" then page=1
%>
<!-- 후원 안내 -->
<section class="section1">
  <div class="innerWrap">
    <div class="section1-cont1 mgb60" data-aos="fade-up" data-aos-delay="300" data-aos-duration="1100">
      <div class="spn-cont1">
        <h1 class="fontM">나눔은 사랑입니다.</h1>
        <p class="title3">여러의 조그만한 정성과 사랑 그리고 작은 마음이 모여
        어려운 이웃에게 큰 힘이 됩니다.</p>
      </div>
      <img src="/images/sub03/sub03-section1-bg.png" alt="나눔은 사랑입니다.여러의 조그만한 정성과 사랑 그리고 작은 마음이 모여 어려운 이웃에게 큰 힘이 됩니다.">
    </div>
		 <table  class="table table-bordered" summary="매월 후원자 들과 사용처 표 "  data-aos="fade-up" data-aos-delay="600" data-aos-duration="1100">
		 	<tbody>
			<%
				pagesize = 2
				WhereSql = " where s_name like ''%%'' and gubun=''activi''"
				SqlFields = " Count(*) "
				strSql = "exec Pro_hepatica_select 'supt_activi','"&SqlFields&"', '"&whereSql&"'"
				rs_count = SqlValue(strSql, 1)
				pagecount = int((rs_count-1)/pagesize)+1

				sub_Top_Limit = ( rs_count - ( page-1 ) * pagesize )
				Top_Limit = pagesize
				if Top_Limit > sub_Top_Limit then Top_Limit = sub_Top_Limit

				order_by = " order by s_Year desc, s_month desc "
				'WhereSql = " where s_name like ''%%'' "
				sqlFields = "seq, s_year, s_month, s_name, s_won, s_content"
				strSql = "exec [Pro_hepatica_List] '"&SqlFields&"', 'supt_activi', '"&Top_Limit&"','"&((Page-1) * pagesize)&"','"&whereSql&"', '"&order_by&"'"
				arrFields = SQLArray(strSql, 1)

		If Not IsNull(arrFields) Then
			For i = 0 To UBound(arrFIelds,2)
				num = rs_count-i-(Page-1)*PageSize
				seq = arrFields(0,i)
				wdate = arrFields(1,i)&"년 "&arrFields(2,i)&"월"
				s_name = NoScript(arrFields(3,i))
				s_won = arrFields(4,i)
				s_content = NoScript(arrFields(5,i))
				s_name = replace(s_name,vblf,"<br>")
				s_content = replace(s_content,vblf,"<br>")%>
				 <tr >
					<th colspan="2" class="active  center"><div class="t500 pdt10 pdb10"><%=wdate%></div></td>
				 </tr>
				 <tr >
					<th class="cols-15 center">후원액</th>
					<td><%=s_won%></td>
				</tr>
				<tr>
					<th class="cols-15 center">후원자</th>
					<td ><div class="cols-98"><%=s_name%></div></td>
				</tr>
				<tr>
					<th class="cols-15 center">사용처</th>
					<td><div align="justify"><%=s_content%></div></td>
				</tr>
		<%Next
		End If %>
				</tbody>
			</table>
		  <%Call ajaxPage_rewrite("/sub03/03","body-cont") %>

  </div>
</section>








<!--#include virtual="/includefiles/global/foot.asp"-->