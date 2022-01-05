								<!--#include file="../../LIB/_headInclude.asp"-->
								<% boardid = Request("boardid")
								 Sql = " select db_table from boardConfig where boardid='"&boardid&"'"
								 dbTable	= SqlValue(Sql, 1)

								orderSql = "order by seq desc"
								SqlFields = " Top 3 Seq, subject, convert(varchar(10), wdate), ref,  re_step "
								SqlFields = SqlFields&", re_level, boardid , content"
								whereSql = "where (boardid = ''"&boardid&"'') and secret = 0 "& orderSql
								strSql = "exec Pro_hepatica_select '"&dbTable&"','"&SqlFields&"','"&WhereSql&"'"
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
									 contents	= stripTags(arrFields(7,i))
									contents	= cutString(contents,18)
									 'if datediff("h",wdate,now()) < 72 Then strnew="<img src='/images/etc/new.gif' align='absmiddle' alt='새글'>" Else strnew = ""
									wdate		= replace(wdate,"-",".")
									 context="seq="&Seq&"&ref="&ref&"&re_step="&re_step&"&arng=view"
									 context = context&"&boardid="&boardid%>
								<a href="/board/?page=1&<%=context%>" title="<%=subject%>" ><div class="cols-33 porfl tabContents_sty">
									<ul class="tabContents_ul ">
										<li><h4 class="title2 EllipsText"><%=subject%></h4></li>
										<li><span class="title2 t400"><%=contents%></span></li>
										<li><p><%=wdate%></p></li>
									</ul>
								</div></a>
							<% Next
								End If%>

<%Call CloseDB%>