<%
'======================================================================================
' 게시판 목록 버튼
'======================================================================================

Function PageStr(selfpage )
	  If Request.QueryString("page") = "" And Request.QueryString("board") = "" Then
		page_str = Replace(Request.form,"&page="&Request("page"),"")
	 else
		page_str = Replace(Request.QueryString,"&page="&Request("page"),"")
	 End if
	 page_str = Replace(page_str,CStr("page="&Request("page"))&"&","")
	 page_str = Replace(page_str,"&&&","")
	 page_str = Replace(page_str,"&&","")
	'Response.write ListBtn()
	 str = "<div style=""width:"&table_width&";font-size:97%"" align=""center"" ><table cellspacing=0 width='100%' height='23'>"
	  str = str&"<tr><TD width='100%' colspan='2' height='23'><div align=""center"" >"
	  str = Str &"<ul class=""pagination "" >"
	  str = Str &"<li><a href='"&selfpage&"?"&page_Str&"' alt='처음' >처음</a></li>"
	  dim blockpage
		blockPage=Int((page-1)/5)*5+1
		'************************ 이전 10 개구문 시작 ***************************
		if blockPage > 5  Then
			 str = Str &"<li><a href='"&self_page&"?page="&blockPage-1&"&"&page_Str&"' alt=""이전 5개""  title='이전5개'>이전</a></li>"
		End If
		i = 1
		Do Until i > 5 or blockPage > pagecount
			If blockPage = int(page) Then '현재페이지 일때 링크하지 않는다
				str = str&" <li class=""active""><a style='color:red;background:#ededed;font-weight:500' >"&blockPage&"</a></li>"
			Else
				str = str&" <li ><a href='"&selfpage&"?page="&blockPage&"&"&page_Str&"&' >"&blockPage&"</a></li>"
			End If

			blockPage = blockPage + 1
			i = i + 1
		Loop

	  if blockPage > pagecount Then
	  Else
			 str = Str &"	<li><a href='"&selfpage&"?page="&blockPage&"&"&page_Str&"' title='다음5개'>다음</a></li>"
	  End If
	  str = Str &"	<li class=""hidden-phone""><a href='"&selfpage&"?page="&pagecount&"&"&page_Str&"' title='마지막 페이지'>마지막</a></li>"
	  str = Str &" </ul>"
	str = str&"</div></td></tr>"
	str = str&"<tr></table></div>"
	PageStr = Str
End Function

Function PageStr_Form(selfpage )
	 str = "<div style=""width:"&table_width&";font-size:97%"" align=""center"" ><table cellspacing=0 width='100%' height='23' summay=''>"
	  str = str&"<tr><TD width='100%' colspan='2' height='23'><div align=""center"" >"
	  str = Str &"<ul class=""pagination "" >"
	  str = Str &"<li><a href='javascript:;' onclick=""list_(1)"" alt='처음' >처음</a></li>"
	  dim blockpage
		blockPage=Int((page-1)/10)*10+1
		'************************ 이전 10 개구문 시작 ***************************
		if blockPage > 5  Then
			 str = Str &"<li><a href='javascript:;' onclick=""list_("&blockPage-1&")"" alt=""이전 5개""  title='이전5개'>이전</a></li>"
		End If
		i = 1
		Do Until i > 10 or blockPage > pagecount
			If blockPage = int(page) Then '현재페이지 일때 링크하지 않는다
				str = str&" <li class=""active""><a style='color:red;background:#ededed;font-weight:500' >"&blockPage&"</a></li>"
			Else
				str = str&" <li ><a href='javascript:;' onclick=""list_("&blockPage&")""  alt='"&blockPage&" '>"&blockPage&"</a></li>"
			End If

			blockPage = blockPage + 1
			i = i + 1
		Loop

	  if blockPage > pagecount Then
	  Else
			 str = Str &"	<li><a href='javascript:;' onclick=""list_("&blockPage&")"" title='다음5개'>다음</a></li>"
	  End If
	  str = Str &"	<li class=""hidden-phone""><a href='javascript:;' onclick=""list_("&pagecount&")"" title='마지막 페이지'>마지막</a></li>"
	  str = Str &" </ul>"
	str = str&"</div></td></tr>"
	str = str&"<tr></table></div>"
	PageStr_Form = Str
End Function


Function ajaxPage(self_page, divID)
	  page_str = Replace(Request.QueryString,"&page="&Request("page"),"")
	  page_str = Replace(page_str,CStr("page="&Request("page"))&"&","")
	  page_str = Replace(page_str,"&&","")
	  str = str&"<div align=""center""  >"
	 str = Str &"<ul class=""pagination"">"
	 if page > 5 then
	  str = str&"<li><a href='javascript:void(0)' onclick=""$('#"&divID&"').load('"&self_page&"?"&page_str&"')"">1</a></li>"
	  end if


	 '페이지 10개 구분 ===========================================================
			dim blockpage
				blockPage=Int((page-1)/5)*5+1
				'************************ 이전 10 개구문 시작 ***************************
				if blockPage > 5  Then
					 str = Str &"<li><a href='javascript:void(0)' onclick=""$('#"&divID&"').load('"&self_page&"?page="&blockPage-1&"&"&page_str&"')"" alt=""이전 5개""  title='이전5개'><i class='el el-backward title07'></i></a></li>"
				End If
				'************************ 이전 10 개 구문 끝***************************
				   i=1

				Do Until i > 5 or blockPage > pagecount
					If blockPage = int(page) Then '현재페이지 일때 링크하지 않는다
						str = str&" <li class=""active""><a style='color:red;background:#ededed;font-weight:500' >"&blockPage&"</a></li>"
					Else
						str = str&" <li ><a href='javascript:void(0)' onclick=""$('#"&divID&"').load('"&self_page&"?page="&blockPage&"&"&page_str&"')"" >"&blockPage&"</a></li>"
					End If

					blockPage = blockPage + 1
					i = i + 1
				Loop

				'************************ 다음 10 개 구문 시작***************************
				 if blockPage > pagecount Then
				  Else
						 str = Str &"	<li><a href='javascript:void(0)' onclick=""$('#"&divID&"').load('"&self_page&"?page="&blockPage&"&"&page_str&"')""  title='다음5개'><i class='el el-forward title07'></i></a></li>"
				  End If
				'************************ 다음 10 개 구문 끝***************************
			if int(page)  <  pagecount-5  then
			str = Str &"<li class=""hidden-phone""><a href='javascript:void(0)' onclick=""$('#"&divID&"').load('"&self_page&"?page="&pagecount&"&"&page_str&"')"" title='마지막 페이지'>"&pagecount&"</a></li>"
			end if
			str = Str &" </ul>"
			str = str&"<div>"
			response.write str
	End Function

	Function PageFrm(self_page)
	  str = str&"<div style=""width:100%;font-size:97%"" align=""center"" class='mgt10' ><table width='"&table_width&"' border=0 cellspacing=0 cellpadding=0 summary='페이지 테이블'>"
	  str = str&"<tr><TD align=center width='100%' colspan='2' height='23'>"
	  str = str&"<a href='javascript:;' onclick='page_go("""&SELF_PAGE&""", ""list"" , document.list_frm, ""_self"", 1);'><img src='/board/img/btn_prev_02.gif' align=absmiddle alt='첫페이지' /></a>&nbsp;"
	 '페이지 10개 구분 ===========================================================
			dim blockpage
				blockPage=Int((page-1)/10)*10+1
				'************************ 이전 10 개구문 시작 ***************************
				if blockPage = 1 Then
				str = str&"<img src='/board/img/button_left.gif' border='0' align=absmiddle alt='이전10개' /> "
				else
				str = str&"<a href='javascript:;' onclick='page_go("""&SELF_PAGE&""", ""list"" , document.list_frm, ""_self"", "&blockPage-1&");'  title='이전 10개' alt='이전10개'><img src='/board/img/button_left.gif' border='0' align=absmiddle></a>&nbsp;"
				End If
				'************************ 이전 10 개 구문 끝***************************
				   i=1
				   Do Until i > 10 or blockPage > pagecount
					  If blockPage=int(page) Then '현재페이지 일때 링크하지 않는다
						str = str&" <span style='color:red' class='f14 bold'>"&blockPage&"</span>"
						Else
						str = str&" <a  href='javascript:;' onclick='page_go("""&SELF_PAGE&""", ""list"" , document.list_frm, ""_self"", "&blockPage&");'>"&blockPage&"</a> "
						End If

							blockPage=blockPage+1
							i = i + 1
					Loop

				'************************ 다음 10 개 구문 시작***************************
				if blockPage > pagecount Then
				  str = str&" <img src='/board/img/button_right.gif' border='0' align=absmiddle  alt='다음 10개' />"
				Else
				str = str&"&nbsp;<a href='javascript:;' onclick='page_go("""&SELF_PAGE&""", ""list"" , document.list_frm, ""_self"", "&blockPage&");' title='다음10개' ><img src='/board/img/button_right.gif' border='0' align=absmiddle alt='다음 10개' /> </a>"
				End If
				'************************ 다음 10 개 구문 끝***************************

		str = str&"&nbsp;<a  href='javascript:;' onclick='page_go("""&SELF_PAGE&""", ""list"" , document.list_frm, ""_self"", "&pagecount&");'><img src='/board/img/btn_next_02.gif' align=absmiddle  alt='끝페이지' /></a>"
		str = str&"</td></tr>"
		str = str&"<tr></table></div>"
		response.write str
End Function%>
<script type="text/javascript">
function page_go(acurl, arng , x, target, page) {
	x.page.value	= page;
	x.arng.value	= arng;
	x.target		= target;
	x.action		= acurl;
	x.submit();
}
</script>
<%Function KeySql(key, FieldName)
	Select Case key
			Case "ㄱ"
				KeySql = " and ("&FieldName&" between ''ㄱ'' and ''ㄴ'')"
			Case "ㄴ"
				KeySql = " and ("&FieldName&" between ''ㄴ'' and ''ㄷ'')"
			Case "ㄷ"
				KeySql = " and ("&FieldName&" between ''ㄷ'' and ''ㄹ'')"
			Case "ㄹ"
				KeySql = " and ("&FieldName&" between ''ㄹ'' and ''ㅁ'')"
			Case "ㅁ"
				KeySql = " and ("&FieldName&" between ''ㅁ'' and ''ㅂ'')"
			Case "ㅂ"
				KeySql = " and ("&FieldName&" between ''ㅂ'' and ''ㅅ'')"
			Case "ㅅ"
				KeySql = " and ("&FieldName&" between ''ㅅ'' and ''ㅇ'')"
			Case "ㅇ"
				KeySql = " and ("&FieldName&" between ''ㅇ'' and ''ㅈ'')"
			Case "ㅈ"
				KeySql = " and ("&FieldName&" between ''ㅈ'' and ''ㅊ'')"
			Case "ㅊ"
				KeySql = " and ("&FieldName&" between ''ㅊ'' and ''ㅋ'')"
			Case "ㅋ"
				KeySql = " and ("&FieldName&" between ''ㅋ'' and ''ㅌ'')"
			Case "ㅌ"
				KeySql = " and ("&FieldName&" between ''ㅌ'' and ''ㅍ'')"
			Case "ㅍ"
				KeySql = " and ("&FieldName&" between ''ㅍ'' and ''ㅎ'')"
			Case "ㅎ"
				KeySql = " and ("&FieldName&" between ''ㅎ'' and ''a'')"
			Case "기타"
				KeySql = " and (("&FieldName&" between ''a'' and ''Z'') or ("&FieldName&" between ''0'' and ''9''))"
		End Select

End Function

Function searKey(key, FieldName)
	Select Case key
			Case "ㄱ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㄱ'' and ''ㄴ'')"
			Case "ㄴ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㄴ'' and ''ㄷ'')"
			Case "ㄷ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㄷ'' and ''ㄹ'')"
			Case "ㄹ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㄹ'' and ''ㅁ'')"
			Case "ㅁ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㅁ'' and ''ㅂ'')"
			Case "ㅂ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㅂ'' and ''ㅅ'')"
			Case "ㅅ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㅅ'' and ''ㅇ'')"
			Case "ㅇ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㅇ'' and ''ㅈ'')"
			Case "ㅈ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㅈ'' and ''ㅊ'')"
			Case "ㅊ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㅊ'' and ''ㅋ'')"
			Case "ㅋ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㅋ'' and ''ㅌ'')"
			Case "ㅌ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㅌ'' and ''ㅍ'')"
			Case "ㅍ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㅍ'' and ''ㅎ'')"
			Case "ㅎ"
				whereSql = whereSql&" and ("&FieldName&" between ''ㅎ'' and ''a'')"
			Case "기타"
				whereSql = whereSql&" and (("&FieldName&" between ''a'' and ''Z'') or ("&FieldName&" between ''0'' and ''9''))"
		End Select
		searKey  = 	whereSql
End Function

Function searKeyNoproc(key, FieldName)
	Select Case key
			Case "ㄱ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㄱ' and 'ㄴ')"
			Case "ㄴ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㄴ' and 'ㄷ')"
			Case "ㄷ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㄷ' and 'ㄹ')"
			Case "ㄹ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㄹ' and 'ㅁ')"
			Case "ㅁ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㅁ' and 'ㅂ')"
			Case "ㅂ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㅂ' and 'ㅅ')"
			Case "ㅅ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㅅ' and 'ㅇ')"
			Case "ㅇ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㅇ' and 'ㅈ')"
			Case "ㅈ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㅈ' and 'ㅊ')"
			Case "ㅊ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㅊ' and 'ㅋ')"
			Case "ㅋ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㅋ' and 'ㅌ')"
			Case "ㅌ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㅌ' and 'ㅍ')"
			Case "ㅍ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㅍ' and 'ㅎ')"
			Case "ㅎ"
				whereSql = whereSql&" and ("&FieldName&" between 'ㅎ' and 'a')"
			Case "기타"
				whereSql = whereSql&" and (("&FieldName&" between 'a' and 'Z') or ("&FieldName&" between '0' and '9'))"
		End Select
		searKeyNoproc  = 	whereSql
End Function

Function seachTab(selfPage)%>
<table cellspacing="0" width="500">
	<tr>
		<th width="100">가나다 찾기 </td>
		<th> [ </td>
		<th width="40"><a href="<%=selfPage%>"><%If key="" Then response.write "<font color=""red"">"%>전체</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㄱ")%>"><%If key="ㄱ" Then response.write "<font color=""red"">"%>ㄱ</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㄴ")%>"><%If key="ㄴ" Then response.write "<font color=""red"">"%>ㄴ</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㄷ")%>"><%If key="ㄷ" Then response.write "<font color=""red"">"%>ㄷ</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㄹ")%>"><%If key="ㄹ" Then response.write "<font color=""red"">"%>ㄹ</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㅁ")%>"><%If key="ㅁ" Then response.write "<font color=""red"">"%>ㅁ</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㅂ")%>"><%If key="ㅂ" Then response.write "<font color=""red"">"%>ㅂ</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㅅ")%>"><%If key="ㅅ" Then response.write "<font color=""red"">"%>ㅅ</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㅇ")%>"><%If key="ㅇ" Then response.write "<font color=""red"">"%>ㅇ</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㅈ")%>"><%If key="ㅈ" Then response.write "<font color=""red"">"%>ㅈ</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㅊ")%>"><%If key="ㅊ" Then response.write "<font color=""red"">"%>ㅊ</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㅋ")%>"><%If key="ㅋ" Then response.write "<font color=""red"">"%>ㅋ</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㅌ")%>"><%If key="ㅌ" Then response.write "<font color=""red"">"%>ㅌ</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㅍ")%>"><%If key="ㅍ" Then response.write "<font color=""red"">"%>ㅍ</a></td>
		<th width="23"><a href="<%=selfPage%>&key=<%=server.urlencode("ㅎ")%>"><%If key="ㅎ" Then response.write "<font color=""red"">"%>ㅎ</a></td>
		<th width="40"><a href="<%=selfPage%>&key=<%=server.urlencode("기타")%>"><%If key="기타" Then response.write "<font color=""red"">"%>기타</a></td>
		<th> ] </td>
	</tr>
</table>
<%End Function


Sub hTab(selfPage)%>
<table cellspacing="0" cellpadding="0">
	<tr>
		<th width="50" class="dec14"><div style="margin-left:0px"><img src='/images/etc/icon_folder_line_start.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&searchstr='+document.sfrm.searchstr.value')">all</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㄱ")%>&searchstr='+document.sfrm.searchstr.value)"> ㄱ</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㄴ")%>&searchstr='+document.sfrm.searchstr.value)"> ㄴ</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㄷ")%>&searchstr='+document.sfrm.searchstr.value)"> ㄷ</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㄹ")%>&searchstr='+document.sfrm.searchstr.value)"> ㄹ</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㅁ")%>&searchstr='+document.sfrm.searchstr.value)"> ㅁ</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㅂ")%>&searchstr='+document.sfrm.searchstr.value)"> ㅂ</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㅅ")%>&searchstr='+document.sfrm.searchstr.value)"> ㅅ</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㅇ")%>&searchstr='+document.sfrm.searchstr.value)"> ㅇ</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㅈ")%>&searchstr='+document.sfrm.searchstr.value)"> ㅈ</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㅊ")%>&searchstr='+document.sfrm.searchstr.value)"> ㅊ</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㅋ")%>&searchstr='+document.sfrm.searchstr.value)"> ㅋ</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㅌ")%>&searchstr='+document.sfrm.searchstr.value)"> ㅌ</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㅍ")%>&searchstr='+document.sfrm.searchstr.value)"> ㅍ</a><br>
		<img src='/images/etc/icon_folder_line.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("ㅎ")%>&searchstr='+document.sfrm.searchstr.value)"> ㅎ</a><br>
		<img src='/images/etc/icon_folder_line_end.gif' align='absmiddle'><a href="#" onclick="$('#tlist').load('<%=selfPage%>&key=<%=server.urlencode("기타")%>&searchstr='+document.sfrm.searchstr.value)">etc</a></div></td>
	</tr>
</table>
<%End Sub%>