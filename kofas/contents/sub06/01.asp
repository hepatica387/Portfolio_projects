	<!-- Start Introduce Area -->
<!--#include file="../../LIB/_headInclude.asp"-->
<!--#include virtual="/includefiles/global/_array.asp"-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<%arng = "INS"
 Call daum_ZipAddr()
 Sql = "select id, name ,phone ,sch_gubun ,birthDay ,gubun ,state ,zipcode ,addr1 ,addr2, email, seq from group_member where id = '"&MYID&"' and gubun='브라보실버'"
arrFlds = SqlArray(Sql,1)
If Not isnull(arrFlds) Then
	id			= arrFlds(0,0)
	name		= arrFlds(1,0)
	phone		= arrFlds(2,0)
	If Len(phone) > 10 Then
		 hp = Split(phone,"-")
		 phone1 = hp(0)
		 phone2 = hp(1)
		 phone3 = hp(2)
	End If
	sch_gubun	= arrFlds(3,0)
	birthDay	= arrFlds(4,0)
	gubun		= arrFlds(5,0)
	state		= arrFlds(6,0)
	zipcode		= arrFlds(7,0)
	addr1		= arrFlds(8,0)
	addr2		= arrFlds(9,0)
	email		= arrFlds(10,0)
	If email <> "" Then
		 arr_email = Split(email,"@")
		 email1 = arr_email(0)
		 email2 = arr_email(1)
	End If
	seq			= arrFlds(11,0)
	arng		= "UPD"
	readonly	= "readonly"
End if
 %>
	<section class="section1">
		<div class="innerWrap">
			<div class="section1-cont1">
			 <form name="form1" method="post" action="/includefiles/global/youth_member_prog.asp" onsubmit="return send_it(this)">
				 <div class="border-line pdt20 pdb20 pdl20 pdr20">
					 <div class="bsjoin-stitle  pdb10 t500 ">개인정보 수집</div>
					 <p>1. 개인정보의 수집 및 이용목적 : 월계종합사회복지관 청소년 조직화 활동과 관련된 내용 <br/>
						2. 개인정보의 보유 및 이용기간 : 월계종합사회복지관 청소년 조직화 활동 및 홈페이지 이용기간<br/>
						3. 보유기간 : 해당활동과 서비스가 제공되는 기간으로부터 3년 보관 수집 및 이용하는 기본 개인정보 항목 성명, 아이디, 이메일, 재학구분, 연락처, 주소, 문자/이메일/우편 발송 동의 거부 권리 및 동의 거부에 따른 제한사항 귀하는 개인정보 제공 및 동의를 거부할 권리가 있으며, 위 항목 동의 거부 시 월계종합사회복지관 청소년 조직화 활동 참여가 어려워질 수 있습니다.
					 <div class="right">
						 <input type="checkbox" name="info01" id="info01">
						 <label for="info01">동의합니다.</label>
					 </div>
				 </div>
				 <TABLE class=" cols-100 table table-bordered mgt20" summary="브라보실버 회원가입 정보 입력창">
					  <TBODY>
						<TR>
							<th class="hidden-xs" style="width:25%"><label for="name">이름</TD>
							<TD><INPUT type="text" maxLength="10" value="<%=name%>" name="name" class="form-control" placeholder="이름" style="width:50%;" /></TD>
						</TR>
						<TR height="25">
							<th class="hidden-xs"><label for="birthDay">생년월일</label></th>
							<TD><input type="date" name="birthDay" maxlength="10" class="form-control" value="<%=birthDay%>" placeholder="1994-01-09" style="width:50%;">
							</TD>
						 </TR>
						<TR>
						  <Th class="hidden-xs"><label for="id">아이디</label> </Th>
						  <TD>
						  		<div class="flex">
									<div class="cols-30">
										<INPUT maxLength="12" name="id" value="<%=id%>" class="form-control" placeholder="아이디 (4~12자의 영문 숫자)" style="width:100%;" <%=readonly%> />
									</div>
									<%If arng = "INS" then%>
									<div>
										<a onClick="id_chek()" href="javascript:;" class="btn btn-default" style="margin-left: 10px;">중복확인</a>
									</div>
									<%End if%>

								</div>
							</TD>
						</TR>

						<TR>
						  <th class="hidden-xs" style="width:25%"><label for="pwd">비밀번호</label></Th>
						  <TD><INPUT type="password" maxLength="10" value="" name="pwd" class="form-control" placeholder="비밀번호" style="width:50%;" /></TD>
						</TR>
					<%if arng = "INS" then%>
						<TR>
						  <th class="hidden-xs" style="width:25%"><label for="pwd1">비밀번호확인</label></Th>
						  <TD><INPUT  type="password" maxLength="10" value="" name="pwd1" class="form-control" placeholder="비밀번호 확인" style="width:50%;" /></TD>
						</TR>
					<%End if%>
						<TR height="25">
						  <th class="hidden-xs" style="width:25%"><label for="email">이메일  </Th>
						  <TD>
								<div class="flex">
									<input type="text" name="email1" class="form-control mgr10" placeholder="userid" style="width:30%" value="<%=email1%>"> @
									<input type="text" name="email3" class="form-control mgl10" placeholder="example.com" style="width:30%;display:none;" value="<%=email2%>">
									<select class="form-control mgl10" name="email2" style="width:30%">
										<option value="직접입력">직접입력</option>
										<option value="naver.com" <%If email2 = "naver.com" Then RW("selected")%>>naver.com</option>
										<option value="gmail.com" <%If email2 = "gmail.com" Then RW("selected")%>>gmail.com</option>
										<option value="daum.net" <%If email2 = "daum.net" Then RW("selected")%>>daum.net</option>
										<option value="nate.com" <%If email2 = "nate.com" Then RW("selected")%>>nate.com</option>
									</select>
								</div>
						  </TD>
						</TR>
						<TR height="25">
							<th class="hidden-xs" style="width:25%"><label for="sch_gubun">재학구분</label></th>
							<TD><div class="btn-group" data-toggle="buttons">
									<label class="btn btn-default <%If sch_gubun = "초" Then RW("active")%> ">
										<input type="radio" name="sch_gubun" value="초" <%If sch_gubun = "초" Then RW("checked")%>> 초등학생
									 </label>
									 <label class="btn btn-default <%If sch_gubun = "중" Then RW("active")%>">
										<input type="radio" name="sch_gubun" value="중" <%If sch_gubun = "중" Then RW("checked")%>> 중학생
									 </label>
									 <label class="btn btn-default  <%If sch_gubun = "고" Then RW("active")%> ">
										<input type="radio" name="sch_gubun" value="고" <%If sch_gubun = "고" Then RW("checked")%>> 고등학생
									 </label>
									  <label class="btn btn-default  <%If sch_gubun = "대" Or sch_gubun = "" Then RW("active")%> ">
										<input type="radio" name="sch_gubun" value="대" <%If sch_gubun = "대" Or sch_gubun = "" Then RW("checked")%>> 대학생
									 </label>
								 </div>
							</TD>
						 </TR>
						<TR height="25">
						  <th class="hidden-xs" style="width:25%"><label for="hp1">연락처</label>  </Th>
						  <TD>
								<div class="flex">
									<SELECT name="hp1" class="form-control" style="width:75px;">
										<OPTION value="" <%If phone1 = "" Then RW("selected")%> >선택</OPTION>
										<OPTION value="010" <%If phone1 = "010" Then RW("selected")%> >010</OPTION>
										<OPTION value="011" <%If phone1 = "011" Then RW("selected")%> >011</OPTION>
										<OPTION value="016" <%If phone1 = "016" Then RW("selected")%> >016</OPTION>
										<OPTION value="017" <%If phone1 = "017" Then RW("selected")%> >017</OPTION>
										<OPTION value="018" <%If phone1 = "018" Then RW("selected")%> >018</OPTION>
										<OPTION value="019" <%If phone1 = "019" Then RW("selected")%> >019</OPTION>
										<OPTION value="070" <%If phone1 = "070" Then RW("selected")%> >070</OPTION>
										<OPTION value="02" <%If phone1 = "02" Then RW("selected")%> >02</OPTION>
										<OPTION value="031" <%If phone1 = "031" Then RW("selected")%> >031</OPTION>
										<OPTION value="032" <%If phone1 = "032" Then RW("selected")%> >032</OPTION>
										<OPTION value="033" <%If phone1 = "033" Then RW("selected")%> >033</OPTION>
										<OPTION value="041" <%If phone1 = "041" Then RW("selected")%> >041</OPTION>
										<OPTION value="042" <%If phone1 = "042" Then RW("selected")%> >042</OPTION>
										<OPTION value="043" <%If phone1 = "043" Then RW("selected")%> >043</OPTION>
										<OPTION value="051" <%If phone1 = "051" Then RW("selected")%> >051</OPTION>
										<OPTION value="052" <%If phone1 = "052" Then RW("selected")%> >052</OPTION>
										<OPTION value="053" <%If phone1 = "053" Then RW("selected")%> >053</OPTION>
										<OPTION value="054" <%If phone1 = "054" Then RW("selected")%> >054</OPTION>
										<OPTION value="055" <%If phone1 = "055" Then RW("selected")%> >055</OPTION>
										<OPTION value="061" <%If phone1 = "061" Then RW("selected")%> >061</OPTION>
										<OPTION value="062" <%If phone1 = "062" Then RW("selected")%> >062</OPTION>
										<OPTION value="063" <%If phone1 = "063" Then RW("selected")%> >063</OPTION>
										<OPTION value="064" <%If phone1 = "064" Then RW("selected")%> >064</OPTION>
									</SELECT>
									<INPUT maxLength="4" name="hp2"  value="<%=phone2%>"class="form-control mgl10" style="width:80px;" placeholder="1234"/>
									<INPUT maxLength="4" name="hp3"  value="<%=phone3%>" class="form-control mgl10" style="width:80px;" placeholder="5678"/>
								</div>
						   </TD>
						</TR>
						<tr>
						  <th class="hidden-xs"><label for="zip">우편번호</label></th>
						  <td>
							 <div class="flex">
								<div>
									<input type="number" name="zipcode" id="zipcode" readonly onclick="sample5_execDaumPostcode('addr1','zipcode')" style="width:200px" class="form-control center" placeholder="우편번호" value="<%=zipcode%>">
								</div>
								<div>
									<button onclick="sample5_execDaumPostcode('addr1','zipcode')" class="btn btn-info mgl10" type="button" name="button">주소검색</button>
								</div>
						  </td>
						</tr>
						<tr>
						  <th class="hidden-xs"><label for="addr1">주 소</label></thclass="hidden-xs">
						  <td>
							<input type="text" name="addr1" style="width:98%" class="form-control" placeholder="주소" id="addr1" value="<%=addr1%>">
							<input type="text" name="addr2" style="width:98%" class="form-control mgt10" placeholder="나머지 주소" value="<%=addr2%>">
						  </td>
						</tr>
					  </TBODY>
					</TABLE>
					<input type="hidden" name="Userid" />
					<input type="hidden" name="arng" value="<%=arng%>" />
					<input type="hidden" name="seq" value="<%=seq%>"/>
					<input type="hidden" name="memGubun" value="브라보실버" />
					<input type="hidden" name="spam_code" value="<%=createCSRPToken%>" />
					<div class="sucbtn mgb60 center">
						<INPUT type="submit" value="완 료" class="btn btn-lg btn-success"/>
					</div>
				</form>
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
			$('input[type=radio]').on('click',function(){
	      $(this).parent().eq(0).parent().eq(0).children().removeClass('active');
	      $(this).parent().eq(0).addClass('active');
	    });
	  });

function send_it(x){
<%if arng = "INS" then%>
	if (x.info01.checked == false){
		alert("개인정보 수집에 동의 해야 합니다.");
		x.info01.focus();
		return false;}
	if (!x.Userid.value)
		{ alert("아이디중복확인을 해야 합니다..");
		x.id.focus();
		return false;
	}
<%end if%>

	//이름
	if (!x.name.value){
		alert("이름 입력해야 합니다.");
		x.name.focus();
		return false;}
	//아이디
	if (!x.birthDay.value)	{
		alert("생년월일을 입력하세요");
		x.birthDay.focus();
		return false;}

	if (!x.id.value){
		alert("아이디를 입력해야 합니다.");
		return false;}
	else {
		if (x.id.value.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/) != -1) {
		alert("아이디는 한글을 사용할수 없습니다.\n\n영문으로 입력해야 합니다.");
		x.id.value = "";
		x.id.focus();
		return false;}
	}
<%if arng = "INS" then%>
	if (x.id.value.length < 4){
		alert("아이디는 4글자 이상 입력해야 합니다.");
		return false;}

	if (!x.pwd.value){
		alert("비밀번호를 입력해야  합니다.");
		x.pwd.focus();
		return false;}
	//비번 확인
	if (!x.pwd1.value){
		alert("비밀번호를 입력해야  합니다.");
		x.pwd1.focus();
		return false;}
	//비번비교

	if (x.pwd.value!=x.pwd1.value){
		alert("비밀번호가 일치하지 않습니다");
		x.pwd1.focus();
		return false;}
	//전화
<%end if%>
	if (!x.hp1.value){
		alert("연락처 앞번호를 선택하세요");
		x.hp1.focus();
		return false;}
	//전화
	if (!x.hp2.value){
		alert("연락처를 입력해야 합니다.");
		x.hp2.focus();
		return false;}
	//전화
	if (!x.hp3.value){
		alert("연락처를 입력해야 합니다.");
		x.hp3.focus();
		return false;}
	//우편번호
	if (!x.zipcode.value){
		alert("우편번호를 입력해야 합니다.");
		x.zipcode.focus();
		return false;}
	return;

}

function id_chek(){
	var x = document.form1
	if (!x.id.value){
		alert("아이디를 입력해주세요");
		x.id.focus();
		return false;}
	else {
		if (x.id.value.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/) != -1) {
		alert("아이디는 한글을 사용할수 없습니다.\n\n영문으로 입력하세요");
		x.id.value = "";
		x.id.focus();
		return false;}
	}
	if (x.id.value.length < 4){
		alert("아이디는 4글자 이상 입력해야 합니다.");
		x.id.focus();
		return false;}

	ifrm_form("cmt", "cmt");
	cmt.location.href="/includefiles/global/mem_id_chek.asp?id="+x.id.value
}
	</script>
