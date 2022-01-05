  <div align="Center">
	  <form name="LOGFRM" action="/includefiles/global/login_end.asp" method="post" onsubmit="return false" class="form-inline" role="form">
			<div class=" mgb5 " align="center">				
				<div class="controls">
					<label for="LOGID" class=" bold  hidden-xs wid80 pdt5">아 이 디</label>
					<input type="text" name="LOGID" class="form-control cols-50 cols-40 col-md-40 col-sm-40 col-mi-70" tabindex="10" maxlength="15"  placeholder="아이디" />
				</div>
			</div>		
			<div class="mgb5" align="center">				
				<div class="controls">
					<label for="logpw" class=" bold  hidden-xs wid80 pdt5">비밀번호</label>
					<input type="password" name="logpw" tabindex="11" class="form-control cols-40 col-md-40 col-sm-40 col-mi-70" maxlength="16" placeholder="비밀번호" onkeydown="if(event.keyCode == 13) sendIt()"/>
				</div>
			</div>			
	  </form>								  
							
</div>

<script language="javascript">
function sendIt(){
	var x = document.LOGFRM;
	if (!x.LOGID.value)
	{	alert("아이디를 입력하세요");
		x.LOGID.focus();
		return false;
	}
	if (!x.logpw.value)
	{	alert("비밀번호를 입력하세요");
		x.logpw.focus();
		return false;
	}	
	ifrm_form("wrt", "wrt");
	x.target	= "wrt";
	x.submit(); 
return false;
}

function pwd_find() {
	$("#sign-up #myModalLabel").html("비밀번호 찾기");
	$("#sign-up .modal-body").html('');
	$("#sign-up .modal-body").load("/includefiles/global/idpw_find_result.asp");

}

setTimeout(function(){
	$("input[name=LOGID]").focus();	
	}	
	,1000);
</script>