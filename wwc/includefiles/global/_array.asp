<%
' 공통 변수들
HP_ARR			= "010,011,016,017,018,019"
TEL_ARR			= "02,031,032,033,041,042,043,051,052,053,054,055,061,062,063,064,070"
PHONE_ARR		= "010,011,016,017,018,019,02,031,032,033,041,042,043,051,052,053,054,055,061,062,063,064,070"
GU_NAME		=  "강남구,강동구,강북구,강서구,관악구,광진구,구로구,금천구,노원구,도봉구,동대문구,동작구,마포구,서대문구,서초구,성동구,성북구,송파구,양천구,영등포구,용산구,은평구,종로구,중구,중랑구"
arr_board = "gangnam,gangDong,gangbuk,gangseo,gwanak,gwangjin,guro,geumcheon,nowon,dobong,dongdaemun,dongjak,mapo,seodaemun,seocho,seongdong,seongbuk,songpa,yangcheon,yeongdeungpo,yongsan,eunpyeong,jongno,jung,jungnang"

dayOfWeek		= "일,월,화,수,목,금,토"
MONTH_STR		= "1월,2월,3월,4월,5월,6월,7월,8월,9월,10월,11월,12월"
MONTH_CD		= "01,02,03,04,05,06,07,08,09,10,11,12"

DAY_STR		= ""
DAY_CD			= ""
 For n = 1 To 31
	If n < 10 Then n_i = "0"&n Else n_i = n
	If n = 1 Then
		DAY_STR =  n &"일"
		DAY_CD	=  n_i
	Else
		DAY_STR =  DAY_STR & "," & n &"일"
		DAY_CD	=  DAY_CD &"," & n_i
	End If
 Next

YEAR_STR	= ""
YEAR_CD		= ""
 For n = Year(now) To Year(now)	- 100 step -1
	'If n = (Year(now)-1) Then
	'	YEAR_CD		= n
	'	YEAR_STR	= n&"년"
	'Else
		YEAR_CD		= YEAR_CD &","& n
		YEAR_STR	= YEAR_STR&","&n&"년"
	'End If
 Next

''==========================================================================
	'공개범위
''==========================================================================
ARR_OPEN = "일반회원,레벨12,레벨11,레벨10,레벨9,레벨8,레벨7,레벨6,레벨5,레벨4,레벨3,레벨2,최고관리자"
ARR_OPEN_code = "13,12,11,10,9,8,7,6,5,4,3,2,1"


ARR_MEMBER = "일반회원,레벨12,레벨11,레벨10,레벨9,레벨8,레벨7,레벨6,레벨5,레벨4,레벨3,레벨2,최고관리자"

''==========================================================================
	'자원관리대상특성코드(코드값 배열, value값 배열, value값 , 코드구분) 01 :코드 => value 값
''==========================================================================
Function code_value(ARR_CODE, ARR_VALUE, Value , cd_gubun)
     If Not isArray(ARR_CODE) Then
		code = Split(ARR_CODE,",")
		cd_name = Split(ARR_VALUE,",")
	Else
		code = ARR_CODE
		cd_name = ARR_VALUE
	End If
		For l = 0 To ubound(code)
			If cd_gubun = "01" Then
				If Value = code(l) Then
					 cd_code = cd_name(l)
					Exit For
				End If
			Else
				If Value = cd_name(l) Then
					 cd_code = code(l)
					Exit For
				End If
			End if
		Next
		'Response.write cd_code
		code_value = cd_code
End Function
%>