<!--#include virtual="/LIB/_Headinclude.asp"-->
<!--#include virtual="/LIB/CharSet_utf.asp"-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<%		'현재글 관련 커멘트 불러오기
		parent_seq = Request.QueryString("parent_seq")
		page	   = Request.QueryString("page")
		arng	   = Request.QueryString("arng")
		co_seq		= Request.QueryString("co_seq")
		If arng = "" Then arng ="write"
		db_table = "silver_contents_coment"

	com_SqlFields = "seq, name, id, pwd, wdate, ment, co_ref,co_re_level, co_re_step, ip, wte_device"
	whereSql = " where parent_seq="&parent_seq&" order by co_ref desc,  co_re_step"
	ComentSql = "exec Pro_hepatica_select '"&db_table&"','"&com_SqlFields&"', '"&whereSql&"'"
	arrFlds = SqlArray(ComentSql, 1)

		If Not IsNull(arrFlds) Then %>
		<div class="pdt20 mgb20 bold text-info text-left" style="width:<%=table_width%>">
			<img src='/board/img/ico_comment.gif' /> 댓글 <%=UBound(arrFlds,2) + 1%>개
		</div>
		<% 	For n = 0 To UBound(arrFlds,2) Step 1
				co_seq			= arrFlds(0,n)
				co_name			= arrFlds(1,n)
				co_id			= arrFlds(2,n)
				co_pwd			= arrFlds(3,n)
				co_wdate		= arrFlds(4,n)
				co_ment			= arrFlds(5,n)
				co_ip			= arrFlds(9,n)
				wte_device		= arrFlds(10,n)
				If wte_device = "" Or isnull(wte_device) Then wte_device = "PC"
				co_ment			= replace(co_ment,"[PREV]","<font color='#6AB5FF'>")
				co_ment			= replace(co_ment,"[/PREV]","</font>")
				if co_reply_chk then
					co_ref		= arrFlds(6,n)
					co_re_level = arrFlds(7,n)
					co_re_step	= arrFlds(8,n)
				end If

		%>	<div style="border:1px solid #DDDDDD;padding:0;background:#FCFCFC;width:<%=table_width%>" class="mgb20" >
			<table style="padding:0;width:100%" >
			  <TR>
				<TD valign="middle" style="border-bottom:1px dotted #999999" class="cols-12">
				  <div class="cols-100 flex">
					 <div class="cols-80 pdt5 pdb5">
						<% if co_re_level > 0 then
						  wid= 5 * co_re_level%>
								<img src="/board/img/level.gif" width="<%=wid%>" height="12">
								<img src="/board/img/re.gif" align="absmiddle">
						<% end if %>
						<FONT class="pdl10 t500"><i class="fa fa-user-o" aria-hidden="true"></i>  <%=co_name%></FONT>님의 댓글 <span class="text-error">(<%=replace(co_wdate,"-",".")%>)</span>
						<span class="mgl20 t400 hidden-xs"><i class="fa fa-tablet " aria-hidden="true"></i>  <%=wte_device%></span>
					  </div>
					  <div class="cols-18 pdt3 pdb5 pdr5 right">
						<%if (Myid = co_id And Myid <> "" ) or adminView then %>
								<a href="javascript:;"  onclick="$('#coment_<%=parent_seq%>').load('coment.asp?parent_seq=<%=parent_seq%>&page=<%=page%>&arng=edit&co_seq=<%=co_seq%>');" class='btn btn-xs btn-default' >수정</a>
								<a href="javascript:void(0)" onclick='if(confirm("데이터가 완전히 삭제되고 복구가 불가능합니다.\n\n삭제하시겠습니까?")) {cmt_del("<%=co_seq%>", "<%=parent_seq%>")}' class='btn btn-xs btn-danger' style="color:#FFF" >삭제</a>
						<%end if%>
						</div>
					</div>
				<!-- Modal -->


				</TD>
			</TR>
			<TR  height="40" >
				<TD colspan="2" valign="top"><div class="pdt20 pdl10 pdr10 pdb10"> <%=replace(co_ment,vblf,"<br/>")%></div></TD>
			</TR>
		 <%If ip_view_chk and adminView then%>
			 <tr><td height="15" valign="top" width="100%" class="d" align="right" colspan="2"><font class="title07">IP : <%=co_ip%></a>&nbsp;</td></tr>
		 <%End If
		 Response.write "</TABLE></div>"
		next
	 End If
If arng  = "write" Then %>
<div  style="width:<%=table_width%>"  id="comentReply" >
		<div style="border:1px solid #DDDDDD;padding:0;background:#FCFCFC;" class="mgb20 col-xs-12"  >
		<form name="ment_frm_<%=parent_seq%>"  id="ment_frm_<%=parent_seq%>" class="col-xs-12" >
		<TABLE width="98%" cellpadding="0" align="center">
				<tr>
					<td class="pdl20 pdb10 pdt10" style="border-bottom:1px dotted #999999" >
						<div><img src="/BOARD/img/c_add.gif"> 답 글 달 기</div>
					</td>
				</tr>
				<tr>
					<TD class="cols-12">
						<div class="cols-100 flex " style="margin:5px 0 0 10px" >
							<div class="cols-90 flex-mg">
								<textarea name="ment" id="ment_<%=parent_seq%>" wrap='virtual' class="form-control pull-left cols-90 cols-90 cols-90 col-sm-85 col-xs-6 col-mi-70 mgr5" rows="4"  onkeyup="checkBytes(this,2000);" onKeydown="ment_scale(this.scrollHeight,'ment_<%=parent_seq%>');" rel="kr int en" tabindex=3 ></textarea>
							</div>
							<div class="cols-8 flex-mg">
								<a href="javascript:;" onclick="ment_snd(document.ment_frm_<%=parent_seq%>)" style="padding:32px 20px;color:#FFF"  class="pull-left btn btn-lg btn-primary"  tabindex=5 >저장</a>
							</div>
						</div>
					</TD>
				</TR>
				<tr><Th colspan="3" height="25"></td></tr>
			</TABLE>
			<input type="hidden" name="name" id="name" value="<%=myName%>" />
			<input type="hidden" name="parent_seq" value="<%=parent_seq%>" />
			<input type="hidden" name="db_table" value="<%=db_table%>" />
			<input type="hidden" name="id" value="<%=Myid%>" />
			<input type="hidden" name="page" value="<%=page%>" />
			<input type="hidden" name="arng" value="write" />
			<input type="hidden" name="wte_device" value="" />
			<input type="hidden" name="seq" value="" />
			</form>
			</div>
<% Else If arng = "edit" Then

		SqlFields = " name,  ment, co_ref,co_re_level, co_re_step, id "
		whereSql = " where seq="&Request("co_seq")
		coReplySql = "exec Pro_hepatica_select '"&db_table&"','"&SqlFields&"', '"&whereSql&"'"
		arrFields = SqlArray(coReplySql, 1)
		If Not IsNull(arrFields) Then
			co_ment = arrFields(1,0)
			co_id		= arrFields(5,0)
			if co_reply_chk  then
				co_ref = arrFields(2,0)
				co_re_level = arrFields(3,0)
				co_re_step = arrFields(4,0)
			end If

%>

		<div style="border:1px solid #DDDDDD;padding:0;background:#FCFCFC;" class="mgb20 col-xs-12 " >
		<form name="ment_frm_<%=parent_seq%>"  id="ment_frm_<%=parent_seq%>" class="col-xs-12">
		<TABLE width="100%" cellpadding="0">
			<tr>
				<td class="pdl20 pdb10 pdt10" style="border-bottom:1px dotted #999999" >
					<div><img src="/BOARD/img/c_add.gif"> <B>답 글 수 정</B></div>
				</td>
			</tr>
		<%  bt_id		= "e_btm"
			input_read	= "readonly"%>

					<tr>
						<TD class="cols-12">
							<div class="col-xs-98" style="margin:5px 0 0 15px" >
								<textarea name="ment" id="ment_<%=parent_seq%>"  wrap='virtual' class="form-control pull-left cols-90 cols-90 cols-90 col-sm-85 col-xs-6 col-mi-70 mgr5" rows="4"  onkeyup="checkBytes(this,2000);" onKeydown="ment_scale(this.scrollHeight, 'ment_<%=parent_seq%>');" rel="kr int en" tabindex=4 ><%=co_ment%></textarea>
								<a href="javascript:;" onclick="ment_snd(document.ment_frm_<%=parent_seq%>)" class="pull-left btn btn-lg btn-primary pdt30 pdb30 "  tabindex=5 >저장</a>
							</div>
						</TD>
					</TR>
					<tr><Th colspan="3" height="25"></td></tr>
					<input type="hidden" name="arng" value="edit" />
					<input type="hidden" name="parent_seq" value="<%=parent_seq%>" />
					<input type="hidden" name="db_table" value="<%=db_table%>" />
					<input type="hidden" name="page" value="<%=request("page")%>" />
					<input type="hidden" name="seq" value="<%=request("co_seq")%>" />
					<input type="hidden" name="wte_device" value="" />
					<input type="hidden" name="id" value="<%=co_id%>" />

			</TABLE>
			</form>
			</div>
 <%		End If
End if
end if %>
</div>
<script language="javascript">
function ment_snd(x) {
	//var x = document.ment_frm ;
	var wte_device = check_device(); // 디바이스 이름
	if (!x.ment.value){
		alert("내용을 입력하세요");
		x.ment.focus();
		return false ;
		}

		x.wte_device.value = wte_device;
		ifrm_form("cmt", "cmt")
		x.method	= "post";
		x.target	= "cmt"
		x.action	= "ment_prog.asp"
		x.submit();
		return;

	}



function cmt_del(v1, v2) {
	var x = eval("document.ment_frm_"+v2)
		//alert(x.id.value)
		ifrm_form("cmt", "cmt")
		x.method	= "post";
		x.target	= "cmt" ;
		x.action	= "ment_prog.asp" ;
		x.seq.value	= v1;
		x.arng.value = "del"
		x.submit();
}


function ment_scale(m, m2) {
	var keycode = event.keyCode ;
	//alert($("#"+m2).val());

	var foo = $("#"+m2).val();
	var nzeo_ascii; // 아스키값 변수 지정
	var nzeo_enter_num=0; // 엔터키값 변수 지정
	var nzeo_total_num=0; // 엔터키 값의 합계 변수 지정


for (var i=0; i< foo.length; i++) {
	nzeo_ascii = foo.charCodeAt(i);
	if (nzeo_ascii == 10)
		nzeo_enter_num++; // 엔터값 count 증가
   }
	 if ( nzeo_enter_num >= 2 ) $("#"+m2).attr("rows",nzeo_enter_num + 2);
	 else $("#"+m2).attr("rows",4);
}

</script>
<!--==================================== 멘 트 입 력 끝 =====================================-->