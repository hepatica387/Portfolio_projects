					<!--#include file="../../LIB/head_include.asp"-->					
					<% SqlFields = " top 5 Seq, subject, wdate, ref,  re_step"
						SqlFields = SqlFields&", re_level, content, filename"
						whereSql = "where boardid=''main_issue''  "& orderSql
						strSql = "exec Pro_hepatica_select 'PU_board','"&SqlFields&"','"&WhereSql&"'" 	
						arrFields = SqlArray(strSql,1)%>
						<div id="myCarousel" class="carousel slide">
						  <ol class="carousel-indicators">							
							<%If Not isnull(arrFields) Then
								For i = 0 To UBound(arrFields,2) 
									If i = 0 Then active = "active" Else active = ""
								%>
								<li data-target="#myCarousel" data-slide-to="<%=i%>" class="<%=active%>"></li>
							<% Next
							  End if%>
						  </ol>
						  <!-- Carousel items -->
						  <div class="carousel-inner ">							
							<%If Not isnull(arrFields) Then
							For i = 0 To UBound(arrFields,2) 
								If i = 0 Then active = "active" Else active = ""
								 Seq		= arrFields(0,i)							
								 subject	= arrFields(1,i)
								 subject	= NoScript(subject)
								 wdate		= arrFields(2,i)
								 ref		= arrfields(3,i)
								 re_step	= arrFields(4,i)
								 re_level	= arrFields(5,i)
								 content	= LeftCut(arrFields(6,i),200)
								 filename	= arrFields(7,i)

								 context="boardid=main_issue&ref="&ref&"&re_step="&re_step&"&arng=view&sCnt=6"
								 context = context&"&st=sub04&sMenu=06"%>
							<div class="item <%=active%>">
								<a href="/board/board.asp?page=1&seq=<%=seq%>&<%=context%>" ><img src="/board/data/main_issue/<%=filename%>" class="img-rounded " alt="" id="visualImg"/></a>						
								<div class="carousel-caption img-rounded " >
								  <h4><%=subject%></h4>
								  <p ><%=content%></p>
								</div>								
							</div>							
							<% Next
							  End if%>							
						  </div>						 
						</div>	
						
						