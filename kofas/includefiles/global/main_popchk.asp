<% response.expires=-1000 %>
<%On Error Resume Next
If Request.form("popup_view") <> "" Then
	Response.Cookies(Request.form("popup_view"))				= "Y"
	Response.Cookies(Request.form("popup_view")).Expires		= Date()+1
	Response.End
Else

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
	If Request.cookies("pop1_"&seq) = "" Then%>
	<div class="popup_wrap" id="pop_<%=seq%>" style="position:absolute;width:<%=popWidth%>px;height:<%=tHeight%>px;left:<%=xposition%>px;top:<%=yPosition%>px;z-index:<%=1090 + i%>;background-color:<%=bgcolor%>;">
		<%If title_hide then%>
		<div class="cols-100 hid40 t500 center title2 pdt5"><%=title%><%RW(title_hide)%></div>
		<%End if%>
		<div class="cols-100" style="height:<%=popHeight%>px;overflow:hidden"><%=content%></div>
	 <form name="pFRM" method="post" action="/includefiles/global/main_popchk.asp" target="pop">
		<div style="height:40px;background:#000;" class="flex">
			<input type="hidden" name="popup_view" value="<%="pop1_"&seq%>" >
			<div class="cols-70 center bg-black pdt5" ><a href="javascript:;" onclick="document.pFRM.submit();$('#pop_<%=seq%>').hide();" style="color:#fefefe" class="t400"> <i class="fa fa-check-square-o"></i> 하루동안 보지않기</div>
			<div class="cols-25 right pdt3"><a href="javascript:;" onclick="$('#pop_<%=seq%>').hide();" style="color:#fefefe" class="t400"><i class="fa fa-window-close-o"></i> 닫기</div>
		</div>
	</form>
	</div>
	<%End if%>
	<%		Next%>
	<script>
	$(document).ready(function(){
		var winWid		= $(window).width();
		var left_margin	= 100;
		$(".popup_wrap").each(function(e){
			if (winWid < 1000 && winWid > 600){
				$(this).css({"left":(left_margin * e)+"px"});
			}else if (winWid <= 600){
				$(this).css({"left":"0px","width":+winWid+"px"});
			}
		});

	});
	</script>
	<%RW("<IFRAME style='display:none' name='pop' id='pop' ></IFRAME>")
	End If
End If %>
<!-- 레이어 팝엉 끝 -->