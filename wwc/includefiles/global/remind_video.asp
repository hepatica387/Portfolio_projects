<%@ Language=VBScript %>
<!--#include file="../../LIB/_headInclude.asp"-->
<!--#include virtual="/includefiles/global/_array.asp"-->
<%
category			= getRequest("category", REQUEST_GET) 
search				= getRequest("search", REQUEST_GET) 
searchstr			= getRequest("searchstr", REQUEST_GET) 
page				= getRequest("page", REQUEST_GET)	
topCnt				= 6
If page = "" Then page = 1
 Select Case category 
	Case "remindtv"		
		category_code		= getRequest("category_code", REQUEST_GET)		
		searchCode			= getRequest("searchCode", REQUEST_GET)		
		If category_code <> "" Then
			categorySql = " and VOD_CATEGORY_CODE in ('"&Replace(category_code,",","','")&"')"
		End if
		playTime			= int(Replace(getRequest("playTime", REQUEST_GET),":",""))
		If playTime > 0 Then
			playTimeSql = " and convert(int,replace(playMinute,':','')) <= "&playTime&"00 "			
		End if		
		If searchCode <> "" Then categorySql = ""
		title		= "영상검색"	
		whereSql = " where display_YN = 'Y' "& categorySql & playTimeSql 		
	Case "chucheon"
		title		= "추천영상"
		whereSql	= " where chuchen = '1' and display_YN = 'Y' "
		S1			= "chuchen"
		S2			= "1"
		topCnt		= 3
	Case "R1100"
		title		= "채정호 TV"
		whereSql = " where VOD_CATEGORY_CODE in ('R1100','R1200','R1300') and display_YN = 'Y' "
		S1			= "VOD_CATEGORY_CODE"
		S2			= "R1100"
	Case "R2100"
		title		= "박예나의 마음 / 봄"
		whereSql = " where VOD_CATEGORY_CODE in ('"&category&"') and display_YN = 'Y' "
		S1			= "VOD_CATEGORY_CODE"
		S2			= category
	Case "R3100"
		title		= "일상 속의 정신과 TV"
		whereSql = " where VOD_CATEGORY_CODE in ('"&category&"') and display_YN = 'Y' "
		S1			= "VOD_CATEGORY_CODE"
		S2			= category
	Case "R4100"
		title		= "3분 정신건강 리뷰"
		whereSql = " where VOD_CATEGORY_CODE in ('"&category&"') and display_YN = 'Y' "
		S1			= "VOD_CATEGORY_CODE"
		S2			= category
	Case "R5100"
		title		= "닥터진의 CCTV"
		whereSql = " where VOD_CATEGORY_CODE in ('"&category&"') and display_YN = 'Y' "
		S1			= "VOD_CATEGORY_CODE"
		S2			= category
End Select
If search <> "" And searchstr <> "" Then	
	category		= search
	whereSql	= ""
	whereSql	= " where "& search &" in ('"&searchStr&"') and display_YN = 'Y'"
	Select Case searchstr
		Case "1"
			title		= "추천영상"			
		Case "R1100"
			title		= "채정호 TV"
			whereSql	= ""
			whereSql	= " where "& search &" in ('"&searchStr&"','R1200','R1300') and display_YN = 'Y'"
		Case "R2100"
			title		= "박예나의 마음 / 봄"
		Case "R3100"
			title		= "일상 속의 정신과 TV"
			whereSql	= ""
			whereSql	= " where "& search &" in ('"&searchStr&"','R3200') and display_YN = 'Y'"
		Case "R4100"
			title		= "3분 정신건강 리뷰"
		Case "R5100"
			title		= "닥터진의 CCTV"
	End Select 	
	
End if
If category = "remindtv" Or (search <> "" And searchstr <> "")  then		
		pagesize	= 12		
		Flds	= " count(seq) "
		OrderBy = " ORDER BY seq desc"
		'strSql = "exec Pro_hepatica_select '"&db_table&"','"&SqlFields&"', '"&whereProSql&"'"		
		arrParams = Array( _
			DB.makeParam("@db_table",advarWchar, adParamInput, Len("tbl_Video")+1, "tbl_Video"), _
			DB.makeParam("@sFileds",advarWchar, adParamInput, Len(Flds)+1, Flds), _
			DB.makeParam("@whereSql",advarWchar, adParamInput, Len(whereSql)+1, whereSql) _
		)
		rs_count  = DB.execRsData("Pro_hepatica_select", DB_CMDTYPE_SP, arrParams, 1)
		pagecount = int((rs_count - 1) / pagesize ) + 1
		sub_Top_Limit = (rs_count - ( page-1 ) * pagesize )
		Top_Limit = pagesize
		if Top_Limit > sub_Top_Limit then Top_Limit = sub_Top_Limit
		Flds = "seq, vod_subject, vod_url, vod_thumb, vod_gubun, vod_content, playMinute, VOD_CATEGORY_CODE"
		arrParams = Array( _
				DB.makeParam("@sFileds",advarWchar, adParamInput, Len(Flds)+1, Flds), _
				DB.makeParam("@db_table",advarWchar, adParamInput, Len("tbl_Video")+1, "tbl_Video"), _
				DB.makeParam("@top_Limit",advarWchar, adParamInput, 8, Top_Limit), _
				DB.makeParam("@ps",advarWchar, adParamInput, 8, (pagesize*(Page-1))), _
				DB.makeParam("@whereSql",advarWchar, adParamInput, Len(whereSql)+1, whereSql), _
				DB.makeParam("@orderby",advarWchar, adParamInput, Len(OrderBy)+1, OrderBy) _
			)
	arrRs = DB.execRsList("Pro_hepatica_List", DB_CMDTYPE_SP, arrParams, listLen, 1)   
Else 
	pagecount		= 1
	Sql = ""
	Sql = Sql & " select top "&topCnt&" seq, vod_subject, vod_url, vod_thumb, vod_gubun, vod_content, playMinute, VOD_CATEGORY_CODE "
	Sql = Sql & " from tbl_Video " & whereSql & " order by seq desc"
	arrRs	= SqlArray(Sql, 1)	
End If 
If page = "" Or page = 1 Then titlemgt = "mgt30" 
If Not isnull(arrRs) Then 
	cnt		=  ubound(arrRs, 2)
%>
	<div class="vod-wrap <%=titlemgt%>">
	  <%If (category = "remindtv" And page = 1 ) Or (category <> "remindtv" And page = 1) Or (search <> "" And searchstr <> "" And page = 1) then%>	
		<div class="cols-100 left">
			<a href="/?search=<%=S1%>&searchstr=<%=S2%>&page=1" ><span style="border-top:1px solid #ff8000;" class="pdt3 t500 center title10 t-gray"><%=title%></span></a>
		</div>	
	<%End if%>
		<div class="row ">		
	<%	
			For i = 0 To ubound(arrRs, 2)
				If category = "remindtv" Then num = ((page -1) * pagesize) + i Else num = i
				seq				= arrRs(0,i)
				vod_subject		= arrRs(1,i)
				vod_url			= arrRs(2,i)
				vod_thumb		= arrRs(3,i)
				vod_gubun		= arrRs(4,i)
				vod_content		= arrRs(5,i)
				playMinute		= arrRs(6,i)
				category_code	= arrRs(7,i)
				category_NAme =  code_value(VOD_CATEGORY_ARR, VOD_CATEGORY_CODE, category_code , "01")
				viewInt			= int(num / 3)
				thumbImgUrl		= "https://img.youtube.com/vi/"&vod_url&"/mqdefault.jpg"
				%>
		  <div class="col-xs-4 mgt30 ">
			<div class="border-line Thumbnail hand" id="vod_<%=seq%>_<%=category%>" onclick="contentView('<%=seq%>','<%=viewInt%>','<%=category%>')">
			  <img src="<%=thumbImgUrl%>" alt="<%=vod_subject%>" style="width:100%;height:200px"/>
			  <div class="caption hid80 pdt10 pdl10 pdr10">
				<div class="title3"><%=vod_subject%></div>				
			  </div>
			</div>						
		  </div>
		  <% 
		   If (i Mod 3 = 2) Then
			 RW("<div class="""&category&" vodview col-xs-12 left mgt10""></div>")
		   ElseIf i = cnt And i Mod 3 < 2 Then 
			 RW("<div class="""&category&" vodview col-xs-12 left mgt10""></div>")
		   End if
		  Next 
		  If pagecount > int(page) And ((category = "remindtv") Or (search <> "" And searchstr <> "" )) Then %>
			<div class="col-xs-12 right mgt30 nextBtn" ><a href="javascript:;" onclick="remindtv_view('<%=page+1%>');$('.nextBtn').remove();" class="button t-inner" > 다 음 </a></div>
		<%End if%>
		</div>		
	  </div>
<%		
End if
Call closeDB %>