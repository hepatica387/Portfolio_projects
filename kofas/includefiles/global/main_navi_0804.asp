<div id="sknavi">
	<p><a href="#body-cont" tabindex="1">본문 바로가기</a></p>
	<p><a href="#MainMenu" tabindex="1">주메뉴 바로가기</a></p>
</div>
<div id="navigate">
	<!--top 로그인-->
	<div class="top_nav hidden-xs">					
		<div class="LogMenu">
			<div class="topLog">
				<ul class="all-unstyled title09">
					<li class="f-left"><a href="/"  class="LogBtn" >HOME</a></li>
					<%if MYID <> "" then%>
						<li class="f-left"><a href="<%=LOGOUT_URL%>" title="로그아웃" class="LogBtn" >LOGOUT</a></li>	
						<li class="f-left"><a href="/administrator/" title="관리자페이지" class="LogBtn" >ADMIN</a></li>
					<%else%>
						<li class="f-left"><a href="/contents/?st=sub10&sMenu=01" title="로그인" class="LogBtn" >LOGIN</a></li>	
					<%end if%>
					<li class="f-left"><a href="/contents/?st=sub06&sMenu=05" title="오시는 길" class="LogBtn" >CONTACT US</a></li>						
				</ul>
			</div>
		</div>
	</div>
	<!--top 로그인-->			
	<div class="main-navi hidden-sm hidden-xs row mgl0 bottom_shadow" id="MainMenu">						
		<div class="t-navi ">		
			<ul class="all-unstyled">
				<li class="f-left" ><a href="/" title="구립중림데이케어센터"><img src="/images/navi/logo.png" alt="구립중림데이케어센터"/></a></li>
				<li class="f-left">	
					<div class="main_menu right " >			
					<ul class="all-unstyled depth_01 Mmenu">					
						<li class="f-left MainNav"><a href="javascript:;" title="사업안내" ><img src="/images/navi/menu01_out.png" alt="사업안내" /></a>
							<ul class="m_01 all-unstyled sub_navi" >
								<li class="left pdl10 pdr20"><a href="/contents/?st=sub01&sMenu=01" class="mgl10">사업내용</a></li>
								<li class="left pdl10"><a href="/contents/?st=sub01&sMenu=02" class="mgl10">프로그램안내</a></li>
							</ul>
						</li>
						<li class="f-left MainNav" ><a href="javascript:;" title="입소" ><img src="/images/navi/menu02_out.png" alt="입소" /></a>
							<ul class="m_01 all-unstyled sub_navi  " >
								<li class="left"><a href="/contents/?st=sub02&sMenu=01" class="mgl10">시설안내</a></li>
								<li class="left"><a href="/contents/?st=sub02&sMenu=02" class="mgl10">입소안내</a></li>
								<li class="left"><a href="/contents/?st=sub02&sMenu=03" class="mgl10">이용료 보기</a></li>
							</ul>
						</li>
						<li class="f-left MainNav" ><a href="/contents/?st=sub03&sMenu=01" title="채용정보" ><img src="/images/navi/menu03_out.png" alt="채용정보" /></a>
							<ul class="m_03 all-unstyled " >
								<li class="left pdl15">&nbsp;</li>
							</ul>
						</li>
						<li class="f-left MainNav" ><a href="/contents/?st=sub04&sMenu=01" title="후원/자원봉사" ><img src="/images/navi/menu04_out.png" alt="후원/자원봉사" /></a>
							<ul class="m_04 all-unstyled sub_navi  pdl20" >
								<li class="left"><a href="/contents/?st=sub04&sMenu=01" class="mgl10">후원안내</a></li>
								<li class="left"><a href="/contents/?st=sub04&sMenu=02" class="mgl10">후원신청</a></li>
								<li class="left"><a href="/contents/?st=sub04&sMenu=03" class="mgl10">자원봉사안내</a></li>
								<li class="left"><a href="/contents/?st=sub04&sMenu=04" class="mgl10">자원봉사신청</a></li>
							</ul>
						</li>
						<li class="f-left MainNav" ><a href="/contents/?st=sub01&sMenu=06" title="알림마당" ><img src="/images/navi/menu05_out.png" alt="알림마당" /></a>
							<ul class="m_04 all-unstyled sub_navi  " >
								<li class="left"><a href="/board/?boardid=freeboard" class="mgl10">공지사항</a></li>
								<li class="left"><a href="/board/?boardid=freeboard" class="mgl10">갤러리</a></li>
								<li class="left"><a href="/board/?boardid=freeboard" class="mgl10">가족의견나눔</a></li>
								<li class="left"><a href="/board/?boardid=freeboard" class="mgl10">월별계획표</a></li>
								<li class="left"><a href="/board/?boardid=freeboard" class="mgl10">식단표</a></li>
							</ul>
						</li>
						<li class="f-left MainNav" ><a href="/contents/?st=sub06&sMenu=01" title="센터안내" ><img src="/images/navi/menu06_out.png" alt="센터안내" /></a>
							<ul class="m_04 all-unstyled sub_navi  pdl10admindltjdfuf1!" >
								<li class="left"><a href="/contents/?st=sub06&sMenu=01" class="mgl10">인사말</a></li>
								<li class="left"><a href="/contents/?st=sub06&sMenu=02" class="mgl10">법인소개</a></li>
								<li class="left"><a href="/contents/?st=sub06&sMenu=03" class="mgl10">센터소개</a></li>
								<li class="left"><a href="/contents/?st=sub06&sMenu=04" class="mgl10">함께하는 사람들</a></li>
								<li class="left"><a href="/contents/?st=sub06&sMenu=05" class="mgl10">오시는 길</a></li>
							</ul>
						</li>
					</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="main-navi-border hidden-sm hidden-xs"></div>
</div>	
<script>			
	$(document).ready(function () {		
		//마우스아웃시 메뉴
		$(".main_menu").bind("focusout mouseleave", function () {
			$(".main_menu").stop().animate({height: "91px"	}, 400, function(){"easeOutCubic";});
			$(".depth_01 > li > a > img").each(function () {
				if ($(this).parent().hasClass("on")== false) {
					$(this).attr("src", $(this).attr("src").replace("_over", "_out"));
				}
			});				
		});

		//메인메뉴 이미지 오버
		 $(".depth_01 > li > div").each(function (index) {
			<%if mMenu <> "" then%>if (index == <%=mMenu-1%>){$(this).children().addClass("on");}<%end if%>			
			for (i = 0; i < $(this).find("a").length; i++) {
				if ($(this).find("a").eq(i).attr("title") == "<%=menu02%>"){$(this).find("a").eq(i).addClass("on");}		
				if ($(this).find("a").eq(i).hasClass("on")) {
					var strsrc = $("img", $(this)).eq(i).attr("src");
					if (strsrc) {
						$("img", $(this)).eq(i).attr("src", strsrc.replace("_out.", "_over."))						
					}
				}				
			}
		});
		//마우스오버시 메뉴
		$(".depth_01 > li").bind("focusin mouseenter", function () {
			$(".main_menu").stop().animate({ height: "269px"}, 400, function(){"easeOutCubic";}); //중메뉴 추가시 높이 바꿔야함.
			var insSec = $(".depth_01 > li").index(this);			
			$(".depth_01 > li > a > img").each(function (e) {							
				if ($(this).parent().hasClass("on")== false) {
					$(this).attr("src", $(this).attr("src").replace("_over", "_out"));
				}
			});
			$(".depth_01 > li > a > img").eq(insSec).attr("src", $(".depth_01 > li > a > img").eq(insSec).attr("src").replace("_out", "_over"));	
		});	
	});
</script>