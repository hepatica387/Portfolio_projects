<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<%
arng = "join"
If (MYID <> "" And MYLEVEL < 2) Then
'	call EndGoURL("직원이나 멘토/브라보실버 회원은 관리메뉴에서 정보를 수정하세요.")
End If
	strTitle        = "Registration"
	str_subTitle    = "회원가입을 하시면 다양한 혜택을 누리실 수 있습니다."

Sql = "select User_NM, UserPhone, UserEmail,  zipcode, Addr1, Addr2, Insti_name from tbl_members where Userid='"&MYID&"'"
arrFlds = SqlArray(sql, 1)
If Not IsNull(arrFlds) Then
	 name			= arrFlds(0,0)
	 hp				= Split(arrFlds(1,0),"-")
	 phone1			= hp(0)
	 phone2			= hp(1)
	 phone3			= hp(2)
	 email			= arrFlds(2,0)
	 If email <> "" Then
		 arr_email	= Split(email,"@")
		 email1		= arr_email(0)
		 Select Case email2
		 	Case "naver.com","gmail.com","hanmail.net","nate.com"
				email2		=  arr_email(1)
				email3		= ""
			Case Else
				email2		= ""
				email3		= arr_email(1)
		 End Select
	End If
	 zipcode		= arrFlds(3,0)
	 addr1			= arrFlds(4,0)
	 addr2			= arrFlds(5,0)
	 Insti_name		= arrFlds(6,0)
	 id		= MYID
	 arng = "edit"
	 input_readonly	= "readonly"
	 strTitle		= "회원정보 수정"
End IF
%>

<section id="sub_content" class="sub10">
	<div class="cont01">
		<div class="login-title black">
			<h2><%=strTitle%></h2>
		</div>
		<div class="depth01 mgt40 mgb30">
			<h3>개인정보보호정책</h3>
		</div>
		<div id="sub03-01" class="mgb30">
			<div style="width:100%;height:250px;overflow-x:hidden;overflow-y:scroll;border:1px solid #ddd" align="justify">
				<!--#include virtual="/includefiles/html/secret1.html"-->
			</div>
			<input type="checkbox" name="member_yak" id="member_yak"> <label for="member_yak" class="mgt10">개인정보 취급방침에 동의 합니다.</label>
		</div>
		<div class="depth01 mgt30 mgb5 porfl">
			<h3>회원정보입력</h3>
		</div>
		<div id="sub03-02" class="">
			<form name="form1" method="post" action="/includefiles/global/member_prog.asp" onsubmit="return send_it(this)">
				<TABLE class="table table-bordered sub100-tb" summary="회원가입 정보 입력창">
					<TBODY>
						<TR>
							<Th style="width:25%" class="t500 active"><label for="Insti_name">회사명</Th>
							<TD><INPUT type="text" maxLength="10" value="<%=Insti_name%>" name="Insti_name" class="form-control" placeholder="회사명" style="width:50%;" <%=input_readonly%> /></TD>
						</TR>
					  <TR>
							<Th style="width:25%" class="t500 active"><label for="name">담당자명</Th>
							<TD><INPUT type="text" maxLength="10" value="<%=name%>" name="name" class="form-control" placeholder="이름" style="width:50%;" /></TD>
						</TR>
						<TR>
						  <Th class="t500 active"><label for="id">아이디</label> </Th>
						  <TD >
								<div class="sub100-tb-online">
									<INPUT maxLength="12" name="id"  value="<%=ID%>" class="form-control" placeholder="아이디 (4~12자의 영문 숫자)" style="width:50%;" <%=input_readonly%>/>
									<%If MYID = "" then%>
									<a onClick="id_chek()" href="javascript:;" class="btn btn-default" style="margin-left: 10px;">중복확인</a>
									<%End if%>
								</div>
							</TD>
						</TR>

						<TR>
						  <th style="width:25%" class="t500 active"><label for="pwd">비밀번호</label></Th>
						  <TD><INPUT  type="password" maxLength="10" value="" name="pwd" class="form-control" placeholder="비밀번호" style="width:50%;" /></TD>
						</TR>
					<%If MYID = "" then%>
						<TR>
						  <th style="width:25%" class="t500 active"><label for="pwd1">비밀번호확인</label></Th>
						  <TD><INPUT  type="password" maxLength="10" value="" name="pwd1" class="form-control" placeholder="비밀번호 확인" style="width:50%;" /></TD>
						</TR>
					<%End if%>
						<TR height="25">
						  <th style="width:25%" class="t500 active"><label for="email">이메일  </Th>
						  <TD>
								<div class="flex">
									<input type="text" name="email1" class="form-control mgr10" placeholder="userid" style="width:30%" value="<%=email1%>"> @
									<input type="text" name="email3" class="form-control mgl10" placeholder="example.com" style="width:30%;<%If email3 = "" Then RW("display:none;")%>" value="<%=email3%>">
									<select class="form-control mgl10" name="email2" style="width:30%">
										<option value="직접입력">직접입력</option>
										<option value="naver.com" <%If email2 = "naver.com" Then RW("selected")%>>naver.com</option>
										<option value="gmail.com" <%If email2 = "gmail.com" Then RW("selected")%>>gmail.com</option>
										<option value="hanmail.net" <%If email2 = "hanmail.net" Then RW("selected")%>>hanmail.net</option>
										<option value="nate.com" <%If email2 = "nate.com" Then RW("selected")%>>nate.com</option>
									</select>
								</div>
						  </TD>
						</TR>
						<TR height="25">
						  <th style="width:25%" class="t500 active"><label for="hp1">연락처</label>  </Th>
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
						  <th class="t500 active"><label for="zip">우편번호</label></th>
						  <td>
							 <div class="flex">
								<div>
									<input type="number" name="zipcode" id="zipcode" readonly onclick="sample5_execDaumPostcode('addr1','zipcode')" style="width:200px" class="form-control center" placeholder="12200" value="<%=zipcode%>">
								</div>
								<div>
									<button onclick="sample5_execDaumPostcode('addr1','zipcode')" class="btn btn-info mgl10" type="button" name="button">주소검색</button>
								</div>
						  </td>
						</tr>
						<tr>
						  <th class="t500 active"><label for="addr1">주 소</label></thclass="t500">
						  <td>
							<input type="text" name="addr1" class="form-control" placeholder="주소" id="addr1" value="<%=addr1%>">
							<input type="text" name="addr2" class="form-control mgt10" placeholder="나머지 주소" value="<%=addr2%>">
						  </td>
						</tr>
						</TBODY>
				</TABLE>
				<input type="hidden" name="Userid" />
				<input type="hidden" name="arng" value="<%=arng%>" />
				<input type="hidden" name="spam_code" value="<%=createCSRPToken%>" />
				<div class="sucbtn mgb60 center">
					<INPUT type="submit" value="완 료" class="btn btn-lg btn-success"/>
				</div>
				<% If MYID = "" then%>
					<input type="hidden" name="idChk" value="">
				<%End if%>

			</form>
		</div>
	</div>
</div>


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

  function send_it(x){
<%if MYID = "" then%>
	if($("input[name=member_yak]:checked").length == 0) {
				alert("이용약관 및 개인정보 취급방침에 동의해야 합니다.");
				return false;
			}
	if (!x.Userid.value)
		{ alert("아이디중복확인을 해야 합니다..");
		x.id.focus();
		return false;
		}
<%end if%>
	//이름
	if (!x.Insti_name.value){
		alert("회사명은 필수 입력항목입니다.");
		x.Insti_name.focus();
		return false;}
	if (!x.name.value){
		alert("이름 입력해야 합니다.");
		x.name.focus();
		return false;}
	//아이디
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
<%if MYID = "" then%>
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
<%end if%>
	//전화
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
	//ifrm_form("cmt", "cmt");
	//x.target	= "cmt"

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
