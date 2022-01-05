			<div class="header-sub_navi collapse black-shadow-md row" id="myCollapsible">
				<div class="container">					
					<ul class="unstyled"> 
						<li class="pull-left left" >									
							<div style="position:absolute;width:133px;margin-left:280px;" id="sub01" >
								<ul class="unstyled "   >
									<li><a href="/contents/?st=sub01&smenu=01" title="회사소개" id="0101">회사소개</a></li>
									<li><a href="/contents/?st=sub01&smenu=02" title="서비스소개" id="0102">서비스소개</a></li>
									<li><a href="/contents/?st=sub01&smenu=03" title="오시는 길" id="0103">오시는 길</a></li>									
								</ul>
							</div>
							<div style="position:absolute;width:134px;margin-left:410px" id="sub02"  >
								<ul class="unstyled "  >
									<li><a href="/contents/?st=sub02&smenu=01" title="이벤트등록" id="0201">이벤트등록</a></li>
									<li><a href="/contents/?st=sub02&smenu=02" title="이벤트목록" id="0202">이벤트목록</a></li>
								</ul>								
							</div>
							<div style="position:absolute;width:127px;margin-left:550px" id="sub03"  >
								<ul class="unstyled "  >
									<li><a href="/board/?boardid=Notice&st=sub03&sMenu=01" title="공지사항" id="0301">공지사항</a></li>
									<li><a href="/board/?boardid=work&st=sub03&sMenu=02" title="작업자료" id="0302">작업자료</a></li>
									<li><a href="/board/?boardid=example&st=sub03&sMenu=03" title="적용사례" id="0303">적용사례</a></li>									
								</ul>												
							</div>
							<div style="position:absolute;width:147px;margin-left:680px" id="sub04"  >
								<ul class="unstyled "  >
									<li><a href="/contents/?st=sub04&smenu=01" title="달력보기" id="0401">달력보기</a></li>									
								</ul>													
							</div>
							<div style="position:absolute;width:110px;margin-left:810px" id="sub05"  >
								<ul class="unstyled " >
									<li><a href="/board/?arng=write&boardid=QNA&st=sub05&sMenu=01" title="문의등록" id="0501">문의등록</a></li>
									<li><a href="/board/?boardid=QNA&st=sub05&sMenu=02" title="문의목록" id="0502">문의목록</a></li>
									<li><a href="/contents/?st=sub05&smenu=03" title="처음 상담" id="0503">처음 상담</a></li>	
								</ul>													
							</div>							
							<div style="position:relative;left:860px;top:190px">
								<ul class="unstyled">
									<li class="wid120"><a href="#" onclick="$('#myCollapsible').collapse('hide');" ><i class="el el-remove-sign"></i> 메뉴닫기</a></li>
								</ul>
							</div>
							
						</li>					
					</ul>
					<img src="/images/navi/sub_navi_bg.jpg" class="pull-left" alt="메뉴 백 이미지"/>
				</div>
			</div>
<script type="text/javascript">
	
function showGnbSub() {
		$('.main-navi ul.Mmenu > li > a > img').each(function(){$(this).attr("src",$(this).attr("src").replace("over","out"))});	
		var Imgsrc = $(this).attr("src").replace("out","over");
		$(this).attr("src",Imgsrc);
	}

	
	function showSub() {
		$('#sIMG ul.sMenu > li > a > img').each(function(){overImg});	
		var Imgsrc = $(this).children("img").attr("src").replace("out","on");
		var Imgsrc1 = $(this).children("img").attr("src").replace("on","out");
		$(this).children("img").attr("src",Imgsrc);
		$(this).mouseout(function(){
		$(this).children("img").attr("src",Imgsrc1);
		});
	}

function outImg() { 
	var Imgsrc = $(this).attr("src").replace("over","out");
	$(this).attr("src",Imgsrc); }
	
function overImg() { 			
	var Imgsrc = $(this).attr("src").replace("out","over");
	$(this).attr("src",Imgsrc);	}

function navi_show(v1) {	
		if ($("#navi_over").css("display") == "none") {
			$("#navi_over").show();
		}
		$('#myCollapsible').collapse('show');					
}
</script>