<!--#include virtual="/LIB/_headInclude.asp"-->
<!--#include virtual="/LIB/CharSet_utf.asp"-->
<%
' sinCode		: 201 : 온라인 신청, 202 : 대관신청 , 203 : 방문신청
sinCode				= Request.queryString("sinCode")
%>
<form method="post" name="form1" action="/includefiles/global/visit_sin_process.asp" onsubmit="return false">
<section class="section1 ">
  <div class="innerWrap">
    <div class="section1-cont1 mg200">
  			<div class="spn-application">
          <div class="spn-application-stitle t500">기본 개인정보 수집</div>
          <p>1. 개인정보의 수집 목적 : 월계종합사회복지관 사회복지 서비스 사업에 관련한 지원과 서비스 제공<br>
  					 2. 개인정보의 보유 및 이용기간 : 이용기간 : 해당 지원과 서비스가 제공되는 기간<br>
  					 3. 보유기간 : 해당 지원과 서비스가 제공되는 기간으로부터 3년 보관 수집 및 이용하는 기본 개인정보 항목 성명, 생년월일, 주소, 연락처 문자/이메일/우편 발송 동의 거부 권리 및 동의 거부에 따른 제한사항 귀하는 개인정보 제공 및 동의를 거부할 권리가 있으며, 위 항목 동의 거부 시 월계종합사회복지관 서비스 신청 및 참여가 어려워질 수 있습니다.</p>
          <div class="spn-application-chkbox">
            <input type="checkbox" name="info01" id="info01">
            <label for="info01">동의합니다.</label>
          </div>
        </div>
    </div>
  </div>
</section>

<section class="section2 mgb60">
  <div class="innerWrap">
    <div class="section2-cont1 spn-apptn-tb">
      <table class="table table-bordered" summary="기관내방 신청" id="table03">
        <tbody>
          <tr>
            <th><label for="stype">인원 구분</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default active">
                  <input type="radio" name="stype" value="1" class="form-control" checked onclick="visit_chk(1)">10인 이하
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="stype" value="2" class="form-control" onclick="visit_chk(2)">10인 이상
                </label>
              </div>
            </td>
          </tr>
		  <tr class="visit_one">
            <th><label for="visit_date">희망방문일과 시간</label></th>
            <td>
              <div class="tb03-cont1 flex " style="width: 100%;">
			  	<div class="flex-mg">
		            <input type="date" name="visit_date" maxlength="10" class="form-control" placeholder="1988-01-12">
				</div>
				<div class="flex-mg">
	                <input type="time" name="visit_time" maxlength="10" class="form-control" placeholder="12:00">
				</div>
              </div>
				<p>* 공식적인 기관방문일은 매월 3째주 화요일 오후 2시~5시 중 1시간입니다.</p>

            </td>
          </tr>
          <tr class="visit_many" style="display:none">
		  	<th><label for="many_date1">희망방문일과 시간</label></th>
            <td>
              <p>10인이상 단체방문시 </p>
			  <div class="tb03-cont1 flex flex-middle" style="width: 100%;">
			  	<div class="flex-mg pdt3">1안</div>
				<div class="flex-mg">
		            <input type="date" name="many_date1" maxlength="10" class="form-control" placeholder="1988-01-12">
				</div>
				<div class="flex-mg">
	                <input type="time" name="many_time1" maxlength="10" class="form-control" placeholder="12:00">
				</div>
              </div>
              <div class="tb03-cont1 flex " style="width: 100%;">
			  	<div class="flex-mg pdt3">2안</div>
			  	<div class="flex-mg">
		            <input type="date" name="many_date2" maxlength="10" class="form-control" placeholder="1988-01-12">
				</div>
				<div class="flex-mg">
	                <input type="time" name="many_time2" maxlength="10" class="form-control" placeholder="12:00">
				</div>
              </div>
            </td>
          </tr>
          <tr>
            <th style="width:25%"><label for="sName">신청자 대표</label></th>
            <td>
				<div class="flex">
	              <div><input type="text" name="sName" maxlength="50" class="form-control" placeholder="신청자 대표"></div>
				</div>
            </td>
          </tr>
          <tr>
            <th><label for="phone1">연락처(핸드폰)</label></th>
            <td>
              <ul class="all-unstyled">
                <li class="pull-left"><input type="text" name="phone1" maxlength="3" style="width:50px" class="form-control" placeholder="010"></li>
                <li class="pull-left"><input type="text" name="phone2" maxlength="4" style="width:80px" class="form-control mgl10" placeholder="1234"></li>
                <li class="pull-left"><input type="text" name="phone3" maxlength="4" style="width:80px" class="form-control mgl10" placeholder="5678"></li>
              </ul>
            </td>
          </tr>
          <tr>
            <th><label for="sEmail">이메일</label></th>
            <td>
              <div class="tb03-cont4">
                <input type="email" name="sEmail" class="form-control mgr10" placeholder="aaaa@naver.com" style="width:40%">
              </div>
            </td>
          </tr>
          <tr>
            <th><label for="visit_int">방문객수</label></th>
            <td>
              <div class="flex" style="width: 100%;display: flex;line-height: 30px;">
                총 <input type="text" name="visit_int" style="width:20%" class="form-control mgr10 mgl10" placeholder=""> 명
              </div>
            </td>
          </tr>
          <tr>
            <th rowspan="5"><label for="uni_name">소속</label></th>
            <td>
              <input style="width:50%" type="text" name="uni_name" maxlength="20" class="form-control inline-block mgr10" placeholder="대학교(원)">
              대학교(원)
            </td>
          </tr>
          <tr>
            <td>
              <input style="width:50%" type="text" name="uni_depart" maxlength="20" class="form-control inline-block mgr10" placeholder="학과">
              학과
            </td>
          </tr>
          <tr>
            <td>
              <input style="width:50%" type="text" name="grade" maxlength="20" class="form-control inline-block mgr10" placeholder="학년">
              학년
            </td>
          </tr>
          <tr>
            <td>
              과목명 :
              <input style="width:50%" type="text" name="uni_subject" maxlength="20" class="form-control inline-block mgl10" placeholder="과목명">
            </td>
          </tr>
          <tr>
            <td>
              지도교수 :
              <input style="width:50%" type="text" name="profName" maxlength="20" class="form-control inline-block mgl10" placeholder="지도교수">
            </td>
          </tr>
          <tr>
            <th><label for="visit_purpose">방문목적<br>(과제·발표등 구체적으로 명시)</label></th>
            <td>
              <textarea name="visit_purpose" class="form-control" rows="5" placeholder="방문목적(과제·발표등 구체적으로 명시)" style="width:98%"></textarea>
            </td>
          </tr>
          <tr>
            <th><label for="interview">인터뷰할 내용</label></th>
            <td>
              <textarea name="interview" class="form-control" rows="5" placeholder="인터뷰할 내용" style="width:98%"></textarea>
            </td>
          </tr>
          <tr>
            <th><label for="etc_coment">기타(요청사항, 자료요청)사항</label></th>
            <td>
              <textarea name="etc_coment" class="form-control" rows="5" placeholder="기타(요청사항, 자료요청)사항" style="width:98%"></textarea>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
	<input type="hidden" name="sinCode" value="<%=sinCode%>">
	<input type="hidden" name="spam_code" value="<%=createCSRPToken%>" />
    <div class="section2-cont3 center">
      <button class="btn btn-lg btn-success" onclick="send_it(document.form1)">신청하기</button>
    </div>
  </div>
</section>
</form>
<script language="javascript">
  $(document).ready(function(){
    var mb_width = $(window).width();
	 $('input[type=radio]').on('click',function(){
      $(this).parent().eq(0).parent().eq(0).children().removeClass('active');
      $(this).parent().eq(0).addClass('active');
    });
  });

function visit_chk(num){
	if (parseInt(num) == 1)	{
		$(".visit_one").show();
		$(".visit_many").hide();
	}
	else {
		$(".visit_one").hide();
		$(".visit_many").show();
	}

}


function send_it(form){

 if (form.info01.checked == false){
   alert("개인정보 수집에 동의 해야 합니다.");
   form.info01.focus();
   return false;}

 //이름
 if (!form.sName.value){
   alert("이름 입력해 주세요");
   form.sName.focus();
   return false;}
   //전화
 if (!form.phone1.value){
   alert("연락처를 입력해주세요");
   form.phone1.focus();
   return false;}
 //전화
 if (!form.phone2.value){
   alert("연락처를 입력해주세요");
   form.phone2.focus();
   return false;}
 //전화
 if (!form.phone3.value){
   alert("연락처를 입력해주세요");
   form.phone3.focus();
   return false;}
  form.submit();
 return ;
}

</script>