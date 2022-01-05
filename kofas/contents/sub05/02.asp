<!--#include virtual="/LIB/_headInclude.asp"-->
<!--#include virtual="/LIB/CharSet_utf.asp"-->
<%
' sinCode		: 201 : 온라인 신청, 202 : 대관신청 , 203 : 방문신청
sinCode				= Request.queryString("sinCode")
%>
<form method="post" name="form1" action="/includefiles/global/place_sin_process.asp" onsubmit="return false">
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
      <table class="table table-bordered" summary="시설대관 신청">
        <tbody>
          <tr>
            <th style="width:25%"><label for="name">신청자 성명</label></th>
            <td>
              <input style="width:250px" type="text" name="name" maxlength="50" class="form-control" placeholder="신청자 성명">
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
            <th><label for="addr1">주 소</label></th>
            <td>
				<div class="flex">
				  <div class="cols-60"><input type="text" name="addr1" class="form-control" readonly placeholder="주소" id="addr1" onclick="sample5_execDaumPostcode('addr1')" ></div>
				  <div><button onclick="sample5_execDaumPostcode('addr1')" class="btn a btn-info mgl10" type="button" name="button">주소검색</button></div>
			   </div>
			   <div class="flex mgt10 ">
					<div class="cols-60">
						<input type="text" name="addr2" class="form-control" placeholder="나머지 주소">
					</div>
				</div>
            </td>
          </tr>
          <tr>
            <th><label for="place">대관 시설·기자재명</label></th>
            <td>
              <input type="text" name="place" style="width:98%" class="form-control" placeholder="대관 시설·기자재명">
            </td>
          </tr>
          <tr>
            <th><label for="udtim">사용일시 및 시간</label></th>
            <td>
				<div class="flex">
					 <div>
					  <input type="date" name="place_date" maxlength="10" class="form-control" placeholder="1988-01-12" style="display: inline-block;">
					 </div>
					 <div class="mgl10">
					  <input type="time" name="place_time" maxlength="10" class="form-control" placeholder="12:00" style="display: inline-block;">
					 <div>
				</div>
            </td>
          </tr>
          <tr>
            <th><label for="place_info">사용목적</label></th>
            <td>
              <textarea name="place_info" class="form-control" rows="10" placeholder="사용목적" style="width:98%"></textarea>
            </td>
          </tr>
          <tr>
            <th><label for="plc_price">이용료</label></th>
            <td>
				<div class="flex">
					<div>
		              <input type="number" name="plc_price" class="form-control" placeholder="이용료">
					</div>
				 </div>
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
function send_it(form){
 /*
 if (form.info01.checked == false){
   alert("개인정보 수집에 동의 해야 합니다.");
   form.info01.focus();
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
 //주소
 if (!form.addr1.value){
   alert("주소를 입력해주세요");
   form.addr1.focus();
   return false;}
   */
  form.submit();
 return ;
}
</script>