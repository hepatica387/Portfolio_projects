<script language="javascript">
  $(document).ready(function(){
    $('input[type=radio]').on('click',function(){
      $(this).parent().eq(0).parent().eq(0).children().removeClass('active');
      $(this).parent().eq(0).addClass('active');
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
      <table class="table table-bordered" summary="발달지원센터 신청">
        <tbody>
          <tr>
            <th style="width:25%"><label for="name1">신청자 이름</label></th>
            <td>
              <input style="width:70%" type="text" name="name1" maxlength="50" class="form-control" placeholder="신청자 이름">
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
            <th style="width:25%"><label for="name2">수강자 이름</label></th>
            <td>
              <input style="width:70%" type="text" name="name2" maxlength="50" class="form-control" placeholder="수강자 이름">
            </td>
          </tr>
          <tr>
            <th><label for="ssn1">성별</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="male" value="남" class="form-control">남
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="female" value="여" class="form-control">여
                </label>
              </div>
            </td>
          </tr>
          <tr>
            <th><label for="birth">생년월일</label></th>
            <td>
              <input type="date" name="birth" maxlength="10" class="form-control" placeholder="1988-01-12" style="width:50%">
            </td>
          </tr>
          <tr>
            <th><label for="ecn">경제상황</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="ecn" value="수급" class="form-control">수급
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="ecn" value="차상위" class="form-control">차상위
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="ecn" value="일반" class="form-control">일반
                </label>
              </div>
            </td>
          </tr>
          <tr>
            <th><label for="zip">우편번호</label></th>
            <td>
              <ul class="all-unstyled addr2-ul">
                <li class="pull-left"><input type="text" name="Zipcode1" readonly="" onclick="zipcode_chek()" class="form-control wid50" placeholder="122"> </li>
                <li class="pull-left"><input type="text" name="Zipcode2" readonly="" onclick="zipcode_chek()" class="form-control mgl10 wid50" placeholder="010"></li>
                <li class="pull-leftpdl10"><button onclick="zipcode_chek()" class="btn btn-sma btn-info mgl10" type="button" name="button">주소검색</button></li>
              </ul>
            </td>
          </tr>
          <tr>
            <th><label for="addr1">주 소</label></th>
            <td>
              <input type="text" name="addr1" style="width:98%" class="form-control" placeholder="주소">
            </td>
          </tr>
          <tr>
            <th><label for="addr2">상세주소</label></th>
            <td>
              <input type="text" name="addr2" style="width:98%" class="form-control" placeholder="나머지 주소">
            </td>
          </tr>
          <tr>
            <th><label for="couns">상담 및 심리상담</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="couns1" value="개인심리상담" class="form-control">개인심리상담
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="couns2" value="부모상담, 가족상담" class="form-control">부모상담, 가족상담
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="couns3" value="이혼상담" class="form-control">이혼상담
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="couns4" value="그 외 상담" class="form-control">그 외 상담
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="couns5" value="심리상담" class="form-control">심리상담
                </label>
              </div>
            </td>
          </tr>
          <tr>
            <th><label for="wbgs">월계발달지원센터</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="wbgs1" value="언어치료" class="form-control">언어치료
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="wbgs2" value="인지치료" class="form-control">인지치료
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="wbgs3" value="미술, 놀이치료" class="form-control">미술, 놀이치료
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="wbgs4" value="음악치료" class="form-control">음악치료
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="wbgs5" value="감각통합치료" class="form-control">감각통합치료
                </label>
              </div>
            </td>
          </tr>
          <tr>
            <th><label for="edacp">교육문화사업</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="edacp1" value="피아노교실" class="form-control">피아노교실
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="edacp2" value="제과제빵" class="form-control">제과제빵
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="edacp3" value="성인조리교실" class="form-control">성인조리교실
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="edacp4" value="아동조리교실" class="form-control">아동조리교실
                </label>
                <label class="btn btn-default btn-sm">
                  <input type="radio" name="edacp5" value="감각통합치료" class="form-control">감각통합치료
                </label>
              </div>
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
