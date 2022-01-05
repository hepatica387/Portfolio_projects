<% response.expires=-1000 %>
<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/Frm_injection_Chk.asp"-->
<%
seq		= getRequest("seq" , REQUEST_GET)
strSql = "update TBL_APPLY set apply_state = 'N' where seq='"&seq&"'"
Call RunSql(strSql, 1)
MSG		= "주문이 정보가 취소되었습니다."
Call closeDB
%>
<script>
	alert("<%=MSG%>");
	parent.product_view('');
</script>