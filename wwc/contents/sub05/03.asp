<script language="javascript">
  $(document).ready(function(){
    var mb_width = $(window).width();
    $('input[type=radio]').on('click',function(){
      $(this).parent().eq(0).parent().eq(0).children().removeClass('active');
      $(this).parent().eq(0).addClass('active');
    });
    $('select[name=email2]').on('click',function(){
      if(mb_width <= 700){
        if($('select[name=email2]').val() == "직접입력"){
          $('input[name=email3]').show();
        }else{
          $('input[name=email3]').hide();
        }
      }
    });
  });
function send_it(form){
 if (form.info01.checked == false){
   alert("개인정보 수집에 동의 해야 합니다.");
   form.info01.focus();
   return false;}
 if (form.info02.checked == false){
   alert("민감정보 수집에 동의 해야 합니다.");
   form.info02.focus();
   return false;}
 if (form.info03.checked == false){
   alert("개인정보 제3자 제공에 동의 해야 합니다.");
   form.info03.focus();
   return false;}

 //이름
 if (!form.name.value){
   alert("이름 입력해 주세요");
   form.name.focus();
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

 //우편번호
 if (!form.Zipcode1.value){
   alert("우편번호를 입력해주세요");
   form.Zipcode1.focus();
   return false;}
 //우편번호
 if (!form.Zipcode2.value){
   alert("우편번호를 입력해주세요");
   form.Zipcode2.focus();
   return false;}
 //주소
 if (!form.addr1.value){
   alert("주소를 입력해주세요");
   form.addr1.focus();
   return false;}
 if (form.sp_method[3].checked == true)
 {
   if (!form.bank_name.value)
   {	alert("은행이름을 입력하세요");
     form.bank_name.focus();
     return false;
   }
   if (!form.bank_number.value)
   {	alert("이체계좌번호을 입력하세요");
     form.bank_number.focus();
     return false;
   }
   if (!form.bank_master.value)
   {	alert("예금주를 입력하세요");
     form.bank_master.focus();
     return false;
   }

 }
  form.submit();
 return ;
}
function cmschk(a){
 if (a == 1 )
 {cms.style.display = "";}
 else
 {cms.style.display = "none";}
}

function zipcode_chek()	{
 window.open("/includefiles/global/zipcode.asp?frm_name=form1&fld1=Zipcode1&fld2=Zipcode2","zipcode","scrollbars=1 ,top=100, left=315,width=318,height=351");
 }
</script>
<!-- <section class="section1 mgb60">
  <div class="innerWrap">
    <div class="section1-cont1 mg200">
      <div class="spn-application-title">
        <h3>개인정보 수집</h3>
      </div>
      <form method="post" name="form1" action="/includefiles/global/spt_sin_end.asp" onsubmit="return false">
  			<div class="spn-application">
          <div class="spn-application-stitle bold">기본 개인정보 수집·이용</div>
          <p>1. 개인정보의 수집 및 이용목적 : 월계종합사회복지관 사회복지 서비스 사업에 관련한 지원과 서비스 제공<br>
  					 2. 개인정보의 보유 및 이용기간 : 이용기간 : 해당 지원과 서비스가 제공되는 기간<br>
  					 3. 보유기간 : 해당 지원과 서비스가 제공되는 기간으로부터 3년 보관 수집 및 이용하는 기본 개인정보 항목 성명, 생년월일, 주소, 연락처, 후원금품사용결과관련 문자/이메일/우편 발송 동의 거부 권리 및 동의 거부에 따른 제한사항 귀하는 개인정보 제공 및 동의를 거부할 권리가 있으며, 위 항목 동의 거부 시 월계종합사회복지관 후원 참여가 어려워질 수 있습니다.</p>
          <div class="spn-application-chkbox">
            <input type="checkbox" name="info01" id="info01">
            <label for="info01">동의합니다.</label>
          </div>
        </div>
  			<div class="spn-application">
          <div class="spn-application-stitle bold">민감정보 수집</div>
          <p>1. 민감정보의 수집 및 이용목적 : 월계종합사회복지관 후원 사업에 관련한 지원과 서비스 제공<br>
  					 2. 민감정보의 보유 및 이용기간 : 이용기간 : 후원과 관련 서비스가 제공되는 기간<br>
  					 3. 보유기간 : 후원과 관련 서비스가 제공되는 기간으로부터 3년 보관 수집하는 기본 민감정보 항목 주민등록번호 및 후원관련 계좌번호, 개인정보 보호법 제23조에서 정한 사항 동의 거부 권리 및 동의 거부에 따른 제한사항 귀하는 개인정보 제공 및 동의를 거부할 권리가 있으며, 위 항목 동의 거부시 월계종합사회복지관 후원 참여가 어려워질 수 있습니다.</p>
          <div class="spn-application-chkbox">
            <input type="checkbox" name="info01" id="info01">
            <label for="info01">동의합니다.</label>
          </div>
        </div>
  			<div class="spn-application">
          <div class="spn-application-stitle bold">개인정보 제3자 제공</div>
          <p>1. 개인정보를 제공받는 자 : 후원과 관련해 정보제공이 필요하다고 월계종합사회복지관 사회복지 서비스 사업부서에서 판단하는 자 개인정보를 제공 받는 자의 개인정보 이용 목적 약정한 후원금품의 cms출금 의뢰 및 소득공제를 위한 관련기관 및 국세청 신고 제공되는 개인정보 항목 위 ①과 ②의 정보 개인정보를 제공 받는 자의 개인정보 보유 및 이용기간 <br>
      			 2. 이용기간 : 해당 지원과 서비스가 제공되는 기간 <br>
      			 3. 보유기간 : 해당 지원과 서비스가 제공되는 기간으로부터 3년 보관 동의 거부 권리 및 동의 거부에 따른 제한사항 귀하는 개인정보 제공 및 동의를 거부할 권리가 있으며, 위 항목 동의 거부 시 월계종합사회복지관 후원 참여가 어려워질 수 있습니다.</p>
          <div class="spn-application-chkbox">
            <input type="checkbox" name="info01" id="info01">
            <label for="info01">동의합니다.</label>
          </div>
        </div>
  		</form>
    </div>
  </div>
</section> -->

<section class="section2 mgb60">
  <div class="innerWrap">
    <div class="section2-cont1 spn-apptn-tb">
      <table class="table table-bordered" summary="기관내방 신청" id="table03">
        <tbody>
          <tr>
            <th rowspan="2"><label for="avd">기관방문일</label></th>
            <td>
              <p>1. 희망방문일과 시간</p>
              <div class="tb03-cont1" style="width: 100%;">
                <input type="date" name="avd1" maxlength="10" class="form-control" placeholder="1988-01-12">
                <input type="time" name="avd2" maxlength="10" class="form-control" placeholder="12:00">
                <p>* 공식적인 기관방문일은 매월 3째주 화요일 오후 2시~5시 중 1시간입니다.</p>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <p>2. 10인이상 단체방문시 희망방문일과 시간</p>
              <div class="tb03-cont1 mgb10">
                1안 :
                <input type="date" name="avd3" maxlength="10" class="form-control" placeholder="1988-01-12">
                <input type="time" name="avd4" maxlength="10" class="form-control" placeholder="12:00">
              </div>
              <div class="tb03-cont1">
                2안 :
                <input type="date" name="avd5" maxlength="10" class="form-control" placeholder="1988-01-12">
                <input type="time" name="avd6" maxlength="10" class="form-control" placeholder="12:00">
              </div>
            </td>
          </tr>
          <tr>
            <th style="width:25%"><label for="name">신청자 대표</label></th>
            <td>
              <input style="width:70%" type="text" name="name" maxlength="50" class="form-control" placeholder="신청자 대표">
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
            <th><label for="email1">이메일</label></th>
            <td>
              <div class="tb03-cont4">
                <input type="email" name="email1" class="form-control mgr10" placeholder="example" style="width:40%"> @
                <input type="text" name="email3" class="form-control mgl10" placeholder="example.com" style="width:45%;">
                <select class="form-control mgl10" name="email2" style="width:45%">
                  <option value="직접입력">직접입력</option>
                  <option value="naver.com" selected>naver.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="daum.net">daum.net</option>
                  <option value="nate.com">nate.com</option>
                </select>
              </div>
            </td>
          </tr>
          <tr>
            <th><label for="numvis">방문객수</label></th>
            <td>
              <div class="" style="width: 100%;display: flex;line-height: 30px;">
                총 <input type="text" name="numvis" style="width:20%" class="form-control mgr10 mgl10" placeholder=""> 명
              </div>
            </td>
          </tr>
          <tr>
            <th rowspan="5"><label for="affi">소속</label></th>
            <td>
              <input style="width:50%" type="text" name="affi1" maxlength="20" class="form-control inline-block mgr10" placeholder="대학교(원)">
              대학교(원)
            </td>
          </tr>
          <tr>
            <td>
              <input style="width:50%" type="text" name="affi2" maxlength="20" class="form-control inline-block mgr10" placeholder="학과">
              학과
            </td>
          </tr>
          <tr>
            <td>
              <input style="width:50%" type="text" name="affi3" maxlength="20" class="form-control inline-block mgr10" placeholder="학년">
              학년
            </td>
          </tr>
          <tr>
            <td>
              과목명 :
              <input style="width:50%" type="text" name="affi4" maxlength="20" class="form-control inline-block mgl10" placeholder="과목명">
            </td>
          </tr>
          <tr>
            <td>
              지도교수 :
              <input style="width:50%" type="text" name="affi5" maxlength="20" class="form-control inline-block mgl10" placeholder="지도교수">
            </td>
          </tr>
          <tr>
            <th><label for="tpov1">방문목적<br>(과제·발표등 구체적으로 명시)</label></th>
            <td>
              <textarea name="tpov1" class="form-control" rows="5" placeholder="방문목적(과제·발표등 구체적으로 명시)" style="width:98%"></textarea>
            </td>
          </tr>
          <tr>
            <th><label for="itv1">인터뷰할 내용</label></th>
            <td>
              <textarea name="itv1" class="form-control" rows="5" placeholder="인터뷰할 내용" style="width:98%"></textarea>
            </td>
          </tr>
          <tr>
            <th><label for="oth1">기타(요청사항, 자료요청)사항</label></th>
            <td>
              <textarea name="oth1" class="form-control" rows="5" placeholder="기타(요청사항, 자료요청)사항" style="width:98%"></textarea>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="section2-cont3 center">
      <button class="btn btn-lg btn-success" onclick="send_it(document.form1)">신청하기</button>
    </div>
  </div>
</section>

<script type="text/javascript">
  $(document).ready(function(){
    $('select[name=email2]').on('click',function(){
      if($('select[name=email2]').val() == "직접입력"){
        $('input[name=email3]').show();
      }else{
        $('input[name=email3]').hide();
      }
    });
  });
</script>
