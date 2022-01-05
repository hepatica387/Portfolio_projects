<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include file='../../includefiles/global/_array.asp'-->
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
<!doctype html>
<html lang="ko">
 <head>
  <meta charset="UTF-8">
  <title>회원가입 폼</title>
 </head>
 <body>
<div class="pdb50">
	<div class="sub-body-content left  ">
		<div class="cols-100 left">
			<span style="border-top:1px solid #ff8000;" class="pdt3 t500 center title10 t-gray">회원가입</span>
		</div>
		<%If arng = "write" then%>
		<div class="depth01 mgt30" ><h4><span class="depth_line">개인</span>정보보호정책</h4></div>
		<div id="sub03-01" class="pdl10">
			<div style="margin:0 0 5px 0 ;padding:10px 10px 20px 10px;width:98%x;height:250px;overflow-x:hidden;overflow-y:scroll;border:1px solid #eeeeee" align="justify">
				<!--#include virtual="/includefiles/html/secret.html"-->
			</div>
			<input type="checkbox" name="member_yak" id="member_yak"> <label for="member_yak">개인정보 취급방침에 동의 합니다.</label>
		</div>
		<div class="t-info m_border_input center pdt20 pdb20">누군가의 댓글이 상처가 될 때 REMIND가 함께 하겠습니다. 악성 댓글 확인 시 24시간 내에 삭제하겠습니다.</div>
	   <%End if%>
      <form Name="FRM" id="FRM" method="post" action="../../includefiles/global/member_prog.asp" class="mgt10 form-inline" enctype="multipart/form-data" onsubmit="return FRM_SEND()">
		<table class="table border-bottom sub06_table"  summary="회원가입 입력표">
			<caption>회원가입 및 회원 정보수정에 필요한 항목을 입력하는 표입니다.</caption>
			<tr>
				<th scope="row" class="active cols-20 center "><label for="UserID">아이디</label></th>
				<td class="cols-80"><input type="text" name="UserID" value="<%=UserID%>" class="form-control input_NM" id="UserID" <%=inputRead%>  pattern="[A-Za-z0-9]{4,20}" placeholder="아이디[영숫자 조합 4~20]"/>
				<% If arng = "write" then%>
				<a href="javascript:;" onclick="IDFIND_('ID')" class="btn btn-info">중복검사</a>			
				<%End if%>
				</td>	
			</tr>
			<tr>
				<th scope="row" class="active cols-20 center "><label for="User_NM">이 름</label></th>
				<td class="cols-80"><input type="text" name="User_NM" value="<%=User_NM%>" class="form-control input_NM"  id="User_NM"  placeholder="이름"/>
				</td>
			</tr>
			<tr>
			<th class="active cols-20 center "><label for="NickName">닉네임</label></th>
			<td class="cols-80"><input type="text" name="NickName" value="<%=NickName%>" class="form-control" id="NickName"  placeholder="닉네임을 입력하세요"/>			
			<% If arng = "write" then%>
			<a href="javascript:;" onclick="IDFIND_('NICK')" class="btn btn-info">중복검사</a>
			<%End if%>
			</td>
		</tr>
			<tr>
				<th scope="row" class="active cols-20 center "><label for="User_PW">비밀번호</label></th>
				<td class="cols-80"><input type="password" name="User_PW"  class="form-control input_NM" id="User_PW"  placeholder="비밀번호"/>
				</td>
			</tr>
		<%If arng = "write" then%>
			<tr>
				<th scope="row" class="active cols-20 center "><label for="User_PW1">비밀번호 확인</label></th>
				<td class="cols-80"><input type="password" name="User_PW1"  class="form-control input_NM" id="User_PW1"  placeholder="비밀번호 확인"/>
				</td>
			</tr>
		<%End if%>
			<tr>			
				<th scope="row" class="active cols-20 center "><label for="UserEmail">이메일</label></th>
				<td class="cols-80"><input type="email" name="UserEmail" style="width:70%"  value="<%=UserEmail%>" class="form-control input_email" id="UserEmail"  placeholder="이메일"/>
				<% If arng = "write" then%>
				<a href="javascript:;" onclick="IDFIND_('email')" class="btn btn-info">중복검사</a>			
				<%End if%>
				</td>
			</tr>
			<tr>
				<th scope="row" class="center active"><label for="mem_type">회원구분</label></th>
				<td class="word-keep">
					<div class="col-lg-2 col-sm-6 col-xs-12"><input type="radio"  name="mem_type" id="mem_type1" value="10" <%if UserLevel < "11" Or state = "" then RW("checked")%>/> <label for="mem_type1" class="mgr15" >스탭</label></div>	
					<div class="col-lg-2 col-sm-6 col-xs-12"><input type="radio"  name="mem_type" id="mem_type2" value="11" <%if UserLevel = "11" then RW("checked")%>/> <label for="mem_type2" class="mgr15">회원</label></div>	
				</td>
			</tr>
			<tr>
				<th scope="row" class="active cols-20 center"><label for="Userinfo">자기소개</label></th>
				<td class="cols-80">
					<textarea id="Userinfo" name="Userinfo" style="width:98%;height:80px" class="form-control " ><%=Userinfo%></textarea>
					
				</td>
			</tr>
			<tr>
				<th scope="row" rowspan="2" class="active cols-20 center"><label for="profileImg">프로필이미지</label></th>
				<td class="cols-80">
					<div  class="cols-100 mgt5">							
						<input type="file" name="profileImg" id="profileImg"  style="width:80%" <%=required%>  /> 
						<%if MYID <> "" and profileImg <> "" then %>
						<div class="cols-100 ">								
							파일명 : <%=profileImg%> &nbsp;
							<input type="checkbox" name="delChk" value="Y" id="delChk"/> <label for="delChk">파일삭제</label>								
						</div>
						<%end if%>
					</div>			
				</td>
			</tr>
			<tr>
				
				<td class="cols-80">
					<div  class="cols-100 mgt5">프로필이미지는 2메가 이하인 이미지파일만 업로드가 가능합니다.</div>			
				</td>
			</tr>
			<tr>
				<th scope="row" class="center active"><label for="mailing">메일받기</label></th>
				<td class="word-keep">
					<div class="col-lg-2 col-sm-6 col-xs-12"><input type="radio"  name="mailing" id="mailing1" value="1" <%if state Or state = "" then RW("checked")%>/> <label for="mailing2" class="mgr15" >받기</label></div>	
					<div class="col-lg-2 col-sm-6 col-xs-12"><input type="radio"  name="mailing" id="mailing2" value="0" <%if Not state then RW("checked")%>/> <label for="mailing2" class="mgr15">거부</label></div>	
				</td>
			</tr>
	</table>
	<% If MYID = "" then%>
	<input type="hidden" name="idChk" value="">
	<input type="hidden" name="nickChk" value="">
	<input type="hidden" name="emailChk" value="">
	<%End if%>
	<input type="hidden" name="seq" value="<%=seq%>">
	<input type="hidden" name="arng" value="<%=arng%>">
	<input type="hidden" name="page" value="<%=page%>">
	<input type="hidden" name="search" value="<%=search%>">
	<input type="hidden" name="searchstr" value="<%=searchstr%>">

<div class="cols-md-12 center">
	<input type="submit" class="btn btn-info btn-lg" value="등 록" />
	<a class="btn btn-default btn-lg" onclick="history.go(-1)">취 소</a>
</div>
</form>
<script type="text/javascript">
function FRM_SEND(){
	 var x = document.FRM;	
<% If MYID = "" Then%>
	if($("input[name=member_yak]:checked").length == 0) {
			alert("개인정보 취급방침에 동의해야 합니다.");
			return false;
		}	
	if (!x.UserID.value){
		alert("아이디를 입력하세요");
		x.UserID.focus();
		return false;
	}
	if (!x.User_NM.value){
		alert("이름을 입력 해야합니다.");
		x.User_NM.focus();
		return false;
	}
	if (!x.idChk.value){
		alert("아이디 중복체크를 해야합니다.");
		x.idChk.focus();
		return false;
	}
	if (!x.nickChk.value){
		alert("닉네임 중복체크를 해야합니다.");
		x.nickChk.focus();
		return false;
	}
	if (!x.User_PW.value){
		alert("비밀번호 입력 해야합니다.");
		x.User_PW.focus();
		return false;}
<%If MYID = "" Then%>
	if (!x.User_PW1.value){
		alert("비밀번호확인을 입력 해야합니다.");
		x.User_PW1.focus();
		return false;
	}
	if (x.User_PW.value != x.User_PW1.value){
		alert("비밀번호가 맞지 않습니다.");
		x.User_PW.focus();
		return false;
	}
<% end if
end if%>	
	if (!x.emailChk.value){
		alert("이메일 중복체크를 해야합니다.");
		x.emailChk.focus();
		return false;
	}
	 if ($("input[name='mem_type']:checked").val() == 6){
			if (!x.Userinfo.value){
				alert("스탭으로 가입할 경우 자기소개를 반드시 입력해야 합니다.");
				x.Userinfo.focus();
				return false;
			}
		}	
	return ;
}

function popup_(v1){
	$("#hiddenZone").show();
	hiddenZone.location.href= "/includefiles/global/"+v1+".asp";
	}

function IDFIND_(v1) {
	if (v1 == "ID")	{
		var UserID 	= document.FRM.UserID.value;
		if (!UserID){
			alert("아이디를 입력하세요" );
			document.FRM.UserID.focus();
			return false;
		}
		if (checkId(UserID) == false ){
			document.FRM.UserID.focus();
			return false;
		}
	} else if (v1 == "email") {
		var email 	= document.FRM.UserEmail.value;
		if (!email){
			alert("이메일을 입력하세요" );
			document.FRM.UserEmail.focus();
			return false;}	
		if (checkEmail(email) == false) {alert("이메일이 형식에 맞지 않습니다.");document.FRM.UserEmail.focus();return false;}
	} else {
		var UserID = document.FRM.NickName.value;
		if (!UserID){
			alert("닉네임을 입력하세요" );
			document.FRM.NickName.focus();
			return false;
		}
		if (str_chk(UserID) == false ){
			alert("특수문자는 입력불가능 합니다." );
			document.FRM.NickName.focus();
			return false;
		}
	}
  hiddenZone.location.href="../../includefiles/global/idFind_end.asp?arng="+v1+"&UserID="+UserID+"&email="+encodeURIComponent(email);
//  window.open("../../includefiles/global/idFind_end.asp?arng="+v1+"&UserID="+UserID+"&email="+encodeURIComponent(email));
   return false;
}
</script>


	</div>
 </div>
 </body>
</html>