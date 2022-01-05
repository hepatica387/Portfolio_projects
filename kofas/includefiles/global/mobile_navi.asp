<div id="mobileMenu" class="hidden-lg hidden-md" style="z-index:9999">				
	<div class="m-navi-header left row">
	  <h1 class="ir">구립중림데이케어센터</h1>
	  <div class="m-logl f-left"><a href="/" ><img src="/images/navi/M_logo.png" alt="사회복지법인 대한불교조계종사회복지재단 구립중림어르신데이케어센터"/></a></div>
	  <div class="m-iconbar f-right"><a href="javascript:;" onclick="m_navi_on();"><img src="/images/navi/m-iconbar.png" alt="메뉴 펼침"/></a></div>
	</div>
	<div class="mb_Navi left">
		<h2 class="ir">모바일 주메뉴</h2>
		<div class="cols-100 right pdr10 pdt10 btn_close"><a href="javascript:;" onclick="$('.mb_Navi').fadeOut();" ><img src="/images/navi/btn_close.png"  alt="메뉴 닫음" width="30"/></a></div>
		<ul id="navi" class="unstyled">			
			<li><a href="javascript:;" class=" title3" >사업안내</a>
				<ul class="subMenu all-unstyled mgl15">
					<li><a href="/contents/?st=sub01&sMenu=01" class="title2" >사업내용</a></li>
					<li><a href="/contents/?st=sub01&sMenu=02" class="title2" >프로그램안내</a></li>
				</ul>
			</li>
			<li><a href="javascript:;" class=" title3">입소</a>
				<ul class="subMenu all-unstyled mgl15">
					<li><a href="/contents/?st=sub02&sMenu=01" class="title2">시설안내</a></li>
					<li><a href="/contents/?st=sub02&sMenu=02" class="title2">입소안내</a></li>
					<li><a href="/contents/?st=sub02&sMenu=03" class="title2">이용료 보기</a></li>
				</ul>
			</li>
			<li><a href="/board/?boardid=Jopinfo" class=" title3" >채용정보</a></li>			
			<li><a href="javascript:;" class=" title3" >후원/자원봉사</a>
				<ul class="subMenu all-unstyled mgl15">
					<li><a href="/contents/?st=sub04&sMenu=01" class="title2" >후원안내</a></li>
					<li><a href="/contents/?st=sub04&sMenu=02" class="title2" >후원신청</a></li>
					<li><a href="/contents/?st=sub04&sMenu=03" class="title2" >자원봉사안내</a></li>
					<li><a href="/contents/?st=sub04&sMenu=04" class="title2" >자원봉사신청</a></li>
				</ul>
			</li>
			<li><a href="javascript:;" class=" title3" >알림마당</a>
				<ul class="subMenu all-unstyled mgl15">
					<li><a href="/board/?boardid=Notice" class="title2">공지사항</a></li>
					<li><a href="/board/?boardid=Gallery" class="title2" >갤러리</a></li>
					<li><a href="/board/?boardid=freeboard" class="title2">가족의견나눔</a></li>
					<li><a href="/contents/?st=sub05&sMenu=04" class="title2">월별계획표</a></li>
					<li><a href="/board/?boardid=board001" class="title2">식단표</a></li>
					<li><a href="/board/?boardid=vodboard" class="title2">동영상</a></li>
				</ul>
			</li>
			<li><a href="javascript:;" class="title3" >센터소개</a>
				<ul class="subMenu all-unstyled mgl15">
					<li><a href="/contents/?st=sub06&sMenu=01" class="title2" >대표인사말</a></li>
					<li><a href="/contents/?st=sub06&sMenu=02" class="title2" >인사말</a></li>
					<li><a href="/contents/?st=sub06&sMenu=03" class="title2" >법인소개</a></li>
					<li><a href="/contents/?st=sub06&sMenu=04" class="title2" >센터소개</a></li>
					<li><a href="/contents/?st=sub06&sMenu=05" class="title2" >함께하는 사람들</a></li>
					<li><a href="/contents/?st=sub06&sMenu=06" class="title2" >오시는 길</a></li>
				</ul>
			</li>
		</ul>
	</div>
<script>
	function m_navi_on(){
		$(".mb_Navi").fadeIn();
	}
	$(document).ready(function(){
		$(".subMenu").hide();		
		var winH = $(window).height();	
		var winW = $(window).width();
		if(winW > 740){
			$('#navi li').mouseenter(function(){
				$(this).find('.subMenu').fadeIn('fast');
			}).mouseleave(function(){
				$(this).find('.subMenu').fadeOut('fast');
			});
		}else{
			$('#navi li').click(function(){
				$(this).find('.subMenu').slideToggle();
				$(this).siblings().find('.subMenu').slideUp();				
			});
		}
	});
	</script>
</div>	