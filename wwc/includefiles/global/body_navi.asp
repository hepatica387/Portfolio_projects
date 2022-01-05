		<div id="cont_title"  class="cont_title hidden-xs   " style="background:url(/images/<%=st%>/sub_top.jpg) no-repeat center;"></div>
		<div class="cont_menu hidden-xs hidden-sm" style="z-index:1">
			<ul class="all-unstyled hid40">
				<li class=" f-left wid50 hid40 center border-right pdt6" ><a href="/"><span class="el el-home"></span></a></li>
				<%For i = 0 To sCnt - 1 
					If cstr(sMenu) <> CStr("0"&(i + 1)) Then 
						menu_href = "<a href=""/contents/?st="&st&"&sMenu=0"&i+1&""" >"&menu_arr(i)&"</a>"
						Select Case st						
							Case "sub03"
								If i < 4 Then 										
									menu_href = "<a href=""/board/?boardid="&boardid_arr(i)&"&st="&st&"&sMenu=0"&i+1&""" >"&menu_arr(i)&"</a>"
								End  If	
							Case "sub05"
								If i = 0  Then 										
									menu_href = "<a href=""/board/?arng=write&boardid=QNA&st=sub05&sMenu=01"" >"&menu_arr(i)&"</a>"										
								ElseIf i = 1 Then
									menu_href = "<a href=""/board/?boardid="&boardid_arr(i)&"&st="&st&"&sMenu=0"&i+1&""" >"&menu_arr(i)&"</a>"
								End  If	
						End select			
						class_active = ""
					Else
						menu_href = "<div class=""bold text-whited pdt3 "">"&menu_arr(i)&"</div>"
						class_active = "progress-bar progress-bar-warning"
					End If 
					%>		   
						<li class="pdl10 pdr10 hid40 wid180 pdt6 title f-left center border-right <%=class_active%>" ><%=menu_href %></li>		 
				 <%next%>
			 </ul>			
		</div>