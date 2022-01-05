<% gubun		= Request.QueryString("gubun")
 select case gubun
	case "ID"
		sjbt 		= "아이디 찾기"
		sub_title	= "이름과 이메일을 입력하여 아이디 찾기가 가능합니다."
		sjbt2 		= "아이디 "
		sub_title2	= "아이디 찾기를 하면 아래에 회원 아이디가 표시됩니다."
		sub_sjbt2 	= "비밀번호"
		sub_gubun	= "PW"
	case "PW"
		sjbt = "비밀번호 찾기"
		sub_title	= "아이디와 이메일을 입력하여 비밀번호를 찾습니다."
		sjbt2 		= "비밀번호 "
		sub_title2	= "비밀번호 암호화로 임시비밀번호가 발급됩니다."
		sub_sjbt2 	= "아이디"
		sub_gubun	= "ID"
end select %>

<div class="Login mgl0 " >
	<div class="cols-100 left">
			<span style="border-top:1px solid #30611e;" class="pdt3 t500 center title10 t-gray"><%=sjbt%></span>
		</div>
    <div class="login-l left mgt10" >
        <div><%=sub_title%></div>
        <form name="idFind" action="/includefiles/global/idPW_Find_end.asp" method="post" onsubmit="return SENDIT()" class="form-inline" target="haedal" >
			<div class="cols-100">
                <%if gubun = "ID" then %>
					<div class="mgt10 cols-70 f-left ">
						<label for="userNM" class="hidden">이름</label>
						<input type="text" name="userNM" id="userNM" maxlength=20  style="width:100%;ime-mode:inactive;height:50px" class="form-control hid50" placeholder="이름" tabindex="1" title="이름"  />
						<label for="to_mail"  class="hidden">이메일</label><input type="text" name="to_mail" id="to_mail" maxlength="100" style="width:100%;ime-mode:inactive;height:50px"  class="form-control hid50 mgt5"  tabindex="2"  placeholder="이메일" title="이메일" />
					</div>

					<div class="f-left login-cont1-btn" style="margin:10px 0 0 5px;width:100px" >
						<input type="submit" value="찾 기" class="btn btn-warning bold title1" style="height:105px;width:100%;padding:37px 0"/>
					</div>
				<%else%>
					<div class="mgt10 cols-70 f-left ">
						<label for="userID" class="hidden">아이디</label><input type="text" name="userID" id="userID" maxlength=20  style="width:100%;ime-mode:inactive;height:50px" class="form-control hid50" placeholder="아이디" tabindex="1" title="아이디"  /></label>

						<label for="to_mail"  class="hidden">이메일</label><input type="text" name="to_mail" id="to_mail" maxlength="100" style="width:100%;ime-mode:inactive;height:50px"  class="form-control hid50 mgt5"  tabindex="2"  placeholder="이메일" title="이메일" />
					</div>

					<div class="f-left login-cont1-btn" style="margin:10px 0 0 5px;width:100px" >
						<input type="submit" value="찾 기" class="btn btn-warning bold title3" style="height:105px;width:100%;padding:37px 0" tabindex="3"/>
					</div>

				<%End if%>
            </div>
			<input type="hidden" name="gubun" value="<%=gubun%>" />
        </form>
    </div>
    <div class="login-r left">
      <a href="/sub100/01" onclick="" title="로그인">
        <div class="cont2-1 mgt30" id="ctID">
          <div class=""><i class="fa fa-search" aria-hidden="true"></i></div>
          <div class="">로그인</div>
        </div>
      </a>
      <a href="javascript:;" onclick="$('.login-cont1').load('/contents/sub100/01_idpw_find_result.asp?gubun=<%=sub_gubun%>')" title="<%=sub_sjbt2%>를 잃어버리셨나요?">
        <div class="cont2-1 mgt30 mgl20" id="ctPW">
          <div class=""><i class="fa fa-unlock-alt" aria-hidden="true"></i></div>
          <div class=""><%=sub_sjbt2%> 찾기</div>
        </div>
      </a>
    </div>
	</div>
 </div>
 <iframe src="/includefiles/html/blank.asp" name="haedal" id="haedal" title="회원정보 찾기용 프레임" ></iframe>
<script type="text/javascript">
// pre-submit callback
function SENDIT(x) {
	var x = document.idFind;
	<%if gubun = "PW" then%>
	if (!x.userID.value){
		alert("아이디를 입력해야 합니다.");
		x.userID.focus();
		return false;}
	<%else%>
	if (!x.userNM.value){
		alert("이름을 입력해야 합니다.");
		x.userNM.focus();
		return false;}
	<%end if%>
	if (!x.to_mail.value)
	 {  alert("이메일을 입력해야합니다.");
		x.to_mail.focus()
		return false;
	}
	var leftwidth	= parseInt(($(window).width() - 500) / 2);
	$("#haedal").show().height(285).width(500).css({position:"absolute","left":0,"top":"-50px"}).addClass("shadow");
	return ;
}

</script>
