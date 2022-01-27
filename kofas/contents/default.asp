<!--#include virtual="/includefiles/global/_header.asp"-->
<!--#include virtual="/includefiles/global/_array.asp"-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<link rel="stylesheet" href="/includefiles/css/bootstrap-theme.css" type="text/css" />
<link rel="stylesheet" href="/includefiles/css/line-menu.css" type="text/css" />
<%If st = "sub10" And st = "sub100" then%>
	<link rel="stylesheet" href="/includefiles/css/sub100.css" type="text/css" />
<%else%>
	<link rel="stylesheet" href="/includefiles/css/<%=st%>.css" type="text/css" />
<%End if%>
<%If st = "sub01" And sMenu = "01" then%>
<link rel="stylesheet" href="/includefiles/css/contents.css" type="text/css" />
<%End if%>
<div class="wrapper">
	<!-- Start Nav Contents Area -->
	<!--#include virtual="/includefiles/global/top_navi.asp"-->
	<!--#include virtual="/includefiles/global/SiteMenu.asp"-->
    <!-- End Nav Contents Area -->
	<div class="subVisual">
		<div style="background: url('/images/sub_visual/sub01_visual.png') no-repeat center;background-size:cover" class="vs-img">
			<div class="visual-main-title">
				<h1><%=menu1_TITLE%></h1>
				<span><%=m_text%></span>
			</div>
			<!-- 메인 제목 시작 -->
			<!-- 끝 -->
		</div>
	</div>
	<!-- 라인 메뉴 -->
	<section class="sub-menu-wrap">
		<div class="line-sub-menu">
			<div class="line-menu">
				<div class="line-menu-home">
					<a href="/" title="메인페이지 이동">
						<i class="fa fa-home" aria-hidden="true"></i>
					</a>
				</div>
				<ul class="line-menu-ul">
					<li class="ul-item">
						<input type="checkbox" name="lms1" id="lms1" value="코파스 소개">
						<%  m_color		= "t500"%>
						<label for="lms1">
							<span class="<%=m_color%>"><%=menu1_subject%></span>
						</label>
						<ul class="lms-list">
							<%If UBound(arr_Menu_depth) > 0 then%>
								<%For m_i = 0 To UBound(arr_Menu_depth)									%>
									<li><a href="<%=arr_menu_link(m_i)%>" title="<%=arr_menu_link(m_i)%>"><i class="fa <%'=arr_m_icon_d2(m_i)%> " aria-hidden="true"></i>&nbsp; <%=arr_Menu_depth(m_i)%></a></li>
								<%Next%>
							<%End if%>
						</ul>
					</li>
					<li class="ul-item">
						<input type="checkbox" name="lms2" id="lms2" value="<%=menu1_subject%>">
						<%
								Menu_title = arr_Menu_1depth(Int(sMenu)-1)
								m_color		= "t500"

							%>
						<label for="lms2">
							<span class="<%=m_color%>"><%=Menu_title%></span>
						</label>
						<ul class="lms-list">
							<%If UBound(arr_Menu_1depth) > 0 then%>
								<%For m_i = 0 To UBound(arr_Menu_1depth)%>

									<%	'메뉴에 게시판이 있을경우 링크를 수정한다'
										If IsArray(boardid_arr) Then
											If boardid_arr(m_i) <> "" Then %>
												<li><a href="/board/?boardid=<%=boardid_arr(m_i)%>" title="<%=arr_Menu_1depth(m_i)%>"><i class="fa <%'=arr_m_icon_d1(m_i)%> " aria-hidden="true"></i>&nbsp; <%=arr_Menu_1depth(m_i)%></a></li>
										<%	Else %>
												<li><a href="<%=arr_menu_link_1depth(m_i)%>" title="<%=arr_Menu_1depth(m_i)%>"><i class="fa <%'=arr_m_icon_d1(m_i)%> " aria-hidden="true"></i>&nbsp; <%=arr_Menu_1depth(m_i)%></a></li>
									<%		End If
										Else%>
											<li><a href="<%=arr_menu_link_1depth(m_i)%>" title="<%=arr_Menu_1depth(m_i)%>"><i class="fa <%'=arr_m_icon_d1(m_i)%> " aria-hidden="true"></i>&nbsp; <%=arr_Menu_1depth(m_i)%></a></li>
									<%	End if%>



									<!--li><a href="<%=arr_menu_link_1depth(m_i)%>" title="<%=arr_Menu_1depth(m_i)%>"><i class="fa <%'=arr_m_icon_d1(m_i)%> " aria-hidden="true"></i>&nbsp; <%=arr_Menu_1depth(m_i)%></a></li-->


								<%Next%>
							<%End if%>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</section>
	<section id="main_body">
		<div id="body-cont" class="body-cont" ></div>
	</section>

<!--main body end-->

<!--#include virtual="/includefiles/global/_footer.asp"-->
