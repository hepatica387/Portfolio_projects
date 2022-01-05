								<!--#include file="../../LIB/_headInclude.asp"-->
								<% boardid = Request("boardid")
									 Select case boardid										
										case "vodboard"
											title		= "갤러리"											
											title_img	= "main_brd02_title.jpg"
											imgmap		= "ImageMap3"
											div_name	= "#main_product"
											bid01		= ""
											bid02		= ""
											db_table	= "JOONGLIM_board001"

									End Select 
								    orderSql = "order by noticeChk desc, wdate desc"
									SqlFields = " Top 1 Seq, subject, wdate, ref,  re_step"
									SqlFields = SqlFields&", re_level, boardid, filename, content"
									whereSql = " where boardid=''"&boardid&"'' " & orderSql
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
										 boardid	= arrFields(6,i)
										 subject	= cutString(subject,10)
										 filename	= arrFields(7,i)
                                         'filename   = "//www.hae-dal.com/bbs/" & filename
										 contents	= stripTags(arrFields(8,i))
										 contents	= cutString(contents,20)
										 if datediff("h",wdate,now()) < 72 Then strnew="<img src='/images/etc/new.gif' align='absmiddle' alt=''>" Else strnew = ""
										 wdate		= Left(replace(wdate,"-","."),10)
										 context="seq="&Seq&"&ref="&ref&"&re_step="&re_step&"&arng=view"
										 context = context&"&boardid="&boardid
										 thumb_ImgUrl	= "/board/data/"&boardid&"/"&filename%>
										 <a href="/board/?<%=context%>"><img src="<%=thumb_ImgUrl%>" class="img" alt="<%=subject%>" /></a>									
								<% Next
									End If%>
						
<%Call CloseDB%>
