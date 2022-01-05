								<!--#include file="../../LIB/_headInclude.asp"-->
								<% boardid = Request("boardid")
									 Select case boardid
										Case  "Notice"  ' 마음나누기
											title		= "공지사항"
											st			= "sub05"
											sMenu		= "01"
											title_img	= "main_brd03_title.jpg"
											imgmap		= "ImageMap1"
											div_name	= "#Notice"
											bid01		= boardid
											bid02		= "Notice"
											db_table	= "JOONGLIM_board001"									
									End Select %>					 
							<ul class="all-unstyled">
								<%orderSql = "order by seq desc"
											SqlFields = " Top 5 Seq, subject, wdate, ref,  re_step"
											SqlFields = SqlFields&", re_level, boardid "
											whereSql = "where (boardid = ''"&boardid&"'') and secret = 0 "& orderSql
											strSql = "exec Pro_hepatica_select '"&db_table&"','"&SqlFields&"','"&WhereSql&"'"
											arrFields = SqlArray(strSql,1)
											If Not isnull(arrFields) Then
												For i = 0 To ubound(arrFields,2)
												 If i = 0 Then active = "active" Else active = ""
												 Seq		= arrFields(0,i)
												 subject	= arrFields(1,i)
												 subject	= stripTags(subject)
												 wdate		= arrFields(2,i)
												 ref		= arrfields(3,i)
												 re_step	= arrFields(4,i)
												 re_level	= arrFields(5,i)
												 if datediff("h",wdate,now()) < 72 Then strnew="<img src='/images/etc/new.gif' align='absmiddle' alt='새글'>" Else strnew = ""
												wdate		= Right(Left(replace(wdate,"-","."),10), 5)
												 context="seq="&Seq&"&ref="&ref&"&re_step="&re_step&"&arng=view"
												 context = context&"&boardid="&boardid%>
											<li>
												<div class="cols-80 f-left pdl10 pdt8 EllipsText pdr10 left"><a href="/board/?page=1&<%=context%>" title="<%=subject%>" class="t-body"><%=subject & " " & strnew%></a></div>
												<div class="cols-20 f-left EllipsText pdt8"><%=wdate%></div>
											</li>
										<% Next
										    End If%>
							</ul>
<%Call CloseDB%>