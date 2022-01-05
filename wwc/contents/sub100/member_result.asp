<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
<style>
.cont_body	{position:relative;width:800px;height:369px;background:url('/images/sub06/loginBG.jpg') no-repeat 0 ;background-size:cover }
.log_table  {position:absolute; margin:160px 0  0 430px; padding:0 ;}
.mem_join   {position:absolute; margin:250px 0 0 440px}
</style>
 </head>
 <body>
  <div id="sub_content">
	<div class="sub-body-content left  ">
	<div class="cont_body m_border_input mgt50 mgl50 cols-80">
		<form action="/includefiles/global/login_end.asp" id="frm" name="frm" method="post" onsubmit="return false" target="" >
		<table class="log_table" summary="로그인 폼">
			<tr>
				<td><label for="LogID"><input type="text" name="LogID" id="LogID" maxlength=20  style="width:180px;ime-mode:inactive" class="form-control " placeholder="아이디" tabindex="1" title="아이디"/></label></td>
				<td rowspan="2"><div style="margin:-8px 0 0 5px;"><a href="javascript:;" onclick="sendIt()" tabindex="3" title="로그인" class="btn btn-warning hid80 bold middle" style="padding:25px">로그인</a></div></td>
			</tr>
			<tr>
				<td><label for="LogPW"><input type="password" name="LogPW" id="LogPW" maxlength=20 style="width:180px;ime-mode:inactive"  class="form-control "  tabindex="2" onkeydown="if(event.keyCode == 13) sendIt();" placeholder="비밀번호" title="비밀번호"/></label></td>
			</tr>
			</table>
		</form>
		<div class="col-100 center mem_join">
			<a href="javascript:;" onclick="pwFnd('PW')" class="btn btn-info btn-xs">비밀번호 찾기</a>
			<a href="javascript:;" onclick="pwFnd('ID')" class="btn btn-info btn-xs">아이디 찾기</a>
		</div>
		</div>
	</div>
 </div>
 </body>
</html>
<script type="text/javascript">
	function sendIt(){
	var x = document.frm;
	if (!$("#LogID").val()){
		alert("아이디를 입력하세요");
		$("#frm #name").focus();
		return false;
	}
	if (!$("#LogPW").val()){
		alert("비밀번호를 입력하세요");
		$("#frm #LogPW").focus();
		return false;
	}
	x.submit();
	return ;
}

function pwFnd(gubun){
	$(".cont_body").load("../../includefiles/global/idpw_find_result.asp?gubun="+gubun);
}


</script>