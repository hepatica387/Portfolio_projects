<!--#include virtual="/LIB/_headinclude.asp"-->
<!--#include file="includefiles/func/function.auth.asp"-->
<!--#include file="includefiles/global/_array.asp"-->
<!--#include virtual="/includefiles/global/global_head.asp"-->
<!--#include virtual="/includefiles/global/main_popchk.asp"-->
<link rel="stylesheet" href="/includefiles/css/fullPage.css">
<script src="/includefiles/js/fullPage.js"></script>
 <script type="text/javascript">
    $(document).ready(function(){
      AOS.init();
      $('.aos-active').removeClass("aos-animate");
      var fullPage = new fullpage("#fullPage", {
        anchors: ['page1', 'page2', 'page3', 'page4', 'page5', 'Footer'],
        navigationTooltips: ['브랜드 스토리', '제조사 스토리', 'Green', 'Blue', '탄소발자국', 'Footer'],
        navigation: true,
        afterLoad: function(o, d){
          // 구역을 불러오고 나서 스크롤이 끝나면 발생
          // o : 활성화된 페이지 anchors, d : 다음 목적지 페이지 anchors
			if(d.anchor == "page1"){
				pageShow(1);
				$(".page1-1").fadeOut(3000);
            }else if(d.anchor == "page2"){
				pageShow(2);
				$(".page2-1").fadeOut(3000);
            }else if(d.anchor == "page3"){
				pageShow(3);
				$(".page3-1").fadeOut(3000);
            }else if(d.anchor == "page4"){
				pageShow(4);
				$(".page4-1").fadeOut(3000);
            }else if(d.anchor == "page5"){
				pageShow(5);
				$(".page5-1").fadeOut(3000);
            }
          if(d.anchor != "Footer"){
            setTimeout(function() {
              $("." + o.anchor + " .aos-active").removeClass("aos-animate");
              $("." + d.anchor + " .aos-active").addClass("aos-animate");
            }, 700);
          }
        }
      });
    });

	function pageShow(n){
		for (i = 1 ; i <= 5 ; i++ ){
			if (n != i ){
				$(".page"+i+"-1").show(0)
			}
		}
	}
  </script>

<!-- Start Nav Contents Area -->
<!--#include virtual="/includefiles/global/site_menu.asp"-->
  <div id="fullPage">
    <div class="section page1">
		<div class="page1-1"></div>
		  <div class="container">
			<div class="col-xs-12 ctner-contents1 text-center black">
			  <div class="col-xs-12 contents1-txt aos-active" data-aos="fade-up" data-aos-delay="100" data-aos-duration="1000">인류와 후대를 생각하는 <span class="t600">브랜드 틴터스</span></div>
			  <div class="col-xs-12 contents1-txt aos-active" data-aos="fade-up" data-aos-delay="200" data-aos-duration="1000">우리가 오늘을 살아가는 모든 지원은 미래의 후대들에게 빌려온 것이라는 말이 있습니다.</div>
			  <div class="col-xs-12 contents1-txt aos-active" data-aos="fade-up" data-aos-delay="300" data-aos-duration="1000"><span class="t600">오늘만을 살아가는 이기주의를 벗고,</span></div>
			  <div class="col-xs-12 contents1-txt aos-active" data-aos="fade-up" data-aos-delay="400" data-aos-duration="1000">인간과 인간와 자연이 <span class="t600">조화롭고 평화롭게 살 수 있는 지속가능한 미래가</span> 필요합니다.</div>
			  <div class="col-xs-12 contents1-txt aos-active" data-aos="fade-up" data-aos-delay="500" data-aos-duration="1000">이를 위해 <span class="t600">틴터스는 스미트 기술 기반의 로하스 기업</span>임을 선포합니다.</div>
			  <div class="col-xs-12 mgt70 aos-active"  data-aos="fade-up" data-aos-delay="600" data-aos-duration="1000">
				<a href="javascript:void(0);">
				  <div class="btn nowbtn">바로가기</div>
				</a>
			  </div>
			</div>
		  </div>

    </div>
    <div class="section page2">
		  <div class="page2-1"></div>
		  <div class="container cont2">
			<div class="col-xs-12 ctner-contents2 black">
			  <div class="col-xs-12 contents2-span aos-active" data-aos="fade-left" data-aos-delay="100" data-aos-duration="1000">
				<span>t</span>echnology
				<div class="contents2-unline"></div>
			  </div>
			  <div class="col-xs-12 contents2-span aos-active" data-aos="fade-left" data-aos-delay="200" data-aos-duration="1000">
				<span>s</span>pecificity
				<div class="contents2-unline"></div>
			  </div>
			  <div class="col-xs-12 contents2-span aos-active" data-aos="fade-left" data-aos-delay="300" data-aos-duration="1000">
				<span>d</span>istinction
			  </div>
			  <div class="col-xs-12 contents2-txt mgt30 aos-active" data-aos="fade-up" data-aos-delay="400" data-aos-duration="1000">윈도우 필름의 새로운 기준과 표준을 제시하는 '틴터스'.</div>
			  <div class="col-xs-12 contents2-txt aos-active" data-aos="fade-up" data-aos-delay="500" data-aos-duration="1000">앞서가는 기술력, 특수성, 차별성으로 최상의 제품을 제공합니다.</div>
			  <div class="col-xs-12 mgt30 aos-active"  data-aos="fade-up" data-aos-delay="600" data-aos-duration="1000">
				<a href="javascript:void(0);">
				  <div class="btn nowbtn">바로가기</div>
				</a>
			  </div>
			</div>
		  </div>
    </div>
    <div class="section page3">
	  <div class="page3-1"></div>
      <div class="container cont3">
        <div class="ctner-contents3 white">
          <div class="col-xs-12 contents3-strg aos-active" data-aos="fade-left" data-aos-delay="100" data-aos-duration="1000">
            <strong>틴터스</strong>_Green
          </div>
          <div class="col-xs-12 contents3-txt mgt30 aos-active" data-aos="fade-up" data-aos-delay="200" data-aos-duration="1000">‘자외선 차단, 낮은 차폐계수 실현, 에너지 효율 강화’</div>
          <div class="col-xs-12 contents3-txt aos-active" data-aos="fade-up" data-aos-delay="300" data-aos-duration="1000">HR(heat reflection) 공법을 활용한 친환경 프리미엄 윈도우 필름</div>
          <div class="col-xs-12 mgt30 aos-active"  data-aos="fade-up" data-aos-delay="400" data-aos-duration="1000">
            <a href="javascript:void(0);">
              <div class="btn nowbtn">바로가기</div>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="section page4">
	  <div class="page4-1"></div>
      <div class="container cont4">
        <div class="ctner-contents4 white">
          <div class="col-xs-12 contents4-strg aos-active" data-aos="fade-left" data-aos-delay="100" data-aos-duration="1000">
            <strong>스마트 특화 프리미엄 라인</strong>
          </div>
          <div class="col-xs-12 contents4-strg aos-active" data-aos="fade-left" data-aos-delay="100" data-aos-duration="1000">
            <strong>틴터스</strong>_Blue
          </div>
          <div class="col-xs-12 contents4-txt mgt30 aos-active" data-aos="fade-up" data-aos-delay="200" data-aos-duration="1000">‘열 차단, 자외선 차단, 시인성 확보, 내구성 강화’</div>
          <div class="col-xs-12 contents4-txt aos-active" data-aos="fade-up" data-aos-delay="300" data-aos-duration="1000">- <strong>U-Value + G-Value 강화</strong> 고효율 스마트 프리미엄 윈도우 필름 -</div>
          <div class="col-xs-12 mgt30 aos-active"  data-aos="fade-up" data-aos-delay="400" data-aos-duration="1000">
            <a href="javascript:void(0);">
              <div class="btn nowbtn">바로가기</div>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="section page5">
	  <div class="page5-1"></div>
      <div class="container">
        <div class="col-sm-12 col-xs-12 ctner-contents5 text-center">
          <div class="col-sm-12 col-xs-12 contents5-span aos-active" data-aos="fade-left" data-aos-delay="100" data-aos-duration="1000">
            <span>탄소발자국</span> _Carbonfootprint 줄이기
          </div>
          <div class="col-sm-12 col-xs-12 contents5-strg aos-active" data-aos="fade-left" data-aos-delay="200" data-aos-duration="1000">
            <div class="contents5-unline aos-active" data-aos="fade-left" data-aos-delay="300" data-aos-duration="1000"></div>
            지구를 달구는 <strong>CO2의 흔적을 지우자, 탄소발자국을 지우자.</strong>
          </div>
          <div class="col-sm-12 col-xs-12 mgt50">
            <div class="col-sm-4 col-xs-12 m_contents5-flex">
              <div class="contents5-img aos-active" data-aos="fade-up" data-aos-delay="400" data-aos-duration="1000">
                <img src="assets/images/img-co2.png" alt="">
              </div>
              <div class="img-conts aos-active" data-aos="fade-up" data-aos-delay="500" data-aos-duration="1000">
                <strong>탄소배출의 감소를 유도</strong>할 수 있도록<br>
                적절한 실내환경 유지에 최적화된 제품<br>
                <strong>개발·보급에 집중</strong>한다.
              </div>
            </div>
            <div class="col-sm-4 col-xs-12 m_contents5-flex">
              <div class="contents5-img aos-active" data-aos="fade-up" data-aos-delay="600" data-aos-duration="1000">
                <img src="assets/images/img-efriendly.png" alt="">
              </div>
              <div class="img-conts aos-active" data-aos="fade-up" data-aos-delay="700" data-aos-duration="1000">
                에코프렌들리(Echo Friendly) 제품을<br>
                통해 <strong>탄소배출의 발생을</strong><br>
                <strong>최대한 억제</strong>한다.
              </div>
            </div>
            <div class="col-sm-4 col-xs-12 m_contents5-flex">
              <div class="contents5-img aos-active" data-aos="fade-up" data-aos-delay="800" data-aos-duration="1000">
                <img src="assets/images/img-conn.png" alt="">
              </div>
              <div class="img-conts aos-active" data-aos="fade-up" data-aos-delay="900" data-aos-duration="1000">
                집중과 연구를 통해 <strong>사람과 자연의 연결</strong>이<br>
                더욱 공고해 질 수 있는<br>
                <strong>서비스를 제공</strong>한다.
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


  <!--#include virtual="/includefiles/global/_footer.asp"-->