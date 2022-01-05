<% response.expires=-1000 %>

<!--#include file="../../includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/Frm_injection_Chk.asp"-->
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   <title>BLANK PAGE</title>
 </head>
<!-- 레이어 팝업 -->
<%
	Flds = "seq, popWidth, popHeight, xposition, yPosition, title, content, bgcolor, title_hide "
	nDate	= Replace(Date, "-","")
	SQl = "select "&Flds&" from sitePopup where (sDate <= '"&nDate&"' and eDate >= '"& nDate&"') and state=1 order by seq desc"
	arrFlds	= sqlArray(sql, 1)
	If Not IsNull(arrFlds) Then
		For i = 0 To UBound(arrFlds, 2)
			seq				= arrFlds(0, i)
			popWidth		= arrFlds(1, i)
			popHeight		= arrFlds(2, i)
			xposition		= arrFlds(3, i)
			yPosition		= arrFlds(4, i)
			title			= arrFlds(5, i)
			content			= arrFlds(6, i)
			bgcolor			= arrFlds(7, i)
			title_hide		= arrFlds(8, i)
			If title_hide Then
				tHeight = popHeight + 80
			Else
				tHeight = popHeight + 40
			End If
			popchkUrl = "/includefiles/global/main_popchk.asp?popstr=popup1_"&seq

'cookieName = request.queryString("popstr")
'Response.Cookies(cookieName)				= "Y"
If Request.cookies("pop1_"&seq) = "" Then
%>
<div id="pop_<%=seq%>" style="position:absolute;width:<%=popWidth%>px;height:<%=tHeight%>px;left:<%=xposition%>px;top:<%=yPosition%>px;z-index:<%=1090 + i%>;background-color:<%=bgcolor%>;border:2px solid #ddd;">
	<div class="cols-100 hid40 t500 center title2 pdt5"><%=title%><%=Request.cookies("pop1_"&seq)%></div>
	<div class="cols-100" style="height:<%=popHeight%>px;overflow:hidden"><%=content%></div>
 <form name="pFRM" method="post" action="/inclidefiles/global/main_popchk.asp" target="pop">
	<div style="height:40px;background:#000;" class="flex">
		<input type="hidden" name="pop_<%=seq%>" value="Y" >
		<div class="cols-70 center bg-black pdt5"><input type="checkbox" name="pop1_<%=seq%>" value="Y" > <a href="javascript:;" onclick="document.pFRM.submit()">하루동안 보지않기</div>
		<div class="cols-25 right pdt3"><a href="<%=popchkUrl%>">닫기</div>
	</div>
</form>
</div>
<%End if%>
<%		Next
	End if%>
<IFRAME style='display:none' name='pop' id='pop' ></IFRAME>
<!-- 레이어 팝엉 끝 -->

<%
'cookieName = request.queryString("popstr")
'Response.Cookies(cookieName)				= "Y"
'Response.Cookies(cookieName).Expires		= Date()+1

'Response.redirect "/"
%>
 <body>
 </body>
</html>
<%response.end%>