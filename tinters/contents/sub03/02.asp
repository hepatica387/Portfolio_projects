<!--#include virtual="/LIB/_headInclude.asp"-->
<!--#include virtual="/includefiles/global/foot.asp"-->
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
 if (!form.Name.value){
   alert("이름 입력해 주세요");
   form.Name.focus();
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
 if (!form.zipcode.value){
   alert("우편번호를 입력해주세요");
   form.zipcode.focus();
   return false;}
 //우편번호

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
</script>
<% Call daum_ZipAddr() %>
<form method="post" name="form1" action="/includefiles/global/spt_sin_end.asp" onsubmit="return false" class="forn-inline">
<section class="section1 mgb60">
  <div class="innerWrap">
    <div class="section1-cont1 mg200">
      <div class="spn-application-title">
        <h3>개인정보 수집</h3>
      </div>

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
            <input type="checkbox" name="info02" id="info02">
            <label for="info02">동의합니다.</label>
          </div>
        </div>
  			<div class="spn-application">
          <div class="spn-application-stitle bold">개인정보 제3자 제공</div>
          <p>1. 개인정보를 제공받는 자 : 후원과 관련해 정보제공이 필요하다고 월계종합사회복지관 사회복지 서비스 사업부서에서 판단하는 자 개인정보를 제공 받는 자의 개인정보 이용 목적 약정한 후원금품의 cms출금 의뢰 및 소득공제를 위한 관련기관 및 국세청 신고 제공되는 개인정보 항목 위 ①과 ②의 정보 개인정보를 제공 받는 자의 개인정보 보유 및 이용기간 <br>
      			 2. 이용기간 : 해당 지원과 서비스가 제공되는 기간 <br>
      			 3. 보유기간 : 해당 지원과 서비스가 제공되는 기간으로부터 3년 보관 동의 거부 권리 및 동의 거부에 따른 제한사항 귀하는 개인정보 제공 및 동의를 거부할 권리가 있으며, 위 항목 동의 거부 시 월계종합사회복지관 후원 참여가 어려워질 수 있습니다.</p>
          <div class="spn-application-chkbox">
            <input type="checkbox" name="info03" id="info03">
            <label for="info03">동의합니다.</label>
          </div>
        </div>
    </div>
  </div>
</section>

<section class="section2 mgb60">
  <div class="innerWrap">
    <div class="section2-cont1 spn-apptn-tb">
      <table class="table table-bordered" summary="후원신청">
        <tbody>
        <tr>
          <th style="width:25%"><label for="name">성명(단체)</label></th>
          <td>
            <input style="width:70%" type="text" name="Name" maxlength="50" class="form-control" placeholder="이름/단체명">
          </td>
        </tr>
        <tr>
          <th><label for="ssn1">생년월일</label></th>
          <td>
            <input type="date" name="ssn1" maxlength="10" class="form-control" placeholder="1988-01-12" style="width:50%">
          </td>
        </tr>
        <tr>
          <th><label for="phone1">연락처</label></th>
          <td>
            <div class="flex">
              <div class="cols-20"><input type="number" name="phone1" maxlength="3"  class="form-control center" placeholder="010"></div>
              <div class="mgl10 cols-20"><input type="number" name="phone2" maxlength="4"  class="form-control center" placeholder="1234"></div>
              <div class="mgl10 cols-20"><input type="number" name="phone3" maxlength="4"  class="form-control center" placeholder="5678"></div>
            </div>
          </td>
        </tr>
        <tr>
          <th><label for="zip">우편번호</label></th>
          <td>
		     <div class="flex">
			 	<div>
					<input type="number" name="zipcode" id="zipcode" readonly onclick="sample5_execDaumPostcode('addr1','zipcode')" style="width:200px" class="form-control center" placeholder="12200">
				</div>
				<div>
		            <button onclick="sample5_execDaumPostcode('addr1','zipcode')" class="btn btn-info mgl10" type="button" name="button">주소검색</button>
				</div>
          </td>
        </tr>
        <tr>
          <th><label for="addr1">주 소</label></th>
          <td>
            <input type="text" name="addr1" style="width:98%" class="form-control" placeholder="주소" id="addr1">
			<input type="text" name="addr2" style="width:98%" class="form-control mgt10" placeholder="나머지 주소">
          </td>
        </tr>
        <tr>
          <th><label for="kind">후원종류</label></th>
          <td>
            <div class="btn-group pull-left " data-toggle="buttons">
              <label class="btn btn-default  active">
                <input type="radio" name="kind" value="기금후원" checked="" class="form-control"> 기금후원
              </label>
              <label class="btn btn-default ">
                <input type="radio" name="kind" value="결연후원" class="form-control"> 결연후원
              </label>
              <label class="btn btn-default ">
                <input type="radio" name="kind" value="물품후원" class="form-control"> 물품후원
              </label>
            </div>
          </td>
        </tr>
        <tr>
          <th><label for="sp_money">후원금액</label></th>
          <td>
            <input type="number" name="sp_money" style="width:250px" class="form-control " placeholder="20000" maxlength="8">
          </td>
        </tr>
          <tr>
            <th><label for="sp_method">납입방법</label></th>
            <td class="left">
              <div class="btn-group col-xs-12" data-toggle="buttons">
                <label class="btn btn-default " onclick="cmschk(0)">
                  <input type="radio" name="sp_method" value="지로" class="form-control"> 지로
                </label>
                <label class="btn btn-default " onclick="cmschk(0)">
                  <input type="radio" name="sp_method" value="은행송금" class="form-control"> 은행송금
                </label>
                <label class="btn btn-default  active" onclick="cmschk(0)">
                  <input type="radio" name="sp_method" value="직접방문" checked="" class="form-control"> 직접방문
                </label>
                <label class="btn btn-default " onclick="cmschk(1)">
                  <input type="radio" name="sp_method" value="CMS" class="form-control"> CMS(자동이체)
                </label>
              </div>
              <div id="cms" style="display:none;">
                <div class="flex cols-100">
                  <div class="pdr25 pdt5">은행명</div>
                  <div class=""><input type="text" name="bank_name" value="" class="form-control " placeholder="은행명"></div>
                </div>
               <div class="flex cols-100 mgt5">
                  <div class="pdr10 pdt5">계좌번호</div>
                  <div class=""><input type="text" name="bank_number" value="" class="form-control " placeholder="계좌번호"></div>
                </ul>
                <div class="flex cols-100  mgt5">
                  <div class=" pdr25 pdt5">예금주</div>
                  <div class=""><input type="text" name="bank_master" value="" class="form-control " placeholder="예금주"></div>
                </ul>
                <div class="flex cols-100  mgt5">
                  <div class="pdr25 pdt5">이체일</div>
                  <div class="">
                    <select name="transfer" class="form-control cols-30 col-rg-30 col-md-30 col-sm-30 col-mi-30">
                      <option value="15">15일</option>
                      <option value="25">25일</option>
                      <option value="27">27일</option>
                    </select>
                  </div>
                </ul>
              </div>
            </td>
          </tr>
		   <tr>
			  <th><label for="">추천인</label></th>
			  <td>
				<input type="text" name="chu_Name" id="chu_Name" style="width:40%" class="form-control" placeholder="추천한 사람" >
			  </td>
			</tr>
        </tbody>
      </table>
    </div>
    <div class="section2-cont2 mgb30">
      <ul class="all-unstyled">
        <li style="background:url(/images/icon/bullet_black.png) no-repeat; background-position:0 3px" class="pdl20">기부하신 금액은 개인의 경우 소득세법 제 34조 2항 7호, 법인의 경우 조세특례제한법 제 73조 1항 9호에 의해 100% 세금혜택을 받으실 수 있습니다.</li>
        <li style="background:url(/images/icon/bullet_black.png) no-repeat; background-position:0 3px" class="pdl20">본인(본 단체)는 월계종합사회복지관의 후원회원이 되고자 위와 같이 신청합니다.</li>
			</ul>
    </div>
    <div class="section2-cont3 center">
      <button class="btn btn-lg btn-success" onclick="send_it(document.form1)">후원신청</button>
    </div>
	<input type="hidden" name="spam_code" value="<%=createCSRPToken%>" />
  </div>
</section>
</form>