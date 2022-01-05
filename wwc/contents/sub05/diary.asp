<% response.expires=-1000 %>
<!--#include file="../../LIB/_headInclude.asp"-->
<!--#include file="../../includefiles/global/cal_lunartosol.asp"-->
<!--#include file="../../includeFiles/global/curDate.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<!doctype html>
<html lang="ko">
 <head>
  <meta charset="UTF-8">
  <title>월별계획표</title>
 </head>
 <body>
<div id="sub_content" class="sub0605">
	<div class="P01 center mgb5 hidden-xs">
        <a href="javascript:;" onclick="$('#body-cont').load('<%=self_page%>?cur_Year=<%=preYear-1%>&cur_Month=<%=cur_Month%>')" class="btn btn-default "><i class="el el-backward"><span class="ir">이전해</span></i></a> &nbsp;
        <a href="javascript:;" onclick="$('#body-cont').load('<%=self_page%>?cur_Year=<%=preYear%>&cur_Month=<%=preMonth%>')" class="btn btn-default " ><i class="el el-caret-left"><span class="ir">이전달</span></i></a> &nbsp;
        <span class="title3 "><%=cur_Year%>년 <%=cur_Month%>월</span>
        <a href="javascript:;" onclick="$('#body-cont').load('<%=self_page%>?cur_Year=<%=nextYear%>&cur_Month=<%=nextMonth%>');" class="btn btn-default mgl10"><i class="el el-caret-right"><span class="ir">다음달</span></i></a> &nbsp;
        <a href="javascript:;" onclick="$('#body-cont').load('<%=self_page%>?cur_Year=<%=nextYear+1%>&cur_Month=<%=cur_Month%>');" class="btn btn-default" ><i class="el el-forward"><span class="ir">다음해</span></i></a>
    </div>
    <table class="table-bordered cols-100  hidden-xs">
        <caption>월별계획표 상세보기</caption>
        <colgroup>
            <col class="cols-14">
            <col class="cols-14">
            <col class="cols-14">
            <col class="cols-14">
            <col class="cols-14">
            <col class="cols-14">
            <col class="cols-14">
        </colgroup> 
        <thead>           
        <tr>
        <% for i = 0 to 6 %>
            <th scope="col"  class="cols-14 hid40 center">
        <%
                select case i
                    case 0 RW("<b style='color:#FF0000'>일 (SUN)</b>")
                    case 1 RW("<b style='color:#000'>월 (MON)</b>")
                    case 2 RW("<b style='color:#000'>화 (TUE)</b>")
                    case 3 RW("<b style='color:#000'>수 (WED)</b>")
                    case 4 RW("<b style='color:#000'>목 (THU)</b>")
                    case 5 RW("<b style='color:#000'>금 (FRI)</b>")
                    case 6 RW("<b style='color:#0000FF'>토 (SAT)</b>")
                end select
        %>
            </th>
        <% next %>
        </tr>
        </thead>
        <tbody>
            <tr>
                <%for z = 1 to start_Day - 1 %>
				<td class="cols-14" ></td>
				<%next
                  nextholyday   = false '어린이날/추석/설날이 토/일요일일 경우 대체공휴일
                  holy          = false ' 대체공휴일을 찾기위한 공휴일
				  for m = start_Day to lastDay + start_Day - 1
						l_day		= m - start_Day + 1
						colr		= ""
						e_colr		= "</span>"
						cont		= ""
						'양력날짜
						n_date		= dateSerial(cur_Year,cur_Month,l_Day)%>
                <td class="cols-14 hid100 top <%if date() =   dateSerial(cur_Year,cur_Month,l_Day) then RW( "bg-gray") %> " >
                    <div class="cols-100 hid25 pdl5 title09">
                        <ul class="all-unstyled">
                            <li class="f-left">
                                <%
                                luDate	    = gf_lun2sol(cur_Year,cur_Month,l_day,"")
                                luMonth	    = left(luDate, 2)
                                luday	    = Right(luDate, 2)
                                holy        = false 

                                Select Case CInt(luday)
                                    Case 1, 7, 15, 21
                                        lunmd = "(음)"&CInt(luMonth)&"."&int(luday)
                                    Case Else
                                        lunmd = ""
                                End Select
                                 umDate          = gf_lun2sol(cur_Year,cur_Month,l_day,"")
                                
                                select case n_date
                                    case dateSerial(cur_Year,01,01)
                                        colr    = "<span style='color:#FF0000'>"
                                        cont    = "신정 "
                                        holy    = true
                                    case dateSerial(cur_Year,03,01)
                                        colr    = "<span style='color:#FF0000'>"
                                        cont    = "삼일절 "
                                        holy    = true
                                    case dateSerial(cur_Year,04,05)
                                        colr    = "<span style='color:#000'>"
                                        cont    = "식목일 "
                                    case dateSerial(cur_Year,05,05)
                                        colr    = "<span style='color:#FF0000'>"
                                        cont    = "어린이날 "
                                        holy    = true
                                        if nextholyday <> "3" then nextholyday = holydayNext(dateSerial(cur_Year,cur_Month,l_day), holy)
                                    case dateSerial(cur_Year,06,06)
                                        colr    = "<span style='color:#FF0000'>"
                                        cont    = "현충일 "
                                        holy    = true
                                    case dateSerial(cur_Year,07,17)
                                        colr    = "<font style='color:#000'>"
                                        cont    = "제헌절 "
                                    case dateSerial(cur_Year,08,15)
                                        colr    = "<span style='color:#FF0000'>"
                                        cont    = "광복절 "
                                        holy    = true
                                    case dateSerial(cur_Year,10,03)
                                        colr    = "<span style='color:#FF0000'>"
                                        cont    = "개천절 "
                                        holy    = true
                                    case dateSerial(cur_Year,10,09)
                                        colr    = "<span style='color:#FF0000'>"
                                        cont    = "한글날 "
                                        holy    = true
                                    case dateSerial(cur_Year,12,25)
                                        colr    = "<span style='color:#FF0000'>"
                                        cont    = "성탄절 "
                                        holy    = true
                                end Select
                               
                               
                                select case umDate
                                    case "12-29"
                                        nextDate        = CDate(cur_Year&"-"&cur_Month&"-"&l_day) + 1
                                        next_umDate     =   gf_lun2sol(Year(nextDate),Month(nextDate),Day(nextDate),"") 
                                        if next_umDate = "01-01" then 
                                             holy    = true
                                            colr = "<span style='color:#FF0000'>"
                                            danny_lunar = "설날연휴 "
                                            nextholyday = holydayNext(dateSerial(cur_Year,cur_Month,l_day),holy)
                                        end if
                                    case "01-02","12-30"
                                        holy    = true
                                        colr = "<span style='color:#FF0000'>"
                                        danny_lunar = "설날연휴 "
                                        if nextholyday <> "3" then nextholyday = holydayNext(dateSerial(cur_Year,cur_Month,l_day),holy)
                                        
                                    case "01-01"
                                        holy    = true
                                        colr = "<span style='color:#FF0000'>"
                                        danny_lunar = "설날 "
                                        if nextholyday <> "3" then  nextholyday = holydayNext(dateSerial(cur_Year,cur_Month,l_day),holy)
                                        
                                    case "04-08"
                                        colr = "<span style='color:#FF0000'>"
                                        danny_lunar = "석가탄신일 "
                                        holy    = true
                                    case "08-14","08-16"
                                        holy    = true
                                        colr = "<span style='color:#FF0000'>"
                                        danny_lunar = "추석연휴 "
                                        if nextholyday <> "3" then nextholyday = holydayNext(dateSerial(cur_Year,cur_Month,l_day),holy)
                                       
                                    case "08-15"
                                        holy    = true
                                        colr = "<span style='color:#FF0000'>"
                                        danny_lunar = "추석 "
                                        if nextholyday <> "3" then nextholyday = holydayNext(dateSerial(cur_Year,cur_Month,l_day),holy)
                                        
                                    Case Else
                                        danny_lunar = ""
                                end select                                
                                if nextholyday = "3" then                                        
                                    if (umDate = "01-03" or umDate = "08-17") or n_date = cDate(cur_Year&"-05-06") then
                                        holy        = true
                                        nextCont    =  "대체공휴일"
                                        nextholyday  = false
                                    end if
                                else
                                    
                                    nextholyday     = false                                    
                                    nextCont        =  ""
                                end if
                                    

                                 if holy then
                                    holy_colr       = "<span style=""color:#FF0000"">"
                                    e_holy_colr     = "</span>"
                                else 
                                    holy_colr       = ""
                                    e_holy_colr     = ""
                                end if

                                if m mod 7 = 1 then ' 주일
                                    w_color         = "<span style=""color:#FF0000"">"
                                    w_e_colr        = "</span>"
                                    if day(now) = l_day then
                                        RW("<b style='color:#FF0000'> "&l_day&"</b>")
                                    else
                                        RW("<span style='color:#FF0000'> "&l_day&e_colr)
                                    end if
                                elseif m mod 7 = 0 then '토요일
                                    w_color         = "<span style=""color:#0000FF"">"
                                    w_e_colr        = "</span>"
                                    if day(now) = l_day then
                                        RW("<b style='color:#0000FF'> "&holy_colr&l_day&e_holy_colr&"</b>")
                                    else
                                        RW("<span style='color:#0000FF'> "&holy_colr&l_day&e_holy_colr&e_colr)
                                    end if
                                elseif day(now) = l_day then '월 ~ 금요일
                                    w_color         = "<span style=""color:#000"">"
                                    w_e_colr        = "</span>"
                                    RW("<b style='color:#000'> "&holy_colr&l_day&e_holy_colr&"</b>")
                                else
                                    w_color         = "<span style=""color:#000"">"
                                    w_e_colr        = "</span>"
                                    RW("<span style='color:#000'>"&holy_colr&l_day&e_holy_colr&e_colr)
                                end if
                                if colr = "" then colr = "<span>"                                 
                               
                                
                                %>
                                </li>
                                <li class="f-left">
                                    <div class="pdl5 f-left"><%=w_color&holy_colr&cont & danny_lunar & nextCont &e_holy_colr& w_e_colr%></div>
                                    <div class="pdl5 f-left"><%=w_color&holy_colr&lunmd&e_holy_colr&w_e_colr%></div>
                                </li>
                            </ul>
						</div>
                         <%WhereSql = " where syear="&cur_Year&" and smonth = "&cur_month&" and sday="&l_day&" and gubun=1"
                        SFields = "subject, shour, sMinute, seq, content"
                        strSql = "exec Pro_hepatica_select 'tbl_schedule','"&sFields&"','"&whereSql&"'"
                        arrFlds = SqlArray(strSql,1)%>
						<div class="cols-100 left ">
						 <% if not isnull(arrFlds) then
                             for n = 0 to ubound(arrFlds,2)
                                subject     = cutString(arrFlds(0,n), 5)
								shour       = arrFlds(1,n)
								sMinute     = arrFlds(2,n)
								seq			= arrFlds(3,n)
                                if sMinute = "0" then sMinute = "00"
                                sTime       = FormatDateTime(shour&":"&sMinute,3)
                                content     = arrFlds(4,n)

                                RWBR("<a href=""javascript:;"" class=""hand EllipsText title09 pdl5 cols-100"" onclick=""etc_atten('"&seq&"','view')"" title=""새 레이어 창"" id=""d-"&seq&"""> · "&subject&"</a>")
                            next
                          end if%>
						</div>
                </td>
                
                
                <%  if m mod 7 = 0 then %>
			</tr><tr>
				<%  end if	
                  Next
                  for x = 1 to 7 - last_Day  %>
				<td></td>
				   <% if 7 - last_Day = 0 then%>
			</tr>
				   <% End If
				  Next%>
        </tbody>
    </table>	
 </div>
<div id="schedule"></div>
<div id="clasName" class="visible-xs"><!--a href="sc_day_calss.asp?st=schedule&sMenu=01&sc_part=3&cur_date=">a</a--></div>
<script>
    $(function () {
	 $("#clasName").load("sub05/sc_day_calss.asp");
   })

function etc_atten(v1, mode) {
	var wH		= $(window).width();
	
	if (wH < 700){
		var WWID  = parseInt((wH - 10) / 2)			
		$("#schedule").show().height($(window).height()-80).width($(window).width()).css({"top":"0","left":"5px"});	
	} else	{			
		var WWID  = parseInt((wH - 700) / 2)
		$("#schedule").show().height(620).width(700).css({"top":"150px","left":WWID+"px"});			
	}
	$("#schedule").load("/contents/sub05/schedule_view.asp?mode="+mode+"&seq="+v1);	
}
</script>
 </body>
</html>

<%Response.End
Call closeDB
function holydayNext(hDate, holy)
  '대체공휴일
    weekNum   = WeekDay(hDate)  
  if weekNum = 1  then
        holydayNext = "3"
  else
        holydayNext = false
  end if    
end function%>