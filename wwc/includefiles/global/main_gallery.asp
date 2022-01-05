								<!--#include file="../../LIB/_headInclude.asp"-->	
								<% boardid = Request("boardid") 
									 Select case boardid 
										Case  "galmal_gallary"  ' 마을복지사례
											title		= "마을복지사례"
											st			= "sub02"
											sMenu		= "03"
											title_img	= "main_brd02_title.jpg"
											imgmap		= "ImageMap3"
											div_name	= "#Board"
											bid01		= "visitBoard033"
											bid02		= boardid
											db_table	= "visitDong_board001" 									
									End Select %>
					 <ul class="all-unstyled brd01">
						<li><img src="images/index/<%=title_img%>" alt="<%=title%>"  usemap="#<%=imgmap%>"/></li>
						<li>
						<%If boardid = "galmal_gallary" Then %>
							<div class="cols-md-12 pdl10 pdt10">
								<%orderSql = "order by noticeChk desc, wdate desc"
									SqlFields = " Top 6 Seq, subject, wdate, ref,  re_step"
									SqlFields = SqlFields&", re_level, boardid "
									whereSql = "where (boardid = ''"&boardid&"'') and secret = 0 "& orderSql
									strSql = "exec Pro_hepatica_select '"&db_table&"','"&SqlFields&"','"&WhereSql&"'" 	
									arrFields = SqlArray(strSql,1) 
									If Not isnull(arrFields) Then 
										For i = 0 To ubound(arrFields,2)
										 If i = 0 Then active = "active" Else active = ""
										 Seq		= arrFields(0,i)							
										 subject	= arrFields(1,i)
										 subject	= delete_tag(subject)
										 wdate		= arrFields(2,i)
										 ref		= arrfields(3,i)
										 re_step	= arrFields(4,i)
										 re_level	= arrFields(5,i)												 
										 subject	= cutString(subject,10)
										 if datediff("h",wdate,now()) < 72 Then strnew="<img src='/images/etc/new.gif' align='absmiddle' alt=''>" Else strnew = "" 
										wdate		= Left(replace(wdate,"-","."),10)
										 context="seq="&Seq&"&ref="&ref&"&re_step="&re_step&"&arng=view"
										 context = context&"&st="&st&"&sMenu="&sMenu&"&boardid="&boardid%>
									<div class="cols-md-9 mgt3"><a href="/board/?page=1&<%=context%>" ><span class="t-gray"> · <%=subject & " " & strnew%></span></a></div>
									<div class="cols-md-3 center mgt3 pdr5 t-gray"><%=wdate%></div>	
								<% Next  
									End If%>
							</div>
							<%else%>
								<div class="cols-md-12 ">
									<%orderSql = "order by noticeChk desc, wdate desc"
									SqlFields = " Top 1 Seq, subject, wdate, ref,  re_step"
									SqlFields = SqlFields&", re_level, boardid, filename, content "
									whereSql = "where (boardid = ''"&boardid&"'') and secret = 0 "& orderSql
									strSql = "exec Pro_hepatica_select '"&db_table&"','"&SqlFields&"','"&WhereSql&"'" 	
									arrFields = SqlArray(strSql,1) 
									If Not isnull(arrFields) Then 
										For i = 0 To ubound(arrFields,2)
										 If i = 0 Then active = "active" Else active = ""
										 Seq		= arrFields(0,i)							
										 subject	= arrFields(1,i)
										 subject	= delete_tag(subject)
										 wdate		= arrFields(2,i)
										 ref		= arrfields(3,i)
										 re_step	= arrFields(4,i)
										 re_level	= arrFields(5,i)												 
										 subject	= cutString(subject,10)
										 filename	= arrFields(7,i)
										 contents	= delete_tag(arrFields(8,i))	
										 contents	= cutString(contents,57)
										 if datediff("h",wdate,now()) < 72 Then strnew="<img src='/images/etc/new.gif' align='absmiddle' alt=''>" Else strnew = "" 
										wdate		= Left(replace(wdate,"-","."),10)
										 context="seq="&Seq&"&ref="&ref&"&re_step="&re_step&"&arng=view"
										 context = context&"&st="&st&"&sMenu="&sMenu&"&boardid="&boardid%>
										<div class="cols-md-12 ">
											<div class="cols-md-5 pdl15 pdt15">
												<a href="/board/?page=1&<%=context%>" ><img src="/board/data/<%=boardid%>/thumb/<%=filename%>" alt="<%=subject%>"   class="img scale" /></a>
												<div class="pdt5"><a href="/board/?page=1&<%=context%>" ><span class="t_gray bold"> <%=subject & " " & strnew%></span></a></div>
											</div>
											<div class="cols-md-7 pdl15 pdt15 pdr5"><%=contents%></div>
										</div>
									<% Next  
										End If%>									
									</div>
								<%End If%>
							</li>
						</ul>
<map name="<%=imgmap%>">
	<area shape="rect" coords="3, 1, 167, 40" href="javascript:;" alt="<%=title%>" onclick='$("<%=div_name%>").load("includefiles/global/main_gallery.asp?boardid=<%=bid01%>");'>
	<area shape="rect" coords="170, 3, 286, 40" href="javascript:;" alt="<%=title%>" onclick='$("<%=div_name%>").load("includefiles/global/main_gallery.asp?boardid=<%=bid02%>");'>
	<area shape="rect" coords="286, 1, 320, 40" href="/board/?boardid=<%=boardid%>&st=<%=st%>&sMenu=<%=sMenu%>" alt="<%=title%> 더보기">
</map>

						 										  																			