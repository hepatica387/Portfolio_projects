<!--#include virtual="/LIB/_headInclude.asp"-->
<!--#include virtual="/LIB/CharSet_utf.asp"-->
<%
' program_code : 101 : 발달지원센터, 102 : 전문상담, 103 : 유무료 교육, 104 : 이혼상담
' sinCode		: 201 : 온라인 신청, 202 : 대관신청 , 203 : 방문신청
program_code		= Request.queryString("program_code")
Select Case program_code
	Case "101"
		program_gubun	=	"발달지원센터"
		sugang_type		= True
	Case "102"
		program_gubun	=	"전문상담"
		sugang_type		= False
	Case "103"
		program_gubun	=	"유무료 교육"
		sugang_type		= True
	Case "104"
		program_gubun	=	"이혼상담"
		sugang_type		= False
	End Select
sinCode				= Request.queryString("sinCode")
%>
<form method="post" name="form1" action="/includefiles/global/online_sin_process.asp" onsubmit="return false">
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
      <table class="table table-bordered" summary="발달지원센터 신청">
        <tbody>
<% If sugang_type Then %>
		<tr>
            <th style="width:25%"><label for="apply_name">신청자 이름</label></th>
            <td>
              <input style="width:70%" type="text" name="apply_name" maxlength="50" class="form-control" placeholder="신청자 이름">
            </td>
          </tr>
          <tr>
            <th><label for="apply_hp1">신청자 연락처</label></th>
            <td>
              <ul class="all-unstyled">
                <li class="pull-left"><input type="text" name="apply_hp1" maxlength="3" style="width:50px" class="form-control" placeholder="010"></li>
                <li class="pull-left"><input type="text" name="apply_hp2" maxlength="4" style="width:80px" class="form-control mgl10" placeholder="1234"></li>
                <li class="pull-left"><input type="text" name="apply_hp3" maxlength="4" style="width:80px" class="form-control mgl10" placeholder="5678"></li>
              </ul>
            </td>
          </tr>
          <tr>
            <th style="width:25%"><label for="sName">수강자 이름</label></th>
            <td>
				<div class="flex ">
					<div class="cols-60">
			             <input style="width:70%" type="text" name="sName" maxlength="50" class="form-control" placeholder="수강자 이름">
					</div>
				</div>
            </td>
          </tr>
		   <tr>
            <th><label for="s_hp1">수강자 연락처</label></th>
            <td>
              <ul class="all-unstyled">
                <li class="pull-left"><input type="text" name="s_hp1" maxlength="3" style="width:50px" class="form-control" placeholder="010"></li>
                <li class="pull-left"><input type="text" name="s_hp2" maxlength="4" style="width:80px" class="form-control mgl10" placeholder="1234"></li>
                <li class="pull-left"><input type="text" name="s_hp3" maxlength="4" style="width:80px" class="form-control mgl10" placeholder="5678"></li>
              </ul>
            </td>
          </tr>
<%else%>
		<tr>
            <th style="width:25%"><label for="apply_name">이름</label></th>
            <td>
              <input style="width:70%" type="text" name="apply_name" maxlength="50" class="form-control" placeholder="신청자 이름">
            </td>
          </tr>
          <tr>
            <th><label for="apply_hp1">연락처</label></th>
            <td>
              <ul class="all-unstyled">
                <li class="pull-left"><input type="text" name="apply_hp1" maxlength="3" style="width:50px" class="form-control" placeholder="010"></li>
                <li class="pull-left"><input type="text" name="apply_hp2" maxlength="4" style="width:80px" class="form-control mgl10" placeholder="1234"></li>
                <li class="pull-left"><input type="text" name="apply_hp3" maxlength="4" style="width:80px" class="form-control mgl10" placeholder="5678"></li>
              </ul>
            </td>
          </tr>

<%End if%>
          <tr>
            <th><label for="sex">성별</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default active">
                  <input type="radio" name="sex" value="M" class="form-control" checked>남
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="sex" value="F" class="form-control">여
                </label>
              </div>
            </td>
          </tr>
          <tr>
            <th><label for="birth">생년월일</label></th>
            <td>
              <input type="date" style="width:200px" name="birth" maxlength="10" class="form-control" placeholder="1988-01-12" >
            </td>
          </tr>
          <tr>
            <th><label for="economy">경제상황</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default ">
                  <input type="radio" name="economy" value="수급" class="form-control">수급
                </label>
                <label class="btn btn-default active">
                  <input type="radio" name="economy" value="차상위" class="form-control" checked>차상위
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="economy" value="일반" class="form-control">일반
                </label>
              </div>
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
   <%' program_gubun : 101 : 발달지원센터, 102 : 전문상담, 103 : 유무료 교육, 104 : 이혼상담
	If program_code	= "102" then%>
		  <tr>
            <th><label for="couns">연령대</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default active">
                  <input type="radio" name="Relation" value="아동/청소년" checked class="form-control">아동/청소년
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="Relation" value="성인" class="form-control">성인
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="Relation" value="65세 이상 어르신" class="form-control">65세 이상 어르신
                </label>
              </div>
            </td>
          </tr>
		  <tr>
            <th><label for="couns">신청자와 관계</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default active">
                  <input type="radio" name="Relation" value="본인" checked class="form-control">본인
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="Relation" value="가족" class="form-control">가족
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="Relation" value="지인" class="form-control">지인
                </label>
				<label>
					 <input type="text" name="Relation" value="" class="form-control " placeholder="직접입력">
				</label>
              </div>
            </td>
          </tr>
          <tr>
            <th><label for="couns">상담 및 심리상담</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default active">
                  <input type="radio" name="programName" value="개인상담" checked class="form-control">개인상담
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="programName" value="부부상담" class="form-control">부부상담
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="programName" value="가족상담" class="form-control">가족상담
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="programName" value="심리검사" class="form-control">심리검사
                </label>
              </div>
            </td>
          </tr>
<%End if%>
<%If program_code	= "101" then%>
          <tr>
            <th><label for="wbgs">월계발달지원센터</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default ">
                  <input type="checkbox" name="programName" value="언어치료" class="form-control">언어치료
                </label>
                <label class="btn btn-default ">
                  <input type="checkbox" name="programName" value="인지치료" class="form-control">인지치료
                </label>
                <label class="btn btn-default active">
                  <input type="checkbox" name="programName" value="미술/놀이치료" checked class="form-control">미술, 놀이치료
                </label>
                <label class="btn btn-default ">
                  <input type="checkbox" name="programName" value="음악치료" class="form-control">음악치료
                </label>
                <label class="btn btn-default ">
                  <input type="checkbox" name="programName" value="감각통합치료" class="form-control">감각통합치료
                </label>
              </div>
            </td>
          </tr>
<%End if%>
<%If program_code	= "103" then%>
		  <tr>
            <th><label for="edacp">교육문화사업</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default active">
                  <input type="radio" name="programName" checked value="피아노교실" class="form-control">피아노교실
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="programName" value="제과제빵" class="form-control">제과제빵
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="programName" value="성인조리교실" class="form-control">성인조리교실
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="programName" value="아동조리교실" class="form-control">아동조리교실
                </label>
              </div>
            </td>
          </tr>
		  <tr>
            <th><label for="edacp">신청경로 </label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default active">
                  <input type="radio" name="sin_course" checked value="맘카페" class="form-control">맘카페
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="sin_course" value="홍보지" class="form-control">홍보지
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="sin_course" value="복지샘" class="form-control">복지샘
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="sin_course" value="현수막" class="form-control">현수막
                </label>
				 <label class="btn btn-default ">
                  <input type="radio" name="sin_course" value="지인추천" class="form-control">지인추천
                </label>
				<label>
					<input type="text" name="sin_course" value="" class="form-control" placeholder="직접입력">
				</label>
              </div>

            </td>
          </tr>
<%End if%>
<%If program_code	= "104" then%>
          <tr>
            <th><label for="couns">상담 및 심리상담</label></th>
            <td>
              <div class="btn-group pull-left spn-label" data-toggle="buttons">
                <label class="btn btn-default active">
                  <input type="radio" name="programName" value="이혼전 상담" checked class="form-control">이혼전 상담
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="programName" value="이혼과정상담" class="form-control">이혼과정상담
                </label>
                <label class="btn btn-default ">
                  <input type="radio" name="programName" value="이혼 후 상담" class="form-control">이혼 후 상담
                </label>
              </div>
            </td>
          </tr>
<%End if%>
        </tbody>
      </table>
    </div>
	<input type="hidden" name="program_gubun" value="<%=program_gubun%>">
	<input type="hidden" name="programCode" value="<%=program_code%>">
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

//이름
 if (!form.apply_name.value){
   alert("이름 입력해 주세요");
   form.apply_name.focus();
   return false;}
   //전화
 if (!form.apply_hp1.value || !form.apply_hp2.value || !form.apply_hp3.value){
   alert("신청자 연락처를 입력해주세요");
   form.apply_hp1.focus();
   return false;}
if (!form.sName.value){
   alert("이름 입력해 주세요");
   form.sName.focus();
   return false;}
  //주소
 if (!form.addr1.value){
   alert("주소를 입력해주세요");
   form.addr1.focus();
   return false;}

  form.submit();
 return ;
}

</script>
