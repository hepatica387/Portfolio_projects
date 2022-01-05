<% gubun		= Request.QueryString("gubun")%>

	  <form name="idFind" action="/includefiles/global/idPW_Find_end.asp" method="post" onsubmit="return false" class="form-inline" role="form">
		<table class="log_table" summary="로그인 폼">
		<%if gubun = "PW" then%>
			<tr>
				<td><div class="controls">
					<label for="userID" class=" bold  hidden-xs wid80 pdt5">아 이 디</label>
					<input type="text" name="userID" class="form-control cols-50 cols-40 col-md-40 col-sm-40 col-mi-70" tabindex="10" maxlength="15"  placeholder="아이디" id="userID" /><div id="idstr"></div>
				</div></td>
				<td rowspan="2"><div style="margin:0 0 0 5px;"><a href="javascript:;" onclick="SENDIT(document.idFind)" tabindex="3" title="로그인" class="btn btn-warning hid80 bold middle" style="padding:25px">확인</a></div></td>
			</tr>
			<%else%>
			<tr>
				<td><div class="controls">
					<label for="userNM" class=" bold  hidden-xs wid80 pdt5">이 름</label>
					<input type="text" name="userNM" tabindex="11" class="form-control cols-40 col-md-40 col-sm-40 col-mi-70" maxlength="50" placeholder="이름" id="userNM"/><div id="idstr"></div>
				</div></td>
				<td rowspan="2"><div style="margin:0 0 0 5px;"><a href="javascript:;" onclick="SENDIT(document.idFind)" tabindex="3" title="로그인" class="btn btn-warning hid80 bold middle" style="padding:25px">확인</a></div></td>
			</tr>
			<%end if%>
			<tr>
				<td><div class="controls">
					<label for="to_mail" class=" bold  hidden-xs wid80 pdt5">이 메 일</label>
					<input type="email" name="to_mail" tabindex="11" class="form-control cols-40 col-md-40 col-sm-40 col-mi-70" maxlength="50" placeholder="이메일" id="to_mail"/><div id="emailstr"></div>
				</div></td>
			</tr>
		</table>
		<input type="hidden" name="gubun" value="<%=gubun%>" />
	  </form>


<script type="text/javascript">
// pre-submit callback
function SENDIT(x) {
	var x = document.idFind;
	<%if gubun = "PW" then%>
	if (!x.userID.value){$("#idstr").text("* 아이디를 입력해야 합니다.").css("color","#b71e00");
		x.userID.focus();
		return false;}
	<%else%>
	if (!x.userNM.value){$("#idstr").text("* 이름을 입력해야 합니다.").css("color","#b71e00");
		x.userNM.focus();
		return false;}
	<%end if%>
	if (!x.to_mail.value)
	 {  $("#emailstr").text("* 이메일을 입력해야합니다.").css("color","#b71e00");
		x.to_mail.focus()
		return false;
	}
	var leftwidth	= parseInt(($(window).width() - 500) / 2);
	$("#hiddenZone").show().height(300).width(500).css({"left":leftwidth+"px","top":"200px"}).addClass("shadow");
	x.target	= "hiddenZone";
	x.submit();
	return ;
}

</script>