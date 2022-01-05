<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<%If MYID <> "" Then
	If myLevel = "1" Then
		Call EndGoURL("최고관리자는 인트라넷에서 수정이 가능합니다.")
	End if
	whereSql		= " where UserID=?"
	Flds = "seq, UserID, User_NM, nickName, UserPW, UserEmail, UserPhone, Insti_ID, MacAddr, regDate, state, intranet, mailing, profileImg, UserLevel, zipcode, Addr1, homepage, memGubun, Addr2, Userinfo"
	strSql = "select "&Flds&" from tbl_members " & whereSql
	arrParams = Array( _
		DB.makeParam("@UserID", adVarWChar, adParamInput, 20, MYID) _
	)
	Set Rs = DB.execRs(strSql, DB_CMDTYPE_TEXT, arrParams,  1)
	If Not Rs.eof And Not RS.bof Then
		seq						= Rs(0)
		UserID					= Rs(1)
		User_NM					= Rs(2)
		nickName				= Rs(3)
		UserPW					= Rs(4)
		UserEmail				= Rs(5)
		UserPhone				= Rs(6)
		If Len(UserPhone) > 5 Then
			phone = Split(UserPhone,"-")
			If ubound(phone) = 1 Then
				user_ph1		= "02"
				user_ph2		= phone(0)
				user_ph3		= phone(1)
			ElseIf ubound(phone) = 1 Then
				user_ph1		= phone(0)
				user_ph2		= phone(1)
				user_ph3		= phone(2)
			ElseIf ubound(phone) = 0 Then
				If Len(UserPhone) = 11 Then
					user_ph1		= Left(UserPhone,3)
					user_ph2		= Mid(UserPhone,4,7)
					user_ph3		= right(UserPhone,4)
				else
					user_ph1		= Left(UserPhone,3)
					user_ph2		= Mid(UserPhone,4,6)
					user_ph3		= right(UserPhone,4)
				End if
			Else
				user_ph1		= phone(0)
				user_ph2		= phone(1)
				user_ph3		= phone(2)
			End if
		End if
		Insti_ID				= Rs(7)
		MacAddr					= Rs(8)
		regDate					= Rs(9)
		state					= Rs(10)
		intranet				= Rs(11)
		mailing					= Rs(12)
		profileImg				= Rs(13)
		UserLevel				= Rs(14)
		zipcode					= Rs(15)
		Addr1					= Rs(16)
		homepage				= Rs(17)
		memGubun				= Rs(18)
		Addr2					= Rs(19)
		Userinfo				= Rs(20)

		inputRead =  "readonly"
	Else
		Call EndGoURL("데이터가 존재하지 않습니다.")
	End If
	call closeRs(RS)
    arng        = "edit"
Else
	UserLevel	= "11"
	intranet	= False
	mem_gubun	= "HOME"
    arng        = "write"
	state		= true
End If%>
<%
gubun       = Request.queryString("gubun")
mode       = Request.queryString("mode")
if mode = "" then mode  = "login"
if MYID <> "" then mode = "join"
if mode = "" or mode = "login" then
    strTitle        = "Login"
    str_subTitle    = "로그인 안내 페이지입니다."
elseif mode = "join" then
    strTitle        = "Registration"
    str_subTitle    = "회원가입을 하시면 다양한 혜택을 누리실 수 있습니다."
elseif mode = "idpw_find_result" then
    strTitle        = gubun  & " Find"
   str_subTitle    = " 찾을 이름(아이디)과 이메일로 검색합니다."
end if%>

<div id="sub_content" class="sub10">
	<div class="cont01">
		<div class="depth01 mgt30" ><h4><span class="depth_line">개인</span>정보보호정책</h4></div>
		<div id="sub03-01" class="">
			<div style="margin:0 0 5px 0 ;padding:10px 10px 20px 10px;width:98%x;height:250px;overflow-x:hidden;overflow-y:scroll;border:1px solid #eeeeee" align="justify">
				<!--#include virtual="/includefiles/html/secret.html"-->
			</div>
			<input type="checkbox" name="member_yak" id="member_yak"> <label for="member_yak">개인정보 취급방침에 동의 합니다.</label>
		</div>
		<div class="depth01 mgt30" ><h4><span class="depth_line">회원</span>정보입력</h4></div>
		<div id="sub03-02" class="">
			<form name="form1" method="post" action="/includefiles/global/member_prog.asp" onsubmit="return send_it(this)">
				<TABLE class="table table-bordered sub100-tb" summary="회원가입 정보 입력창">
					<TBODY>
					  <TR>
							<Th style="width:25%"><label for="name">이름</Th>
							<TD><INPUT type="text" maxLength="10" value="" name="name" class="form-control" placeholder="이름" style="width:50%;" /></TD>
						</TR>
						<TR>
						  <Th><label for="id">아이디</label> </Th>
						  <TD>
								<div class="sub100-tb-online">
									<INPUT maxLength="12" name="id"  class="form-control" placeholder="아이디 (4~12자의 영문 숫자)" style="width:50%;" />
									<a onClick="id_chek()" href="javascript:;" class="btn btn-default" style="margin-left: 10px;">중복확인</a>
								</div>
							</TD>
						</TR>

						<TR>
						  <th style="width:25%"><label for="pwd">비밀번호</label></Th>
						  <TD><INPUT  type="password" maxLength="10" value="" name="pwd" class="form-control" placeholder="비밀번호" style="width:50%;" /></TD>
						</TR>
						<TR>
						  <th style="width:25%"><label for="pwd1">비밀번호확인</label></Th>
						  <TD><INPUT  type="password" maxLength="10" value="" name="pwd1" class="form-control" placeholder="비밀번호 확인" style="width:50%;" /></TD>
						</TR>
						<TR height="25">
						  <th style="width:25%"><label for="email">이메일  </Th>
						  <TD>
								<div class="sub100-tb-online">
	                <input type="email" name="email1" class="form-control mgr10" placeholder="userid" style="width:30%"> @
	                <input type="text" name="email3" class="form-control mgl10" placeholder="example.com" style="width:30%;display:none;">
	                <select class="form-control mgl10" name="email2" style="width:30%">
	                  <option value="직접입력">직접입력</option>
	                  <option value="naver.com" selected>naver.com</option>
	                  <option value="gmail.com">gmail.com</option>
	                  <option value="daum.net">daum.net</option>
	                  <option value="nate.com">nate.com</option>
	                </select>
	              </div>
						  </TD>
						</TR>
						<TR height="25">
						  <th style="width:25%"><label for="hp1">연락처</label>  </Th>
						  <TD>
								<div class="sub100-tb-online">
									<SELECT name="hp1" class="form-control" style="width:80px;">
										<OPTION value="" selected>선택</OPTION>
										<OPTION value="010">010</OPTION>
										<OPTION value="011">011</OPTION>
										<OPTION value="016">016</OPTION>
										<OPTION value="017">017</OPTION>
										<OPTION value="018">018</OPTION>
										<OPTION value="019">019</OPTION>
										<OPTION value="070">070</OPTION>
										<OPTION value="02">02</OPTION>
										<OPTION value="031">031</OPTION>
										<OPTION value="032">032</OPTION>
										<OPTION value="033">033</OPTION>
										<OPTION value="041">041</OPTION>
										<OPTION value="042">042</OPTION>
										<OPTION value="043">043</OPTION>
										<OPTION value="051">051</OPTION>
										<OPTION value="052">052</OPTION>
										<OPTION value="053">053</OPTION>
										<OPTION value="054">054</OPTION>
										<OPTION value="055">055</OPTION>
										<OPTION value="061">061</OPTION>
										<OPTION value="062">062</OPTION>
										<OPTION value="063">063</OPTION>
										<OPTION value="064">064</OPTION>
									</SELECT>
									<INPUT maxLength="4" name="hp2"  class="form-control mgl10" style="width:80px;" placeholder="1234"/>
									<INPUT maxLength="4" name="hp3"  class="form-control mgl10" style="width:80px;" placeholder="5678"/>
								</div>
						   </TD>
						</TR>
						<TR>
						  <th style="width:25%"><label for="Zipcode1">우편번호</label>  </Th>
						  <TD>
								<div class="sub100-tb-online">
									<INPUT  onClick="zipcode_chek()" readOnly  name="Zipcode1" class="form-control"  style="width:80px;" placeholder="000"/>
									<INPUT onClick="zipcode_chek()" readOnly  name="Zipcode2" class="form-control mgl10"  style="width:80px;" placeholder="122"/>
									<A href="javascript:zipcode_chek()" class="btn btn-default mgl10">주소검색</A>
								</div>
							</TD>
						</TR>
						<TR>
						  <th style="width:25%"><label for="addr1">주소</label></th>
						  <TD><INPUT class="form-control"  readOnly name="addr1" style="width:90%;" placeholder="주소" /></TD>
						</TR>
						<TR>
						  <th style="width:25%"><label for="addr2">상세주소</label></th>
						  <TD><INPUT class="form-control"  name="addr2" style="width:90%;" placeholder="나머지 주소" /></TD>
						</TR>
					</TBODY>
				</TABLE>
				<input type="hidden" name="Userid" />
				<input type="hidden" name="arng" value="join" />
				<div class="sucbtn mgb60 center">
					<INPUT type="submit" value="완 료" class="btn btn-lg btn-success"/>
				</div>
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
</script>
