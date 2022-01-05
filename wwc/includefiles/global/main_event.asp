					<!--#include file="../../LIB/_headInclude.asp"-->
					<!--#include file="../../includefiles/func/function.auth.asp"-->
					 <ul class="all-unstyled brd01">
						<!--li><img src="images/index/<%=title_img%>" alt="<%=title%>"  usemap="#<%=imgmap%>"/></li-->
						<li>
							<div class="cols-100 pdl5 left pdr10 ">
								<%
								db_table = "event"
								orderSql = "order by seq desc"
								SqlFields = " Top 4 seq, event_name, mok, lang, state, wDate, UserID"
								whereSql = "where UserID = ''"& myid &"'' and state in (''1'',''2'') "& orderSql
								'response.write 	whereSql		
								'response.end			
											strSql = "exec Pro_hepatica_select '"&db_table&"','"&SqlFields&"','"&WhereSql&"'"
											arrFields = SqlArray(strSql,1)
											If Not isnull(arrFields) Then
												For i = 0 To ubound(arrFields,2)
												 If i = 0 Then active = "active" Else active = ""
												 Seq		= arrFields(0,i)
												 subject	= arrFields(1,i)
												 subject	= delete_tag(subject)
												 wdate		= arrFields(5,i)

												 if datediff("h",wdate,now()) < 72 Then strnew="<img src='/images/etc/new.gif' align='absmiddle' alt=''>" Else strnew = ""
								%>
											<div class="cols-100 pdr5 EllipsText mboard" ><a href="../contents/?st=sub02&sMenu=01&mode=edit&seq=<%=seq%>&page=<%=page%>"><span class="EllipsText"> <%=subject & " " & strnew%></span></a></div>
										<% 		Next
										    End If%>
							</div>
						</li>
					</ul>