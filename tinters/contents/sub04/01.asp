<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include virtual="/includefiles/global/_array.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<!-- Start Introduce Area -->
<%
st			= Request.queryString("st")
sMenu		= Request.queryString("sMenu")
service		= Request.queryString("service")
Select Case Left(service,1)
	Case "1"	' 대상별
		subSql = " and  gubun_target like '%"&service&"%' "
	Case "2"	' 사업별
		subSql = " and  gubun_type in ('"&service&"') "
	Case "3"	' 부서별
		subSql = " and  gubun_depart in ('"&service&"') "
End Select
sFlds		= "seq, subject, contents, service_target, service_date, service_price, service_content, in_target, in_type, in_insti, view_gubun, filename, service_staff, thumb "

Sql	= ""
Sql = Sql &" select "&sFlds&" from Insti_service where state = 1 "&subSql&" order by sortNum, seq desc "
arrFlds	= SqlArray(Sql, 1)
%>
<section class="section1 ">
	<div class="innerWrap"><%
	If Not IsNull(arrFlds) Then
		For i = 0 To UBound(arrFlds, 2)
			seq						= arrFlds(0,i)
			subject					= arrFlds(1,i)
			contents				= replace(arrFlds(2,i),vblf,"<br>")
			contents				= replace(contents,"&lt;","<")
			contents				= replace(contents,"&gt;",">")
			service_target			= arrFlds(3,i)
			service_date			= arrFlds(4,i)
			service_price			= arrFlds(5,i)
			service_content			= replace(arrFlds(6,i),vblf,"<br>")
			service_content			= replace(service_content,"&lt;","<")
			service_content			= replace(service_content,"&gt;",">")
			in_target				= replace(arrFlds(7,i),vblf,"<br>")
			in_type					= replace(arrFlds(8,i),vblf,"<br>")
			in_insti				= arrFlds(9,i)
			view_gubun				= arrFlds(10,i)
			filename				= arrFlds(11,i)
			service_staff			= arrFlds(12,i)
			service_staff			= replace(service_staff,vblf,"<br>")
			thumb					= arrFlds(13,i)
			If filename <> "" Then filename		= "/dataFiles/sub04/"&filename
			If thumb <> "" Then thumb	= "/dataFiles/sub04/"&thumb
			%>
			<div class="service_wrap pdt30" >
				<div class="service-subject"  data-aos="fade-left" data-aos-duration="800"  >
					<h4 class="pdb5 fontM t900 t-success title3"><%=subject%></h4>
				</div>
				<div class="cols-100 flex" >
					<%If view_gubun = "IMG" then%>
						<div class=" service_img cols-100 pdt5"  data-aos="zoom-in-up" data-aos-duration="1000" >
							<img src="<%=filename%>" alt="<%=subject%>" class="img">
						</div>
					<%else%>

						<%'If thumb <> "" then%>
						<div class="thumb_img cols-20 pdt5" data-aos="zoom-in-up" data-aos-duration="1000"  >
							<img src="<%=filename%>" alt="<%=subject%>" class="img" onerror="this.src='/images/noimage.png'">
						</div>
						<%'End if%>
						<div class="service-content overflow-hidden pdl30">
							<div class="cols-100 pdt10 pdb10 pdr20 line-dash" data-aos="fade-up" data-aos-duration="500" ><%=contents%></div>
							<%If service_target <> "" then%>
								<div class="flex pdt15" data-aos="fade-left" data-aos-duration="500"><div class="wid120 t500 service-title"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> 이용대상 </div> <div style="flex:80%;"><%=service_target%></div></div>
							<%End if%>
							<%If service_date <> "" then%>
								<div class="flex" data-aos="fade-left" data-aos-duration="700"><div class="wid120 t500 service-title"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> 이용시간 </div> <div style="flex:80%;"><%=service_date%></div></div>
							<%End if%>
							<%If service_price <> "" then%>
								<div class="flex" data-aos="fade-left" data-aos-duration="1200"><div class="wid120 t500 service-title"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> 이용금액 </div> <div style="flex:80%;"><%=service_price%></div></div>
							<%End if%>
							<%If service_content <> "" then%>
								<div class="flex cols-100 pdt15 " data-aos="fade-left" data-aos-duration="1700"><div class="wid120 t500 service-title"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> 사업내용 </div><div style="flex:80%;"><%=service_content%></div></div>
							<%End if%>
							<%If in_target <> "" then%>
								<div class="flex cols-100 pdt15" data-aos="fade-left" data-aos-duration="2200"><div class="wid120 t500 service-title"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> 참여대상 </div> <div style="flex:80%;"><%=in_target%></div></div>
							<%End if%>
							<%If in_type <> "" then%>
								<div class="flex" data-aos="fade-left" data-aos-duration="2700"><div class="wid120 t500 service-title"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> 참여방법 </div> <div style="flex:80%;"><%=in_type%></div></div>
							<%End if%>
						</div>
					<%End if%>
					<div class="cols-100 flex flex-center pdb20 pdt10 border-bottom ">
						<%If in_insti <> "" then%>
							<div class="cols-100 pdt30 pdl5 flex" data-aos="fade-up" data-aos-duration="3200"><div class="wid150 t500 service-title"><i class="fa fa-dot-circle-o" aria-hidden="true"></i> 참여기관(조직) </div> <div style="flex:80%;"><%=in_insti%></div></div>
						<%End if%>
						<%If service_staff <> "" then%>
							<div class="cols-100 pdl5 flex pdt20" data-aos="fade-up" data-aos-duration="3700" ><div class="wid150 t500 service-title"> <i class="fa fa-dot-circle-o" aria-hidden="true"></i> 담당(문의) </div> <div style="flex:80%;"><%=service_staff%></div></div>
						<%End if%>
					<div>

				</div>
			</div>
<%		Next
	End if%>
	</div>
</section>

