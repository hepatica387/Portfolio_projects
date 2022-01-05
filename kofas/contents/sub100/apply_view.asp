<%
page			= request("page")
search			= request("search")
searchstr		= request("searchstr")
seq				= request("seq")
setParams		= "page="&page&"&search="&search&"&searchstr="&searchStr
ImgFolder		= "/dataFiles/PRODUCT/"
whereSql		= " where A.seq=?"

db_table		= " TBL_APPLY A INNER JOIN TBL_PRODUCT B ON A.product_seq = B.seq"
Field			= " A.Userid, A.apply_company, A.Username, A.phone, A.email, convert(varchar(10), A.regDate, 120)  regdate, A.apply_state, A.status, A.product_seq"
Field			= Field &", B.titlefirst, B.titlesecond, B.kofascode, B.cadcode, A.contents, B.mismicode, B.gubun  "
strSql			= "select "&Field&" from "& db_table & whereSql
arrParams = Array( _
	DB.makeParam("@seq", adInteger, adParamInput, 8, seq) _
)
	Set Rs = DB.execRs(strSql, DB_CMDTYPE_TEXT, arrParams,  1)
	If Not Rs.eof And Not RS.bof Then
		Userid				= Rs(0)
		apply_company		= Rs(1)
		Username			= Rs(2)
		phone				= Rs(3)
		email				= Rs(4)
		regDate				= Replace(Rs(5), "-",".")
		apply_state			= Rs(6)
		If apply_state = "Y" Then apply_MSG	= "주문" Else apply_MSG	= "<span class=""t-danger"">주문취소</span>"
		status				= Rs(7)
		If status = "N" Then status_MSG	= "처리전" Else status_MSG	= "<span class=""t-success"">처리완료</span>"
		product_seq			= Rs(8)
		titlefirst			= Rs(9)
		If titlefirst = "" Then titlefirst = "-"
		titlesecond			= Rs(10)
		kofascode			= RS(11)
		cadcode				= RS(12)
		contents			= Replace(RS(13), VBLF, "<br>")
		mismicode			= RS(14)
		gubun				= RS(15)
		cadimgpath			= ImgFolder & gubun&"/cadcode/"&cadcode
		cadChk				= FileExists(Replace(cadimgpath,"/","\"))
		If Not cadChk Then
			cadimgpath = ""
		End If
	Else
		Call EndGoURL("데이터가 존재하지 않습니다.")
	End If
	call closeRs(RS)

	whereSql	= " where A.product_seq= "&product_seq&" and apply_seq='"&seq&"'"
	Flds		= " A.LENGTH, B.X_POS, B.Y_POS "
	TABLE		= " APPLY_PRODUCT A LEFT OUTER JOIN PRODUCT_POSITION B ON A.POSITION_SEQ = B.SEQ "

	strSql = "select "&Flds&" from "& TABLE & whereSql
	arrFields = SqlArray(strSql, 1)
%>
<iframe frameborder="0" scrolling="no" name="popup" id="popup"></iframe>
<div id="print_div">
	<div style="width:1200px;">
		<table style="width:100%;" class="table border-bottom "  summary="<%=Board_title%> 목록">
			<tr>
				<th class="bg-mute cols-20 center t500"><label for="category">부품명</label></th>
				<td class="cols-80" colspan="3">
					<div><label>&bull; <%=titlesecond%> (<%=titlefirst%>)</label></div>
				</td>
			</tr>
			<tr>
				<th class="bg-mute cols-20 center t500"><label for="category">부품코드</label></th>
				<td class="cols-80" colspan="3">
					<div>
						<label>&bull; 코파스 코드 : <%=kofascode%></label>
						<%If gubun = "mismi" then%>
						<label class="mgl30">&bull; 미스미 코드 : <%=mismicode%></label>
						<%End if%>
					</div>
				</td>
			</tr>
		</table>

		<div id="cadcode" style="background:url('<%'=cadimgpath%>') no-repeat;background-position:center;width:1200px;border:1px solid #DDD;overflow:hidden">
			<%If Not IsNull(arrFields) Then
				For p_i = 0 To 	UBound(arrFields, 2)
					LENGTH			= arrFields(0, p_i)
					X_POS			= arrFields(1, p_i)
					Y_POS			= arrFields(2, p_i)
					'RWBR(X_POS)
					xPos			= Split(X_POS, "^")
					yPos			= Split(Y_POS, "^")
					If ubound(xPos) > 0 Then
						x_pos		= Trim(xPos(0))
						x_width		= Trim(xPos(1))
					End if
					If ubound(yPos) > 0 Then
						y_pos			= Trim(yPos(0))
						y_height		= Trim(yPos(1)) - 7
					End If
					If gubun = "mismi" Then
						x_pos = x_pos + 4
					Else
						x_pos = x_pos + 1
					End if
					%>
					<div class='hand bg-default t500 center title1 t-black pdt0'  style='padding:0 5px;position:absolute;width:<%=x_width%>px;height:<%=y_height%>px;margin-top:<%=x_pos-229%>px;margin-left:<%=y_pos-10%>px;color:#0000ff;z-index:10;' id='pcode_<%=p_seq%>'><%=LENGTH%></div>

				<%Next
			End if%>
				<img src="<%=cadimgpath%>" style=";width:100%;z-index:1" onerror="this.src='/images/etc/blank.png'" >
		</div>
	</div>
	<div style="width:1200px" class="mgt20">
	<table class="table table-bordered">
			<tr>
				<th class="cols-15 center bg-mute t500">회사명</th>
				<td class="cols-35"><%=apply_company%></td>
				<th class="cols-15 center bg-mute t500">담당자(주문)</th>
				<td class="cols-35"><%=Username%></td>
			</tr>
			<tr>
				<th class="cols-15 center bg-mute t500">연락처</th>
				<td class="cols-35"><%=phone%></td>
				<th class="cols-15 center bg-mute t500">이메일</th>
				<td class="cols-35"><%=email%></td>
			</tr>
			<tr>
				<th class="cols-15 center bg-mute t500">요청내용</th>
				<td class="cols-85" colspan="3"><%=contents%></td>
			</tr>
		</table>
	<form name="FRM" method="post">
		<input type="hidden" name="seq" value="<%=seq%>">
		<input type="hidden" name="arng" value="<%=arng%>">
		<input type="hidden" name="page" value="<%=page%>">
		<input type="hidden" name="search" value="<%=search%>">
		<input type="hidden" name="searchstr" value="<%=searchstr%>">
		<input type="hidden" name="gubun" value="<%=gubun%>">
	</form>

		<div class="cols-md-12 center mgt10 btngroup pdb30">
			<a class="btn btn-info btn-lg" onclick="product_view('')">주문목록</a>
			<%If status = "N" And apply_state ="Y"  Then%>
				<a class="btn btn-danger btn-lg f-right" onclick="product_cancel('<%=seq%>')">주문취소</a>
			<%End if%>
		</div>
	</div>
</div>
<script>
	function product_cancel(seq){
		if (confirm("주문을 취소하면 이 주문서는 확인이 불가능합니다.\n\n주문 취소를 실행하시겠습니까?")){
			popup.location.href="/contents/sub100/apply_cancel.asp?seq="+seq;
		}
	}
</script>