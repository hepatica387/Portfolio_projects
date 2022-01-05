<%'=========== 연도 범위가 2043년을 넘겼을때 표시 안되게 =================
			If cur_Year = "" Then cur_Year		= request.QueryString("cur_Year")
			If cur_Month = "" Then cur_Month	= request.QueryString("cur_Month")

			if cur_Year > 2050 then
				response.write "<script language=""javascript"">"
				response.write "alert('년도 범위가 벗어 났습니다.');"
				response.write "	history.go(-1);"
				response.write "</script>"

				response.end
			end if

			if cur_Year = "" then 	cur_Year		= Year(now)
			if cur_Month = "" then 	cur_Month		= month(now)


			'============ 윤년 추출 ======================
			select case cur_Month
				   case 1,3,5,7,8,10,12
						 lastDay = 31
				   case	2
						if (((cur_Year mod 4 = 0 ) and (cur_Year mod 100 <> 0)) or (cur_Year mod 400 = 0))then
							lastDay =29
						else
							lastDay = 28
						end if
					case 4,6,9,11
						lastDay = 30
			end select

			start_day = weekDay(dateSerial(cur_Year,cur_Month,1)) '일정표 해당월 첫날
			last_day = weekDay(dateSerial(cur_Year,cur_Month,lastDay))'일정표 해당월 마지막날

			'=========== 다음달로 넘길때 12월 또는 1월로 변경될 경우 년도 같이 바뀜============
			if cur_Month = 1 then
				preYear = cur_Year - 1
				preMonth = 12
				nextYear = cur_Year
				nextMonth = 2
			elseif cur_Month = 12 then
				preYear = cur_Year
				preMonth = 11
				nextYear = cur_Year + 1
				nextMonth = 1
			else
				preYear = cur_Year
				preMonth = cur_Month - 1
				nextYear = cur_Year
				nextMonth = cur_Month + 1
			end If
%>