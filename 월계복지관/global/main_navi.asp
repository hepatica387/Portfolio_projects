<!--#include virtual="/includefiles/html/siteinfo.html"-->
<!--#include virtual="/includefiles/html/secret.html"-->
<!--#include virtual="/includefiles/html/email.html"-->
﻿<div id="sknavi">
	<p><a href="#menuScroll" tabindex="1">주메뉴 바로가기</a></p>
	<p><a href="#body-cont" tabindex="1">본문 바로가기</a></p>
</div>
  <nav class="navContainer" id="header">
    <!-- 전체메뉴 -->
    <div class="cols-100">
      <div class="cols-100 top-login">
	  <div class="subMenuWrap">
        <div class="main">
          <!--<span><a href="javascript:void(0);" title="화면확대"><i class="fas fa-plus"></i></a></span>
          <span><a href="javascript:void(0);" title="화면맞게"><i class="far fa-window-maximize"></i></a></span>
          <span><a href="javascript:void(0);" title="화면축소"><i class="fas fa-minus"></i></a></span>-->
        </div>
        <div style="" class="login-main flex">
			<!-- <div> -->
        <%	If MYID = "" then%>
				<div class="maintopmenu-span"><a href="/sub100/01" title="로그인" class="title3"><i class="fa fa-user-circle-o "></i>로그인</a></div>
				<div class="maintopmenu-span"><a href="/sub100/02" title="회원가입" class="title3"><i class="fa fa-sign-in"></i>회원가입</a></div>
				<div class="maintopmenu-span"><a href="/sub06/01" title="브라보실버" class="title3"><i class="fa fa-blind"></i>브라보실버 </a></div>
				<div class="maintopmenu-span"><a href="/sub07/01" title="청소년 조직화" class="title3"><i class="fa fa-group"></i>청소년 조직화</a></div>
		<%	else%>
		  		<span class="maintopmenu-span"><a href="/includefiles/global/logout.asp" title="로그아웃" class="title3"><i class="fa fa-sign-out"></i>로그아웃</a></span>
				<span class="maintopmenu-span"><a href="/sub100/01/" title="정보수정" class="title3"><i class="fa fa-edit"></i>정보수정</a></span>
				<%If MYlevel < 13 And MYDEPART <> "" then%>
					<span class="maintopmenu-span"><a href="/contents/sub06/?act=Y&st=sub06&sMenu=03" title="브라보실버" class="title3"><i class="fa fa-blind"></i>브라보실버</a></span>
					<span class="maintopmenu-span"><a href="/contents/sub07/?act=Y&st=sub07&sMenu=03" title="청소년 조직화" class="title3"><i class="fa fa-group"></i>청소년 조직화</a></span>
				<%else%>
					<span class="maintopmenu-span"><a href="/sub06/01" title="브라보실버" class="title3"><i class="fa fa-blind"></i>브라보실버</a></span>
					<span class="maintopmenu-span"><a href="/sub07/01" title="청소년 조직화" class="title3"><i class="fa fa-group"></i>청소년 조직화</a></span>
				<%End if%>
		 <%	End If
			If MYID <> "" And MYLEVEL < 7 then %>
		  		<span class="maintopmenu-span"><a href="/administrator/" title="관리자 메뉴로 이동하기" class="title3"><i class="fa fa-id-badge"></i>관리자</a></span>
		<%End if%>
			<!-- </div> -->
			<div class="flex">
				<div style="padding:5px 0 0 15px"><span><a href="javascript:zoomReset();" >화면확대축소</a></span></div>
				<div style="padding:0 0 0 10px"><span><a href="javascript:zoomIn();" title="화면확대" class="title3"><i class="fa fa-plus-square-o"></i></a></span></div>
				<div style="padding:0 0 0 5px"><span><a href="javascript:zoomOut();" title="화면축소" class="title3"><i class="fa fa-minus-square-o"></i></a></span></div>
			</div>
        </div>
      </div>
	 </div>

      <div class="allMenuWrap ">
        <!-- 로고 -->
        <div class="pc_logo">
          <a href="/" style="/*display:inline;*/"><img src="/images/index/index_logo.png" class="logo" alt="로고 이미지"></a>
        </div>
        <!-- 메뉴버튼 -->
        <div class="menuBtn" onclick="showMenu(this);"><span></span></div>
        <!-- 메인메뉴 -->
        <ul class="main pdt10" id="menuScroll">
          <li onclick="showSubMenu(this);">
              <a href="#firstPage" class="arrow mgt5 arctic_scroll" data-offset="-90" title="기관소개">기관소개</a>
              <ul class="sub">
                <li><a href="/sub01/01" class="arctic_scroll"  data-offset="-90" title="회사소개"><i class="fa fa-university" aria-hidden="true"></i> 법인소개</a></li>
                <li><a href="/sub01/02"  class="arctic_scroll"  data-offset="-90" title="월계복지관 소개"><i class="fa fa-building-o" aria-hidden="true"></i> 월계복지관 소개</a></li>
                <li><a href="/sub01/03"  class="arctic_scroll"  data-offset="-90" title="미션 & 비전 & CI"><i class="fa fa-user-plus" aria-hidden="true"></i> 미션 & 비전 & CI</a></li>
                <li><a href="/sub01/04"  class="arctic_scroll"  data-offset="-90" title="운영/자문위원"><i class="fa fa-users" aria-hidden="true"></i> 운영/자문위원</a></li>
                <li><a href="/sub01/05"  class="arctic_scroll"  data-offset="-90" title="인사말"><i class="fa fa-handshake-o" aria-hidden="true"></i> 인사말</a></li>
                <li><a href="/sub01/06"  class="arctic_scroll"  data-offset="-90" title="연혁"><i class="fa fa-hourglass-half" aria-hidden="true"></i> 연혁</a></li>
                <li><a href="/sub01/07"  class="arctic_scroll"  data-offset="-90" title="온라인 기관 내방"><i class="fa fa-desktop" aria-hidden="true"></i> 온라인 기관 내방</a></li>
                <li><a href="/sub01/08"  class="arctic_scroll"  data-offset="-90" title="조직 및 인력"><i class="fa fa-sitemap" aria-hidden="true"></i> 조직 및 인력</a></li>
                <li><a href="/sub01/09"  class="arctic_scroll"  data-offset="-90" title="오시는 길"><i class="fa fa-map-o" aria-hidden="true"></i> 오시는 길</a></li>
              </ul>
          </li>
         <li onclick="showSubMenu(this);">
        		<a href="#secondPage" class="arrow mgt5" title="월계뉴스">월계뉴스</a>
            <ul class="sub">
              <li><a href="/board/?boardid=wwc_notice" class="arctic_scroll"  data-offset="-90" title="공지사항"><i class="fa fa-newspaper-o" aria-hidden="true"></i> 공지사항</a></li>
              <li><a href="/board/?boardid=support_board"  class="arctic_scroll"  data-offset="-90" title="나눔글"><i class="fa fa-leaf" aria-hidden="true"></i> 나눔글</a></li>
              <li><a href="/board/?boardid=support02"  class="arctic_scroll"  data-offset="-90" title="후원지출내역"><i class="fa fa-truck" aria-hidden="true"></i> 후원지출내역</a></li>
              <li><a href="/board/?boardid=wwc_note"  class="arctic_scroll"  data-offset="-90" title="소식지"><i class="fa fa-file-pdf-o" aria-hidden="true"></i> 소식지</a></li>
              <li><a href="/board/?boardid=recruit"  class="arctic_scroll"  data-offset="-90" title="채용정보"><i class="fa fa-id-badge" aria-hidden="true"></i> 채용정보</a></li>
              <li><a href="/board/?boardid=wwc_photo01"  class="arctic_scroll"  data-offset="-90" title="월계 갤러리"><i class="fa fa-picture-o" aria-hidden="true"></i> 월계 갤러리</a></li>
              <li><a href="/board/?boardid=youtube"  class="arctic_scroll"  data-offset="-90" title="유튜브"><i class="fa fa-youtube" aria-hidden="true"></i> 유튜브</a></li>
              <li><a href="/board/?boardid=wwc_pds01"  class="arctic_scroll"  data-offset="-90" title="월계뉴스"><i class="fa fa-file-audio-o" aria-hidden="true"></i> 월계뉴스</a></li>
			  <li><a href="/board/?boardid=wwc_QnA"  class="arctic_scroll"  data-offset="-90" title="고객의 소리"><i class="fa fa-users" aria-hidden="true"></i> 고객의 소리</a></li>
            </ul>
        	</li>
          <li onclick="showSubMenu(this);">
              <a href="#4thPage" title="후원&자원봉사" class="mgt5">후원&자원봉사</a>
              <ul class="sub">
                <li><a href="/sub03/01" class="arctic_scroll"  data-offset="-90" title="후원"><i class="fa fa-gift" aria-hidden="true"></i> 후원</a></li>
                <li><a href="/sub03/02" class="arctic_scroll"  data-offset="-90" title="후원"><i class="fa fa-envelope-open-o" aria-hidden="true"></i> 후원 신청</a></li>
                <li><a href="/sub03/03"  class="arctic_scroll"  data-offset="-90" title="자원봉사"><i class="fa fa-heartbeat" aria-hidden="true"></i> 자원봉사</a></li>
                <!--li><a href="/sub03/04"  class="arctic_scroll"  data-offset="-90" title="자원봉사"><i class="fa fa-" aria-hidden="true"></i> 자원봉사 신청</a></li-->
              </ul>
          </li>
          <li onclick="showSubMenu(this);">
              <a href="#3rdPage" title="사업소개" class="mgt5">사업소개</a>
              <ul class="sub">
                <li><a href="/sub04/01?service=101"  class="arctic_scroll"  data-offset="-90" title="대상별 사업"><i class="fa fa-blind" aria-hidden="true"></i> 대상별 사업</a></li>
				<li><a href="/sub04/02?service=201" class="arctic_scroll"  data-offset="-90" title="사업별 사업"><i class="fa fa-building" aria-hidden="true"></i> 사업별 사업</a></li>
              </ul>
          </li>
          <li class="mb_menuli" onclick="showSubMenu(this);">
            <a href="javascript:void(0);" data-offset="-90" class="mgt5 title="브라보 실버">브라보 실버</a>
            <ul class="sub">
			<%If (MYID <> "" And MYDEPART = "silver") Or (MYID <> "" And MYLEVEL < 12 )  Then %>
				<li><a href="/board/?boardid=mento_notice" class="arctic_scroll"  data-offset="-90" title="공지사항"><i class="fa fa-volume-down" aria-hidden="true"></i> 공지사항</a></li>
				<li><a href="/board/?boardid=bravo_board"  class="arctic_scroll"  data-offset="-90" title="Q&A 게시판"><i class="fa fa-question-circle-o" aria-hidden="true"></i> Q&A 게시판</a></li>
				<li><a href="/contents/sub06/?act=Y&st=sub06&sMenu=03"  class="arctic_scroll"  data-offset="-90" title="활동보고서"><i class="fa fa-pencil" aria-hidden="true"></i> 활동보고서</a></li>
				<li><a href="/sub06/04"  class="arctic_scroll"  data-offset="-90" title="정보수정"><i class="fa fa-pencil-square-o"" aria-hidden="true"></i> 정보수정</a></li>
			<%else%>
				<li><a href="/sub06/04"  class="arctic_scroll"  data-offset="-90" title="회원가입"><i class="fa fa-user-circle-o" aria-hidden="true"></i> 회원가입</a></li>
			<%End if%>
            </ul>
          </li>
          <li class="mb_menuli" onclick="showSubMenu(this);">
            <a href="javascript:void(0);" data-offset="-90" class="mgt5" title="청소년 조직화">청소년 조직화</a>
            <ul class="sub">
            <%If (MYID <> "" And MYDEPART = "youth") Or (MYID <> "" And MYLEVEL < 12 )  Then %>
				<li><a href="/board/?boardid=youth_notice" class="arctic_scroll"  data-offset="-90" title="공지사항"><i class="fa fa-volume-down" aria-hidden="true"></i> 공지사항</a></li>
				<li><a href="/board/?boardid=group_board"  class="arctic_scroll"  data-offset="-90" title="Q&A 게시판"><i class="fa fa-question-circle-o" aria-hidden="true"></i> Q&A 게시판</a></li>
				<li><a href="/contents/sub06/?act=Y&st=sub07&sMenu=03"  class="arctic_scroll"  data-offset="-90" title="활동보고서"><i class="fa fa-pencil" aria-hidden="true"></i> 활동보고서</a></li>
      	<li><a href="/sub07/04"  class="arctic_scroll"  data-offset="-90" title="정보수정"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 정보수정</a></li>
			<%else%>
			  	<li><a href="/sub07/04"  class="arctic_scroll"  data-offset="-90" title="회원가입"><i class="fa fa-user-circle-o" aria-hidden="true"></i> 회원가입</a></li>
			<%End if%>
            </ul>
          </li>
          <li class="mb_menuli" onclick="showSubMenu(this);">
            <a href="javascript:void(0);" data-offset="-90" class="mgt5" title="신청하기">신청하기</a>
            <ul class="sub">
              <li><a href="/sub05/01" class="arctic_scroll"  data-offset="-90" title="발달지원센터"><i class="fa fa-american-sign-language-interpreting" aria-hidden="true"></i> 발달지원센터</a></li>
              <li><a href="/sub05/02"  class="arctic_scroll"  data-offset="-90" title="전문상담"><i class="fa fa-volume-control-phone" aria-hidden="true"></i> 전문상담</a></li>
              <li><a href="/sub05/03"  class="arctic_scroll"  data-offset="-90" title="유무료교육"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 유무료교육</a></li>
              <li><a href="/sub05/04"  class="arctic_scroll"  data-offset="-90" title="이혼상담"><i class="fa fa-phone" aria-hidden="true"></i> 이혼상담</a></li>
              <li><a href="/sub05/05"  class="arctic_scroll"  data-offset="-90" title="시설대관"><i class="fa fa-sign-in" aria-hidden="true"></i> 시설대관</a></li>
              <li><a href="/sub05/06"  class="arctic_scroll"  data-offset="-90" title="기관내방"><i class="fa fa-street-view" aria-hidden="true"></i> 기관내방</a></li>
            </ul>
          </li>
          <li class="mb_menuli">
		  	<div class="cols-100 flex">
				<div class="cols-35 title2 "><a href="/sub100/01/?mode=login" title="로그인"><i class="fa fa-power-off" aria-hidden="true"></i> 로그인</a></div>
				<div class="title2 cols-35"><a href="/sub100/02/?mode=join" title="회원가입"><i class="fa fa-laptop" aria-hidden="true"></i> 회원가입</a></div>
			</div>
          </li>
        </ul>
      </div>
       <div class="nav-menu-open"></div>
    </div> <!-- allMenuWrap -->
  </nav>
  <div class="r-tabMenu-icon close_raudis hidden-xs">
    <a href="javascript:void(0);" title="신청하기 사이드 탭" style="color:#FFF" class="title2">
      <i class="fa fa-angle-double-left" aria-hidden="true"></i>
      <!-- <i class="fas fa-indent"></i> -->
     </a>
  </div>
  <div class="r-tabMenu">
    <div class="r-sub-tabMenu-start center"><i class="fas fa-pencil-square" aria-hidden="true"></i> 신청하기</div>
    <div class="r-sub-tabMenu"><a href="/sub05/01" title="발달지원센터"><i class="fa fa-american-sign-language-interpreting" aria-hidden="true"></i> 발달지원센터</a></div>
    <div class="r-sub-tabMenu"><a href="/sub05/02" title="전문상담"><i class="fa fa-volume-control-phone" aria-hidden="true"></i> 전문상담</a></div>
    <div class="r-sub-tabMenu"><a href="/sub05/03" title="유료무료교육"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 유료무료교육</a></div>
    <div class="r-sub-tabMenu"><a href="/sub05/04" title="이혼상담"><i class="fa fa-phone" aria-hidden="true"></i> 이혼상담</a></div>
    <div class="r-sub-tabMenu"><a href="/sub05/05" title="시설대관"><i class="fa fa-sign-in" aria-hidden="true"></i> 시설대관</a></div>
    <div class="r-sub-tabMenu"><a href="/sub05/06" title="기관내방"><i class="fa fa-street-view" aria-hidden="true"></i> 기관내방</a></div>
	<div class="r-sub-tabMenu-end  center">
		<a href="javascript:topmove();" title="맨 위로"><span class="t-inner title3" ><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></span></a>
		<a href="javascript:;"  title="퀵메뉴 숨기기"><span class="pdl40 hand title4 t-inner"><i class="fa fa-angle-double-right r-sub-tabMenu-close " aria-hidden="true"></i></span></a>
	</div>
  </div>
<script type="text/javascript">
  $(document).ready(function() {
  	// 메뉴 마우스 오버
  	$(".allMenuWrap .main > li").on("mouseover", function() {
  		if(!isMobile()) {
        $('.nav-menu-open').css('top','90px');
  		}
  	}).on("mouseout", function() {
  		if(!isMobile()) {
        $('.nav-menu-open').css('top','-187px');
  		}
  	});
    $('.allMenuWrap .main > li > a').keyup(function(e){
      if(e.keyCode == 9 && !isMobile()){
        $('.nav-menu-open').css('top','90px');
        $(this).parent().eq(0).children().eq(1).children().css("height","30px");
      }
    });
    $('.allMenuWrap .sub > li > a').focus(function(){
      if(!isMobile()) {
        $('.nav-menu-open').css('top','90px');
        $(this).parent().parent().eq(0).children().css("height","30px");
      }
    });
    $('.allMenuWrap .sub > li > a').blur(function(){
      if(!isMobile()) {
        $('.nav-menu-open').css('top','-187px');
        $(this).parent().parent().eq(0).children().css("height","0");
      }
    });
    $('.r-sub-tabMenu-close').on('click',function(){
      $('.r-tabMenu').css('right','-10%');
      $('.r-tabMenu-icon').css('right','0');
    });
    $('.r-tabMenu-icon').on('click',function(){
      $('.r-tabMenu-icon').css('right','-10%');
      $('.r-tabMenu').css('right','10px');
    });
  });
	function foot_link(id){
		$("#"+id).show();
	}
</script>
