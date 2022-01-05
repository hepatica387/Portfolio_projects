<nav class="navContainer" id="header">
<!-- 전체메뉴 -->
	<div class="cols-100 nav-login">
	  <div class="cols-100 top-login">
			<div class="subMenuWrap">
		    <div class="main">
		    </div>
		    <div style="" class="login-main flex">
			<!-- <div> -->
		  <%	If MYID = "" then%>
					<span class="maintopmenu-span"><a href="/sub100/01" title="로그인" class="title3"><i class="fa fa-user-circle-o "></i>로그인</a></span>
					<span class="maintopmenu-span"><a href="/sub100/02" title="마이페이지" class="title3"><i class="fa fa-edit"></i>회원가입</a></span>
			<%	else%>
			  		<span class="maintopmenu-span"><a href="/includefiles/global/logout.asp" title="로그아웃" class="title3"><i class="fa fa-sign-out"></i>로그아웃</a></span>
					<span class="maintopmenu-span"><a href="/sub100/01" title="마이페이지" class="title3"><i class="fa fa-edit"></i>마이페이지</a></span>
					<!--span class="maintopmenu-span"><a href="/sub100/03" title="마이페이지" class="title3"><i class="fa fa-sign-out"></i>회원탈퇴</a></span-->
			 <%	End If
				If MYID <> "" And MYLEVEL < 7 then %>
			  		<span class="maintopmenu-span"><a href="/administrator/" title="관리자 메뉴로 이동하기" class="title3"><i class="fa fa-id-badge"></i>관리자</a></span>
			<%End if%>
			<!-- </div> -->
		    </div>
		  </div>
		</div>

	  <div class="allMenuWrap ">
	    <!-- 로고 -->
	    <div class="pc_logo">
	      <a href="/" style="/*display:inline;*/"><img src="/images/nav_logo.png" class="logo" alt="로고 이미지"></a>
	    </div>
	    <!-- 메뉴버튼 -->
	    <div class="menuBtn" onclick="showMenu(this);"><span></span></div>
	    <!-- 메인메뉴 -->
	    <ul class="main" id="menuScroll">
	      <li onclick="showSubMenu(this);">
	          <a href="/sub01/01" class=" mgt10 "title="코파스 소개">코파스 소개</a>
	          <ul class="sub subline1">
	            <li><a href="/sub01/01" class="" title="기업소개"> 기업소개</a></li>
	            <li><a href="/sub01/02"  class="" title="인사말"> 인사말</a></li>
	            <li><a href="/sub01/03"  class="" title="연혁"> 연혁</a></li>
				<li><a href="/sub01/04"  class="" title="비전 & 미션"> 비전 & 미션</a></li>
	            <li><a href="/sub01/05"  class="" title="조직도"> 조직도</a></li>
				<li><a href="/sub01/06"  class="" title="사업영역">사업영역</a></li>
	            <li><a href="/sub01/07"  class="" title="사업장안내">사업장안내</a></li>
	            <li><a href="/sub01/08"  class="" title="주요거래처"> 주요거래처</a></li>
	          </ul>
	      </li>
			<li onclick="showSubMenu(this);">
				<a href="/productK/" class="arrow mgt10" title="코파스">코파스 볼트</a>
				<ul class="sub subline2">
					<%whereSql = " where codeNum='100'  and isDel = 'N'"
					Flds	= " ctrans, seq "
					OrderBy = " ORDER BY seq desc"
					'strSql = "exec Pro_hepatica_select '"&db_table&"','"&SqlFields&"', '"&whereProSql&"'"
					arrParams = Array( _
						DB.makeParam("@db_table",advarWchar, adParamInput, Len("TBL_CATEGORY")+1, "TBL_CATEGORY"), _
						DB.makeParam("@sFileds",advarWchar, adParamInput, Len(Flds)+1, Flds), _
						DB.makeParam("@whereSql",advarWchar, adParamInput, Len(whereSql)+1, whereSql) _
					)
					arrFields = DB.execRsList("Pro_hepatica_select", DB_CMDTYPE_SP, arrParams, listLen, 1)
					If Not IsNull(arrFields) Then
					For m_i = 0 To UBound(arrFields, 2)
						strctrans	= arrFields(0, m_i)%>
						<li><a href="/productK/?st=productK&category_seq=<%=arrFields(1, m_i)%>"><%=strctrans%></a></li>

				<%		Next
					End if%>
				</ul>
			</li>
			<li onclick="showSubMenu(this);">
				<a href="/productM/" class="arrow mgt10" title="미스미">코파스 F.A 부품</a>
				<ul class="sub subline3">
				<%whereSql = " where codeNum='110' and isDel = 'N'"
					Flds	= " ctrans, seq "
					OrderBy = " ORDER BY seq desc"
					'strSql = "exec Pro_hepatica_select '"&db_table&"','"&SqlFields&"', '"&whereProSql&"'"
					arrParams = Array( _
						DB.makeParam("@db_table",advarWchar, adParamInput, Len("TBL_CATEGORY")+1, "TBL_CATEGORY"), _
						DB.makeParam("@sFileds",advarWchar, adParamInput, Len(Flds)+1, Flds), _
						DB.makeParam("@whereSql",advarWchar, adParamInput, Len(whereSql)+1, whereSql) _
					)
					arrFields = DB.execRsList("Pro_hepatica_select", DB_CMDTYPE_SP, arrParams, listLen, 1)
					If Not IsNull(arrFields) Then
					For m_i = 0 To UBound(arrFields, 2)
						strctrans	= arrFields(0, m_i)%>
						<li><a href="/productM/?st=productM&category_seq=<%=arrFields(1, m_i)%>"><%=strctrans%></a></li>
				<%		Next
					End if%>
				</ul>
			</li>

	      <li onclick="showSubMenu(this);">
	          <a href="/sub03/01" title="기술현황" class="mgt10">기술현황</a>
	          <ul class="sub subline4">
	            <li><a href="/sub03/01" class="" title="코파스볼트 특징"> 코파스볼트 특징</a></li>
	            <li><a href="/sub03/02" class="" title="생산규격">생산규격</a></li>
				<li><a href="/sub03/03" class="" title="정밀가공사업부 ">정밀가공사업부 </a></li>
	            <li><a href="/sub03/04"  class="" title="연구개발 및 품질관리"> 연구개발 및 품질관리</a></li>
				<li><a href="/board/?boardid=machine"  class="" title="품질관리 설비 보유현황">품질관리 설비 보유현황</a></li>
				<li><a href="/board/?boardid=auth"  class="" title="인증현황">인증현황</a></li>
	          </ul>
	      </li>
	      <li onclick="showSubMenu(this);">
	          <a href="/board/?boardid=notice" title="고객지원" class="mgt10">고객지원</a>
	          <ul class="sub subline5">
	            <li><a href="/board/?boardid=notice"  class="" title="뉴스/공지">뉴스/공지</a></li>
				<li><a href="/board/?boardid=gall" class="" title="갤러리"> 갤러리</a></li>
				<li><a href="/sub04/03" class="" title="카다로그"> 홍보자료</a></li>
				<li><a href="/board/?boardid=qna_bbs" class="" title="온라인 문의"> 고객문의</a></li>
	          </ul>
	      </li>
	    <li class="mb_menuli">
		  	<div class="cols-100 flex">
					<%If MYID = "" then%>
					<div class="cols-35 title2 "><a href="/sub100/01" title="로그인"><i class="fa fa-power-off" aria-hidden="true"></i> 로그인</a></div>
					<div class="title2 cols-35"><a href="/sub100/02/?mode=join" title="회원가입"><i class="fa fa-laptop" aria-hidden="true"></i> 회원가입</a></div>
					<%else%>
					<div class="cols-35 title2 "><a href="/includefiles/global/logout.asp" title="로그아웃" ><i class="fa fa-sign-out"></i> 로그아웃</a></div>
					<div class="title2 cols-35"><a href="/sub100/01/" title="정보수정" ><i class="fa fa-edit"></i> 정보수정</a></div>
					<%End if%>
				</div>
	    </li>
	    </ul>
	  </div>
	   <div class="nav-menu-open"></div>
	</div> <!-- allMenuWrap -->
</nav>
<script type="text/javascript">
  $(document).ready(function() {
  	// 메뉴 마우스 오버
  	$(".allMenuWrap .main > li").on("mouseover", function() {
      $('.nav-menu-open').css('top','0px');
  	}).on("mouseout", function() {
      $('.nav-menu-open').css('top','-327px');
  	});
    $('.allMenuWrap .main > li > a').keyup(function(e){
      if(e.keyCode == 9){
        $('.nav-menu-open').css('top','0px');
        $(this).parent().eq(0).children().eq(1).children().css("height","28px");
      }
    });
    $('.allMenuWrap .sub > li > a').focus(function(){
      $('.nav-menu-open').css('top','0px');
      $(this).parent().parent().eq(0).children().css("height","28px");
    });
    $('.allMenuWrap .sub > li > a').blur(function(){
      $('.nav-menu-open').css('top','-327px');
      $(this).parent().parent().eq(0).children().css("height","0");
    });
  });
</script>
