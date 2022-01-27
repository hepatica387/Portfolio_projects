// 애니메이션 설정
$.fn.extend({
	setAnimate : function(effect, fade) {
		return this.each(function() {
			var $this = $(this);
			if(fade) $this.css("opacity","0");
			$(window).on("scroll", function() {
				var winTop = $(this).scrollTop();
				var screenH = $(this).height();
				var thisTop = $this.offset().top + screenH/6;
				if(winTop + screenH > thisTop) {
					$this.addClass(effect);
				}
			}).trigger("scroll");
		});
	}
});

/*------------------------------------------------------
· 메인 메뉴 라인생성
------------------------------------------------------ */


// 레이어 덮기
function showBlackLayer() {
	$("<div class='blackLayer'></div>").click(function() {
		$(".menuBtn").trigger("click");
	}).appendTo("body").fadeIn(200);
}
function removeBlackLayer() {
	$(".blackLayer").fadeOut(200, function() {
		$(this).remove();
	});
}

// 모바일 여부 반환
function isMobile() {
	return $(".menuBtn").is(":hidden") ? false : true;
}

// 메인메뉴 버튼
function showMenu(btn) {
	var menu = $(".allMenuWrap");
	if(menu.hasClass("open")) {
		$(btn).removeClass("open");
		menu.removeClass("open");
		removeBlackLayer();
		$("body").removeClass("freeze");
	} else {
		showBlackLayer();
		$(btn).addClass("open");
		menu.addClass("open");
		$("body").addClass("freeze");
	}
}

// 모바일 메뉴 클릭 시 서브메뉴 표시
function showSubMenu(li) {
	if(isMobile()) {
		if($(li).find(".sub")) {
			$(li).toggleClass("open").find(".sub").slideToggle(300);
			$(li).siblings("li").removeClass("open").find(".sub").slideUp(300);
		}
	}
}


// 페이지 로딩 후 처리
$(document).ready(function() {

	// 애니메이션 효과
	// 메인페이지
	$(".introWrap .left, .introWrap .left-img").setAnimate("animated fadeInLeft slow", true);
	$(".introWrap .right").setAnimate("animated fadeInUp slow", true);
	$(".introWrap .imgWrap img").setAnimate("animated fadeIn slow", true);
//	$(".innerWrap .textBox").setAnimate("animated fadeInUp slow", true);
	// 사업소개 각 항목
	//$(".projectList li .innerBox").setAnimate("animated fadeInUp", true);
	// 회사소개
	$(".figureWrap .left").setAnimate("animated rotateInUpLeft", true);
	$(".figureWrap .right").setAnimate("animated rotateInUpLeft", true);
	//$(".strategyWrap li").setAnimate("animated fadeInUp", true);
	
	$(".historyContainer .historyWrap").setAnimate("animated fadeIn slow", true);
	// 연혁
	//$(".historyList .left").setAnimate("animated fadeInLeft", true);
	//$(".historyList .right").setAnimate("animated fadeInUp", true);
	// 위치
	//$(".mapWrap").setAnimate("animated fadeIn slow", true);
	$(".locaDetail").setAnimate("animated fadeIn slow", true);
	
	// footer
	$(".footerWrap .sitemap").setAnimate("animated fadeInUp", true);
	//
	$(window).on("scroll", function() {
		var foot = $(".footerWrap .bottomWrap");
		var winTop = $(this).scrollTop();
		var screenH = $(this).height();
		var thisTop = foot.offset().top;
		if(winTop + screenH > thisTop) {
			foot.addClass("animated fadeInUp");
		}
	});
}); 