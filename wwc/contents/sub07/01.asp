	<!-- Start Introduce Area -->
<!--#include file="../../LIB/_headInclude.asp"-->
<%arng = "write"%>
<section class="section1">
	<div class="innerWrap">
		<div class="section1-stitle">
			<h3>청소년 조직화</h3>
		</div>
		<div class="section1-cont1">
		 <form name="form1" method="post" action="/includefiles/global/youth_member_prog.asp" onsubmit="return send_it(this)">
			 <div class="bsjoin">
				 <div class="bsjoin-stitle bold">개인정보 수집</div>
				 <p>1. 개인정보의 수집 및 이용목적 : 월계종합사회복지관 청소년 조직화 활동과 관련된 내용 <br/>
					2. 개인정보의 보유 및 이용기간 : 월계종합사회복지관 청소년 조직화 활동 및 홈페이지 이용기간<br/>
					3. 보유기간 : 해당활동과 서비스가 제공되는 기간으로부터 3년 보관 수집 및 이용하는 기본 개인정보 항목 성명, 아이디, 이메일, 재학구분, 연락처, 주소, 문자/이메일/우편 발송 동의 거부 권리 및 동의 거부에 따른 제한사항 귀하는 개인정보 제공 및 동의를 거부할 권리가 있으며, 위 항목 동의 거부 시 월계종합사회복지관 청소년 조직화 활동 참여가 어려워질 수 있습니다.
				 <div class="bsjoin-chkbox">
					 <input type="checkbox" name="info01" id="info01">
					 <label for="info01">동의합니다.</label>
				 </div>
			 </div>
			 <TABLE class="table table-bordered sub7-tb" summary="청소년 조직화 회원가입 정보 입력창">
					<TBODY>
					<TR>
						<th style="width:25%"><label for="name">이름</TD>
						<TD><INPUT type="text" maxLength="10" value="" name="name" class="form-control" placeholder="이름" style="width:50%;" /></TD>
					</TR>
					<TR height="25">
						<th><label for="birthDay">생년월일</label></th>
						<TD><input type="date" name="birthDay" maxlength="10" class="form-control" value="<%=birthDay%>" placeholder="1994-01-09" style="width:50%;">
						</TD>
					 </TR>
					<TR>
						<Th><label for="id">아이디</label> </Th>
						<TD>
							<div class="sub7-tb-online">
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
							<div class="sub7-tb-online">
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
						<th style="width:25%"><label for="sch_gubun">재학구분</label></th>
						<TD><div class="btn-group pull-left" data-toggle="buttons">
								<label class="btn btn-default">
									<input type="radio" name="sch_gubun" value="초" <%If sch_gubun = "초" Then RW("checked")%>> 초등학생
								 </label>
								 <label class="btn btn-default">
									<input type="radio" name="sch_gubun" value="중" <%If sch_gubun = "중" Then RW("checked")%>> 중학생
								 </label>
								 <label class="btn btn-default">
									<input type="radio" name="sch_gubun" value="고" <%If sch_gubun = "고"  Then RW("checked")%>> 고등학생
								 </label>
							 </div>
						</TD>
					 </TR>
					<TR height="25">
						<th style="width:25%"><label for="hp1">연락처</label>  </Th>
						<TD>
							<div class="sub7-tb-online">
								<SELECT name="hp1" class="form-control" style="width:75px;">
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
							<div class="sub7-tb-online">
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
</script>
