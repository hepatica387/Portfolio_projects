<!--#include virtual="/includefiles/global/_header.asp"-->
<!--#include virtual="/includefiles/global/_array.asp"-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<link rel="stylesheet" href="/includefiles/css/bootstrap-theme.css" type="text/css" />
<link rel="stylesheet" href="/includefiles/css/line-menu.css" type="text/css" />
<%If st = "sub10" And st = "sub100" then%>
	<link rel="stylesheet" href="/includefiles/css/sub10.css" type="text/css" />
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
	<aside class="subVisual">
		<div class="visual-img bottom_shadow" >
			<div class="visual-item">
				<div style="background: url('/images/sub_visual/<%=st%>_visual.png') no-repeat center;background-size:cover" class="vs-img animate">
					<div class="visual-main-title">
						<span><%=menu1_subject%></span>
					</div>
					<%If UBound(arr_Menu_1depth) > 0 then%>
						<div class="cols-100 flex visual-icon-Menu flex-center">
								<%For m_i = 0 To UBound(arr_Menu_1depth)
									If m_i+1 	< 10 Then sMenu_num	= "0"&(m_i+1)
									mNUm	=	Int(sMenu)
									If (m_i + 1) = mNum	Then
										m_active	= "bg-default"
										m_color		= "t-black t500"
									Else
										m_active = "bg-Menu"
										m_color		= "t-inner  t400"
									End if
								%><a href="/<%=st%>/<%=sMenu_num%>" title="<%=arr_Menu_1depth(m_i)%>">
									<div class="wid120 flex-mg center border-gray hid120 t_raudis <%=m_active%> ">
										<div class="pdt20 <%=m_color%>"><i class="fa <%=arr_m_icon(m_i)%> fa-3x" aria-hidden="true"></i></div>
										<div class="title09 pdt10 <%=m_color%>"><%=arr_Menu_1depth(m_i)%></div>
									</div>
									</a>
								<%Next%>

						</div>
					<%End if%>
				</div>
			</div>
		</div>
	</aside>
<!-- 라인 메뉴 -->
<section class="sub-menu-wrap">
	<div class="line-sub-menu">
		<div class="line-menu">
			<div class="line-menu-home">
				<a href="javascript:void(0);">
					<i class="fa fa-home" aria-hidden="true"></i>
				</a>
			</div>
			<ul class="line-menu-ul">
				<li class="ul-item">
					<input type="checkbox" name="lms1" id="lms1" value="법인소개">
					<label for="lms1">
						<span>법인소개</span>
					</label>
					<ul class="lms-list">
						<li><a href="javascript:void(0);">월계복지관 소개</a></li>
						<li><a href="javascript:void(0);">미션 & 비젼 & CI</a></li>
						<li><a href="javascript:void(0);">운영 / 자문위원</a></li>
						<li><a href="javascript:void(0);">인사말</a></li>
						<li><a href="javascript:void(0);">연혁</a></li>
						<li><a href="javascript:void(0);">온라인 기관 내방</a></li>
						<li><a href="javascript:void(0);">조직 및 인력</a></li>
						<li><a href="javascript:void(0);">오시는 길</a></li>
					</ul>
				</li>
				<li class="ul-item">
					<input type="checkbox" name="lms2" id="lms2" value="법인소개">
					<label for="lms2">
						<span>법인소개</span>
					</label>
					<ul class="lms-list">
						<li><a href="javascript:void(0);">월계복지관 소개</a></li>
						<li><a href="javascript:void(0);">미션 & 비젼 & CI</a></li>
						<li><a href="javascript:void(0);">운영 / 자문위원</a></li>
						<li><a href="javascript:void(0);">인사말</a></li>
						<li><a href="javascript:void(0);">연혁</a></li>
						<li><a href="javascript:void(0);">온라인 기관 내방</a></li>
						<li><a href="javascript:void(0);">조직 및 인력</a></li>
						<li><a href="javascript:void(0);">오시는 길</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</section>

	<section class="section1">
		<div class="innerWrap">
			<div class="section1-title">
				<h2><%=mTITLE%></h2>
				<div style="border-bottom: 1px solid #e2e2e2;margin:10px auto 20px auto;width:100%"></div>
			</div>
		</div>
	</section>
		<div id="body-cont" class="body-cont" ></div>

<!--main body end-->

<!--#include virtual="/includefiles/global/_footer.asp"-->
