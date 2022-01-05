<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include file='../../includefiles/global/_array.asp'-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<%If MYID <> "" Then
	whereSql		= " where UserID=?"
	Flds = "seq, UserID, User_NM, nickName, UserPW, UserEmail, UserPhone, Insti_ID, MacAddr, regDate, state, intranet, mailing, profileImg, UserLevel, zipcode, Addr1, homepage, memGubun, Addr2"	
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
		Select Case mem_gubun
			Case "1"
				mem_str	= "관리자"
			Case "2"
				mem_str	= "컨설턴트"
			Case "3"
				mem_str	= "광고주"
		End select			
		inputRead =  "readonly"
	Else
		Call EndGoURL("데이터가 존재하지 않습니다.")
	End If
	call closeRs(RS)
    arng        = "edit"
Else
	UserLevel	= "11"
	intranet	= False	
	mem_gubun	= 3
    arng        = "write"
End If%>
<!doctype html>
<html lang="ko">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
 </head>
 <body>
<div id="sub_content">
	<div class="sub-body-content left  ">
      <form Name="FRM" id="FRM" method="post" action="../../includefiles/global/member_prog.asp" class="mgt10 form-inline" enctype="multipart/form-data">
	<table class="table border-bottom "  summary="<%=Board_title%> 목록">
		<tr>
			<th class="bg-mute cols-20 center hidden-xs"><label for="UserID">담당 컨설턴트</label></th>
			<td class="cols-80">
				<select name="my_manager" class="form-control">
					<option value="">::담당컨설턴트::</option>
					<option value="">없습니다</option>
				<% StrSQl	= "select UserID, User_NM from tbl_members where mem_gubun = '2' and state=1 order by User_NM "
					arrRs	= SqlArray(strSql, 1)
					If Not isnull(arrRs) Then 
						For i = 0 To ubound(arrRs, 2)
							managerID		= arrRs(0,i)
							manager_NM		= arrRs(1,i)
							If managerID = my_manager Then Str_select = "selected" Else Str_select = ""
							RW("<option value="&managerID&" "&Str_select&">"&manager_NM&"</option>")
						Next
					End if%>
				</select>
			
			</td>
		</tr>
		<tr>
			<th class="bg-mute cols-20 center hidden-xs"><label for="UserID">아이디</label></th>
			<td class="cols-80"><input type="text" name="UserID" value="<%=UserID%>" class="form-control" id="UserID" <%=inputRead%> required pattern="[A-Za-z0-9]{4,10}" placeholder="아이디[영숫자 조합 4~20]"/>
			<% If arng = "write" then%>
			<a href="javascript:;" onclick="IDFIND_('ID')" class="btn btn-info">중복검사</a>			
			<%End if%>
			</td>	
		</tr>
		<tr>
			<th class="bg-mute cols-20 center hidden-xs"><label for="User_NM">이 름</label></th>
			<td class="cols-80"><input type="text" name="User_NM" value="<%=User_NM%>" class="form-control" id="User_NM" required placeholder="이름"/>
			</td>
		</tr>
		<tr>
			<th class="bg-mute cols-20 center hidden-xs"><label for="User_PW">비밀번호</label></th>
			<td class="cols-80"><input type="password" name="User_PW"  class="form-control" id="User_PW" required placeholder="비밀번호"/>
			</td>
		</tr>
	<%If arng = "write" then%>
		<tr>
			<th class="bg-mute cols-20 center hidden-xs"><label for="User_PW">비밀번호 확인</label></th>
			<td class="cols-80"><input type="password" name="User_PW1"  class="form-control" id="User_PW1" required placeholder="비밀번호 확인"/>
			</td>
		</tr>
	<%End if%>
		<tr>
			<th class="bg-mute cols-20 center hidden-xs"><label for="Insti_Name">회사명</label></th>
			<td class="cols-80"><input type="text" name="Insti_Name"  class="form-control" id="Insti_Name" required placeholder="회사명" value="<%=insti_Nm%>"/>
			</td>
		</tr>
		<tr>
			<th class="bg-mute cols-20 center hidden-xs"><label for="depart_name">부서명</label></th>
			<td class="cols-80"><input type="text" name="depart_name"  class="form-control" id="depart_name" required placeholder="부서명" value="<%=depart_name%>"/>
			</td>
		</tr>
	<%If arng = "edit" then%>
		<tr>
			<th class="bg-mute cols-20 center hidden-xs"><label for="mem_gubun">직책</label></th>
			<td class="cols-80"><input type="text" name="mem_gubun"  class="form-control" id="mem_gubun" required placeholder="직책" value="<%=mem_str%>" /></td>
		</tr>
	<%End if%>
		<tr>			
			<th class="bg-mute cols-20 center hidden-xs"><label for="UserEmail">이메일</label></th>
			<td class="cols-80"><input type="email" name="UserEmail" value="<%=UserEmail%>" style="width:50%" class="form-control" id="UserEmail" required placeholder="이메일"/>
			</td>
		</tr>
		<tr>
			<th class="bg-mute cols-20 center hidden-xs"><label for="user_ph1">전화번호</label></th>
			<td class="cols-80">
				<select name="user_ph1" class="form-control">
				<% PHARR = Split(TEL_ARR, ",")
				For i = 0 To ubound(PHARR)
				    If PHARR(i) = user_ph1 Then ph_select = "selected" Else ph_select = ""
					RW("<option value="&PHARR(i)&" "&ph_select&">"&PHARR(i)&"</option>")
				Next%>
				</select> -
				<input type="number" name="user_ph2" style="width:90px" value="<%=user_ph2%>" class="form-control" id="user_ph2" placeholder="1234" /> -
				<input type="number" name="user_ph3" style="width:90px" value="<%=user_ph3%>" class="form-control" id="user_ph3" placeholder="5678"/>
			</td>
		</tr>
		<tr>
			<th class="bg-mute cols-20 center hidden-xs"><label for="user_hp1">핸드폰</label></th>
			<td class="cols-80">
				<select name="user_hp1" class="form-control">
				<% PHARR = Split(HP_ARR, ",")
				For i = 0 To ubound(PHARR)
				    If PHARR(i) = user_hp1 Then ph_select = "selected" Else ph_select = ""
					RW("<option value="&PHARR(i)&" "&ph_select&">"&PHARR(i)&"</option>")
				Next%>
				</select> -
				<input type="number" name="user_hp2" style="width:90px" value="<%=user_hp2%>" class="form-control" id="user_ph2" placeholder="1234" /> -
				<input type="number" name="user_hp3" style="width:90px" value="<%=user_hp3%>" class="form-control" id="user_ph3" placeholder="5678"/>
			</td>
		</tr>
		<tr>
			<th class="bg-mute cols-20 center hidden-xs"><label for="Insti_File1">사업자등록증</label></th>
			<td class="cols-80">
				<input type="file"  name="Insti_File1" class="cols-70"/>
				<%If Insti_File1 <> "" then%>
					<input type="checkbox" name="fn_del0" value="Y" id="fn_del0" /> <label for="fn_del0">삭제</label> 
					<br/>
					- 이전파일 : <%=Insti_File1%>
				<%End if%>
			</td>
		</tr>
		<tr>
			<th class="bg-mute cols-20 center hidden-xs"><label for="bank_img">통장사본</label></th>
			<td class="cols-80">
				<input type="file"  name="bank_img" class="cols-70"/>
				<%If bank_img <> "" then%>
					<input type="checkbox" name="fn_del1" value="Y" id="fn_del1" /> <label for="fn_del1">삭제</label> <br/>
					- 이전파일 : <%=bank_img%>
				<%End if%>
			</td>
		</tr>
		
	</table>
	<% If MYID = "" then%>
	<input type="hidden" name="idChk" value="">
	<input type="hidden" name="nickChk" value="">
	<%End if%>
	<input type="hidden" name="seq" value="<%=seq%>">
	<input type="hidden" name="arng" value="<%=arng%>">
	<input type="hidden" name="page" value="<%=page%>">
	<input type="hidden" name="search" value="<%=search%>">
	<input type="hidden" name="searchstr" value="<%=searchstr%>">

<div class="cols-md-12 center">
	<a class="btn btn-default" onclick="FRM_SEND()">등 록</a>
	<a class="btn btn-default" onclick="history.go(-1)">취 소</a>
	<%If MYID <> "" then%>
		<a class="btn btn-default" onclick="memberRemove('<%=MYID%>')">회원탈퇴</a>
	<%end if%>
</div>
</form>
<script type="text/javascript">
function FRM_SEND(){
	var x = document.FRM;
<% If arng = "write" then%>
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
	if (!x.User_PW.value){
		alert("비밀번호 입력 해야합니다.");
		x.User_PW.focus();
		return false;}
<%If arng = "write" then%>
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
	if (!x.Insti_Name.value){
		alert("회사명을 입력 해야합니다.");
		x.Insti_Name.focus();
		return false;
	}
	if (!x.depart_name.value){
		alert("부서명을 입력 해야합니다.");
		x.depart_name.focus();
		return false;
	}
	x.submit();
}

function popup_(v1){
	$("#hiddenZone").show();
	hiddenZone.location.href= "/includefiles/global/"+v1+".asp";
	}

function IDFIND_(v1) {
	if (v1 == "ID")	{
		var UserID = document.FRM.UserID.value;
		if (!UserID){
			alert("아이디를 입력하세요" );
			document.FRM.UserID.focus();
			return false;
		}
		if (checkId(UserID) == false ){
			document.FRM.UserID.focus();
			return false;
		}
	} 
   hiddenZone.location.href="../../includefiles/global/idFind_end.asp?arng="+v1+"&UserID="+UserID;
   return false;
}

function memberRemove(v1){
	if (confirm("회원탈퇴를 하면 모든 회원정보가 삭제되면 복구가 불가능합니다.\n탈퇴를 하시겠습니까?")){
		//hiddenZone.location.href= "/includefiles/global/"+v1+".asp";
	}
}
</script>
	</div>
 </div>
 </body>
</html>