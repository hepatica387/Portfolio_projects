<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include file="../../includefiles/global/pageFind.asp"-->
<%
 page     = Request.queryString("page")
If page = "" Or  page = 0 Then page = 1
pagesize    = 12
h_Year     = Request.QueryString("h_Year")
if h_Year <> "" then
    whereProSql = " where cYear="&h_Year
else
    whereProSql = " "
end if
'RW(Request.queryString)
'response.end

SqlFields = "Count(seq) as rs_cnt"
strSql = "exec Pro_hepatica_select '"&db_table&"','"&SqlFields&"', '"&whereProSql&"'"
	arrParams = Array( _
		DB.makeParam("@db_table",advarWchar, adParamInput, 15, "haedal_Book"), _
		DB.makeParam("@sFileds",advarWchar, adParamInput, Len(SqlFields)+1, SqlFields), _
		DB.makeParam("@whereSql",advarWchar, adParamInput, Len(whereProSql)+1, whereProSql) _
	)
rs_count = DB.execRsData("Pro_hepatica_select", DB_CMDTYPE_SP, arrParams, 1)
pagecount = int((rs_count-1)/pagesize)+1


sub_Top_Limit	= ( rs_count - ( page-1 ) * pagesize )
Top_Limit		= CInt(pagesize)
if Top_Limit > sub_Top_Limit then Top_Limit = sub_Top_Limit
SqlFields = "seq, cYear, cMonth, FN, IMGFN, isnull(content, '') "
OrderBy = " ORDER BY cYear desc, cMonth desc "
arrParams = Array( _
	DB.makeParam("@sFileds",advarWchar, adParamInput, Len(SqlFields)+1, SqlFields), _
	DB.makeParam("@db_table",advarWchar, adParamInput, 15, "haedal_Book"), _
	DB.makeParam("@top_Limit",advarWchar, adParamInput, 8, Top_Limit), _
	DB.makeParam("@ps",advarWchar, adParamInput, 8, (pagesize*(Page-1))), _
	DB.makeParam("@whereSql",advarWchar, adParamInput, Len(whereProSql)+1, whereProSql), _
	DB.makeParam("@orderby",advarWchar, adParamInput, Len(OrderBy)+1, OrderBy) _
	)
arrFlds = DB.execRsList("Pro_hepatica_List", DB_CMDTYPE_SP, arrParams, listLen, 1)%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
 </head>
 <body>
  <div class="sub02 center cols-100"  >
	<div class="cols-100 flex" >
        <%if not isnull(arrFlds) then
            for i = 0 to ubound(arrFlds, 2)
                num                 = rs_count-i-(Page-1)*PageSize
                seq                 = arrFlds(0,i)
                cYear               = arrFlds(1,i)
                cMonth              = arrFlds(2,i)
                if cMonth < 10 then cMonth = "0"&cMonth
                FN                  = arrFlds(3,i)
                IMGFN               = trim(arrFlds(4,i))
                content             = arrFlds(5,i)
                content             = cutString(Replace(content,"\",""),110)
                FOLDER              = cYear&cMonth
				ImgARR_Cnt              = 0
				if FN <> "" then
					ImgARR              = split(FN,"^")
					ImgARR_Cnt          = ubound(ImgARR)
				end if
                %>
			   <div>
					<div class="shadow"><a href="javascript:;" onclick="sosic_view('<%=ImgARR_Cnt%>','<%=FOLDER%>')" title="<%=cYear%>년 <%=cMonth%>월 소식기"><Img src="/dataFiles/WEBBOOK/<%=cYear&cMonth%>/<%=IMGFN%>" class="webbook_thumb" alt="<%=content%>"/></a></div>
					<div class="mgt20 center">

						<div class="t400"><%=cYear%>년 <%=cMonth%>월</div>
						<div class=""><%=content%></div>
					</div>
			   </div>


        <%next
        end if%>
		</div>
        <div class="cols-100"> <%call ajaxPage(self_page, "body-cont")	%></div>
        <!--div class="hdDoc center">
            <form name="schFrm" method="get" class="form-inline" id="schFrm" action="<%=self_page%>">
                <select name="h_year" id="h_year" class="form-control">
					<option value="" <%If h_year = "" Then Response.write "selected"%>>년도 선택</option>
					<%For i = Year(now) To 1989 Step -1%>
						<option value="<%=i%>" <%If h_year = CStr(i) Then Response.write "selected"%>><%=i%>년</option>
					<%next%>
				</select>
                <a href="javascript:'" onclick="sendIt()"  class="btn btn-default" id="sch_button">검색</a>
            </form>
		</div-->
</div>
 </body>
</html>
<%Call closeDB%>
<script type="text/javascript">
function sendIt() {
    var h_year		= $("#h_year").val();
    $.ajax({
		type     : "GET",
		url      : "<%=self_page%>",
		dataType : "html",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data     : "h_year="+h_year,
        success  : function(result){
           $(".body-cont").html(result);
		},
		error    : function(){
			alert("검색 오류입니다.");
		}
	});
}
function sosic_view(imgCnt, fld){
	var hid		= $(window).height();
	var wid		= parseInt(hid * 0.7)
	if ($(window).width() > 600){
		window.open('/contents/sub02/webbook.asp?pageCnt='+imgCnt+'&Webbook='+fld,'webbook','width=600 height=1000');
	} else {
		window.open('/contents/sub02/webbook.asp?pageCnt='+imgCnt+'&Webbook='+fld,'webbook','width='+wid+' height='+hid);
	}

}

</script>