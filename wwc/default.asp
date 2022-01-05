<!--#include virtual="/LIB/_headinclude.asp"-->
<!--#include file="includefiles/func/function.auth.asp"-->
<!--#include file="includefiles/global/_array.asp"-->
<!--#include virtual="/includefiles/global/global_head.asp"-->
	<link rel="stylesheet" href="/includefiles/css/fullpage.css?ver=<%=css_ver%>" type="text/css" />
	<script src="/includefiles/js/fullpage.js"></script>
	<link rel="stylesheet" type="text/css" href="/includefiles/css/slick.css" >
	<link rel="stylesheet" type="text/css" href="/includefiles/css/slick-theme.css">
	<script type="text/javascript" src="/includefiles/js/slick.js"></script>
<div class="wrapper" >
	<!-- Start Nav Contents Area -->
	<!--#include virtual="/includefiles/global/top_navi.asp"-->
    <!-- End Nav Contents Area -->
	<div id="fullpage">
		<!-- 작업 : 오른쪽 이동 링크 메뉴 작업 -->

		<!-- 메인 슬라이드 -->
		<div class="cols-100 firstbg section center" id="main1">
			<div class="firstbg-slider">
				<div><img class="cols-100" src="/images/index/main_backimg01.png" alt="메인 슬라이드3" class="img"></div>
				<div><img class="cols-100" src="/images/index/main_backimg02.jpg" alt="메인 슬라이드2" class="img"></div>
			</div>
			<div class="" style="position:absolute;">
				<div class="slide-p slide-pause"><i class="fa fa-pause" aria-hidden="true"></i></div>
				<div class="slide-p slide-play"><i class="fa fa-play" aria-hidden="true"></i></div>
			</div>
			<!-- <div class="mouse-scroll">
				<div class="m-scrl">
					<div class=""></div>
				</div>
			</div> -->
		</div>
		<!-- 월계뉴스 -->
		<div class="introWrap secondbg section" id="main2">
			<div class="sencdintro">
				<div class="cols-100 porfl center">
					<h1>월계뉴스</h1>
					<span>글, 사진, 영상으로 이야기합니다.</span>
				</div>
				<div class="cols-75 m_wd100" >
					<h3 class="cols-100 porfl p-0">월계이야기</h3>
					<div class="cols-100 porfl p-0 m_movbiDv" style="margin: 10px 0;">

						<% db_table	= "wwc_Board001"%>
								<%  orderSql = "order by noticeChk desc, wdate desc"
									SqlFields = " Top 4 Seq, subject, wdate, ref,  re_step"
									SqlFields = SqlFields&", re_level, boardid, filename, content"
									whereSql = " where boardid=''wwc_photo01'' " & orderSql
									strSql = "exec Pro_hepatica_select 'wwc_Board001','"&SqlFields&"','"&WhereSql&"'"

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
										 thumb_ImgUrl	= "/board/data/"&boardid&"/thumb/"&filename%>
										<div class="cols-24 porfl hand" style="margin: 0 4px;position: relative;" >
											<a href="/board/?<%=context%>" title=""><img class="cols-100 porfl p-0" src="<%=thumb_ImgUrl%>" onerror="this.src='/images/noimage.png'" alt="<%=subject%>"  class="img"/>
											<span class="cols-100 porfl sty_conts center mgt5 EllipsText"><%=subject%></span></a>
										</div>
								<% Next
									End If%>

					</div>
				</div>
				<div class="cols-25 mgt10 pd015 m_secFc" style="float:right;">
					<iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fwolgyewelfarecenter&amp;width=270&amp;height=700&amp;show_faces=false&amp;stream=true&amp;header=false" scrolling="no" frameborder="0" style="width:100%; overflow:hidden;height:100hv;" allowtransparency="true"></iframe>
				</div>
				<div class="cols-75 m_wd100">
					<h3 class="cols-100 porfl p-0">복지관 소식</h3>
					<div class="cols-100 porfl p-0 tabContents center border-gray" style="margin: 10px 0;">
						<ul class="nav nav-tabs">
							<li class="tabs border-right"><a href="#home" data-toggle="tab" class="news active " rel="wwc_notice" title="공지사항 탭">공지사항</a></li>
							<li class="tabs border-right"><a href="#profile" data-toggle="tab" class="news  "  rel="support_board" title="나눔글 탭">나눔글</a></li>
							<li class="tabs border-right"><a href="#messages" data-toggle="tab" class="news  " rel="wwc_pds01" title="월계뉴스 탭">월계뉴스</a></li>
							<li class="tabs border-right"><a href="#settings" data-toggle="tab" class="news  " rel="recruit" title="채용정보 탭">채용정보</a></li>
							<li class="tabs linkurl"><a href="/board/?boardid=wwc_notice" title="게시판 더보기"><i class="fa fa-plus-square-o"></i></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade in active" id="home" style="padding: 15px 8px;"></div>
							<div class="tab-pane fade in" id="profile" style="padding: 15px 8px;"></div>
							<div class="tab-pane fade" id="messages" style="padding: 15px 8px;"></div>
							<div class="tab-pane fade" id="settings" style="padding: 15px 8px;"></div>
						</div>

					</div>
				</div>
			</div>
			<script>
				$(function(){
					$(".news").click(function(){
							$(".news").removeClass("active");
							$(this).addClass("active");
							var boardid = $(this).attr("rel");
							$(".linkurl > a").attr("href","/board/?boardid="+boardid);
							})

					$("#home").load("/includefiles/global/main_board.asp?boardid=wwc_notice");
					$("#profile").load("/includefiles/global/main_board.asp?boardid=support_board");
					$("#settings").load("/includefiles/global/main_board.asp?boardid=recruit");
					$("#messages").load("/includefiles/global/main_board.asp?boardid=wwc_pds01");

				});
			</script>
	  </div>
	  	<!-- 사업소개 -->
		<!-- contents hover 효과 작업(그림자) -->
		<div class="historyContainer forthbg section" id="main4">
			<div class="forthintro">
				<div class="cols-100 porfl center">
					<h1 class="mg100">사업소개</h1>
					<span>우리는 모두 누군가에게 힘이 되는 사람입니다.</span>
				</div>
				<div class="cols-100 porfl center pc999" style="margin: 55px auto;">
					<div class="cols-10 forthConts_tp mg015 hand pc_frthcont">
						<img class="cols-100" src="/images/index/img_start.png" alt="대상별 사업소개">
						<div class="cols-100 left frcn_start">
							<h4>대상별</h4>
							<h4>사업소개</h4>
						</div>
					</div>
					<div class="cols-19 forthConts_tp pd05 hand ">
						<a href="/sub04/01?service=101"><img class="cols-100" src="/images/index/mbimg_contents12.png" alt="아동, 청소년별 사업소개" ></a>
					</div>
					<div class="cols-19 forthConts_tp pd05 hand">
						<a href="/sub04/01?service=102"><img class="cols-100" src="/images/index/mbimg_contents11.png" alt="성인별 사업소개"></a>
					</div>
					<div class="cols-19 forthConts_tp pd05 hand">
						<a href="/sub04/01?service=103"><img class="cols-100" src="/images/index/mbimg_contents14.png" alt="장애인별 사업소개"></a>
					</div>
					<div class="cols-19 forthConts_tp pd05 hand">
						<a href="/sub04/01?service=104"><img class="cols-100" src="/images/index/mbimg_contents13.png" alt="어르신별 사업소개"></a>
					</div>
				</div>
				<div class="cols-100 porfl center pc_frthcont" style="margin: 0 auto;">
					<div class="cols-15 forthConts_btm pd010 hand">
						<a href="/sub04/01?service=201"><img class="cols-100" src="/images/index/mbimg_contents15.png" alt="기관운영별 사업소개"></a>
					</div>
					<div class="cols-15 forthConts_btm pd010 hand">
						<a href="/sub04/01?service=202"><img class="cols-100" src="/images/index/mbimg_contents16.png" alt="사례관리별 사업소개"></a>
					</div>
					<div class="cols-15 forthConts_btm pd010 hand">
						<a href="/sub04/01?service=203"><img class="cols-100" src="/images/index/mbimg_contents17.png" alt="서비스제공별 사업소개"></a>
					</div>
					<div class="cols-15 forthConts_btm pd010 hand">
						<a href="/sub04/01?service=204"><img class="cols-100" src="/images/index/mbimg_contents18.png" alt="지역사회조직별 사업소개"></a>
					</div>
					<div class="cols-15 forthConts_btm pd010 hand">
						<a href="/sub04/01?service=205"><img class="cols-100" src="/images/index/mbimg_contents19.png" alt="지역아동센터별 사업소개"></a>
					</div>
					<div class="cols-12 forthConts_btm mgl20 hand">
						<img class="cols-100" src="/images/index/img_end.png" alt="사업별 소개">
						<div class="cols-100 left frcn_end">
							<h4>사업별</h4>
							<h4>사업소개</h4>
						</div>
					</div>
				</div>
				<!-- 모바일 사업소개 -->
				<div class="cols-100 porfl center mb754">
					<div class="cols-100 porfl mgt20 center">
						<div class="cols-19 forthConts_tp pd05 hand">
							<a href="/sub04/01?service=101"><img class="cols-100" src="/images/index/mbimg_contents12.png" alt="아동, 청소년별 사업소개"></a>
						</div>
						<div class="cols-19 forthConts_tp pd05 hand">
							<a href="/sub04/01?service=102"><img class="cols-100" src="/images/index/mbimg_contents11.png" alt="성인별 사업소개"></a>
						</div>
					</div>
					<div class="cols-100 porfl mgt10 center">
						<div class="cols-19 forthConts_tp pd05 hand">
							<a href="/sub04/01?service=103"><img class="cols-100" src="/images/index/mbimg_contents14.png" alt="장애인별 사업소개"></a>
						</div>
						<div class="cols-19 forthConts_tp pd05 hand">
							<a href="/sub04/01?service=104"><img class="cols-100" src="/images/index/mbimg_contents13.png" alt="어르신별 사업소개"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 후원 & 자원봉사 -->
		<!-- contents hover 효과 작업(참고사이트 효과) -->
		<div class="spsvwkWrap thirdbg section" id="main3">
			<div class="thirdintro pc999">

				<div class="cols-100 porfl center">
					<div class="cols-100 porfl pdb60 center">
						<h1 class="mg100">후원 & 자원봉사</h1>
						<span>우리는 모두 누군가에게 힘이 되는 사람입니다.</span>
					</div>
					<a href="/sub03/01"><div class="cols-23 thridConts mg010">
						<img class="cols-100 hand" src="/images/index/mbimg_contents01.png" alt="후원 안내 사람과 사람을 이어주는 또하나의 방법입니다.">
						<div class="thirdConts_txt center">
							<h3>후원 안내</h3>
							<span>사람과 사람을 이어주는 <br> 또하나의 방법입니다.</span>
						</div>
					</div></a>
					<a href="/sub03/02"><div class="cols-23 thridConts mg010">
						<img class="cols-100 hand" src="/images/index/mbimg_contents02.png" alt="후원 참여 나눔의 가치와 여러분의 마음을 전합니다.">
						<div class="thirdConts_txt center">
							<h3>후원 참여</h3>
							<span>나눔의 가치와 <br> 여러분의 마음을 전합니다.</span>
						</div>
					</div></a>
					<a href="/sub03/03"><div class="cols-23 thridConts mg010">
						<img class="cols-100 hand" src="/images/index/mbimg_contents03.png" alt="자원봉사 안내 장애인도 살만한 지역사회를 일굽니다.">
						<div class="thirdConts_txt center">
							<h3>자원봉사 안내</h3>
							<span>장애인도 살만한 <br> 지역사회를 일굽니다.</span>
						</div>
					</div></a>
					<a href="/sub03/03"><div class="cols-23 thridConts mg010">
						<img class="cols-100 hand" src="/images/index/mbimg_contents04.png" alt="자원봉사 참여 든든한 둘레가 되어주셔서 고맙습니다.">
						<div class="thirdConts_txt center">
							<h3>자원봉사 참여</h3>
							<span>든든한 둘레가 <br> 되어주셔서 고맙습니다.</span>
						</div></a>
					</div>
				</div>
			</div>
			<!-- 모바일 후원 & 자원봉사 -->
			<div class="thirdintro mb754">
				<div class="cols-100 porfl center mgt20">
					<h1 class="mg100">후원 & 자원봉사</h1>
					<span>우리는 모두 누군가에게 힘이 되는 사람입니다.</span>
				</div>

				<div class="cols-100 porfl mgt40 center">
					<div class="cols-23 thridConts mg010">
						<img class="cols-100 hand" src="/images/index/mbimg_contents01.png" alt="후원 안내 사람과 사람을 이어주는 또하나의 방법입니다.">
						<div class="thirdConts_txt center">
							<h3>후원 안내</h3>
							<span>사람과 사람을 이어주는 <br> 또하나의 방법입니다.</span>
						</div>
					</div>
					<div class="cols-23 thridConts mg010">
						<img class="cols-100 hand" src="/images/index/mbimg_contents02.png" alt="후원 참여 나눔의 가치와 여러분의 마음을 전합니다.">
						<div class="thirdConts_txt center">
							<h3>후원 참여</h3>
							<span>나눔의 가치와 <br> 여러분의 마음을 전합니다.</span>
						</div>
					</div>
				</div>
				<div class="cols-100 porfl mgt20 center">
					<div class="cols-23 thridConts mg010">
						<img class="cols-100 hand" src="/images/index/mbimg_contents03.png" alt="자원봉사 안내 장애인도 살만한 지역사회를 일굽니다.">
						<div class="thirdConts_txt center">
							<h3>자원봉사 안내</h3>
							<span>장애인도 살만한 <br> 지역사회를 일굽니다.</span>
						</div>
					</div>
					<div class="cols-23 thridConts mg010">
						<img class="cols-100 hand" src="/images/index/mbimg_contents04.png" alt="자원봉사 참여 든든한 둘레가 되어주셔서 고맙습니다.">
						<div class="thirdConts_txt center">
							<h3>자원봉사 참여</h3>
							<span>든든한 둘레가 <br> 되어주셔서 고맙습니다.</span>
						</div>
					</div>
				</div>
			</div>
	  </div>

<!--#include virtual="/includefiles/global/_footer.asp"-->
<!-- 스크립트 -->
<script src="/includefiles/js/jquery.arctic_scroll.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 메인 비주얼 롤링
		$('.firstbg-slider').slick({
			dots: true,
			infinite : true,
			autoplay: true,
			autoplaySpeed: 5700,
			prevArrow: '<div class="slick-arrow-left"><i class="fas fa-arrow-alt-circle-left"></i></div>',
			nextArrow: '<div class="slick-arrow-right"><i class="fas fa-arrow-alt-circle-right"></i></div>',
		  infinite: true,
		  speed: 1000,
		  slidesToShow: 1,
			draggable : false,
			pauseOnHover : false,
		});

		var screen_width = $(window).width();
		var screen_height = $(window).height();
		// alert(screen_width);
		// alert(screen_height);

		if(screen_width > 999 && screen_height > 755) {
			var myFullpage = new fullpage('#fullpage', {
				anchors: ['firstPage', 'secondPage', '3rdPage', '4thPage', 'endPage'],
				slidesNavigation: true,
			});
		}else{
			$('.slide-pause').hide();
			$('.slide-play').hide();
			$('.slick-arrow-left').hide();
			$('.slick-arrow-right').hide();
		}

		// 화면 줄이면 풀페이지 제거상태로 리로드
		$(window).resize(function(){
			//if(screen_height > 800)
			if (mobile_chk())
				location.reload();
		});

		// 슬라이드 일시정지
		$('.slide-pause').on('click',function(){
			$('.slide-pause').hide();
			$('.slide-play').show();
			$('.firstbg-slider').slick('slickPause');
		});
		// 슬라이드 다시 실행
		$('.slide-play').on('click',function(){
			$('.slide-play').hide();
			$('.slide-pause').show();
			$('.firstbg-slider').slick('slickPlay');
		});
		// 메인 슬라이드 스크롤 아이콘
		$('.firstbg-slider').append("<div class='mouse-scroll'><div class='m-scrl'><div class=''></div></div></div>");
	});
$(function(){
	$(".arctic_scroll").arctic_scroll({
                speed: 800
            });
});
</script>
		<!-- // 스크립트 -->
