<%	If Request("st") <> "" Then
		st		= Request("st")
		sMenu	= Request("sMenu")
	End if
	m_num			= Replace(st,"sub","")
	depth			= Request("depth")
	gubun			= Request("gubun")
	seq				= Request("seq")
	mode			= Request("mode")
	category_code   = Request("category_code")

Select Case st
	Case "sub01"
		mmenu	= 1 ' 메뉴번호
		sCnt	= 1 ' sub 메뉴 갯수
		'sdiv = "#nav-01" '메뉴 ID
		Select Case sMenu
			Case "01"
				UrlPage			= "01.html"
				menu02			= ""
				subTITLE		= "자동차 썬팅"
				subvisual_text	= "루펠은 <br/><label class=""t500 "">시인성이 좋은</label> 자동차 윈도우<br/>필름의 이미지와 뜻을<br/>담고있습니다."
		End Select
		menu_subtitle 		= ""
		menu_arr			= Array("자동차 썬팅")
		menu01				=  "자동차 썬팅"
		boardid_arr			= ""		
		menu_colr			= "#fc873c"		
		table_colr			= "#FFAE35"
		td_colr				= "#FFD69A"
		ste_linecolr		= "#FFEACC"
		ste_bgcolr			= "#FFF7EC"
	Case "sub02"
		mmenu	= 1 ' 메뉴번호
		sCnt	= 1 ' sub 메뉴 갯수
		'sdiv = "#nav-01" '메뉴 ID
		Select Case sMenu
			Case "01"
				UrlPage			= "01.html"
				menu02			= ""
				subTITLE		= "건물 썬팅"
				subvisual_text	= "루펠은 <br/><label class=""t500 "">열차단 성능이 좋은</label> 윈도우<br/>필름의 이미지와 뜻을<br/>담고있습니다."
		End Select
		menu_subtitle 		= ""
		menu_arr			= Array("건물 썬팅")
		menu01				=  "건물 썬팅"
		boardid_arr			= ""				
		menu_colr			= "#00a854"
		table_colr			= "#C5E5DA"
		td_colr				= "#E2F2EC"
		ste_linecolr 		= "#F0F8F6"
		ste_bgcolr			= "#F4FAF8"

	Case "sub03"
		mmenu 				= 3
		sCnt  				= 1
		Select Case sMenu
			Case "01"
				UrlPage 	= ""				
				menu02 		= "공지사항"
				subTITLE		= "자동차 썬팅"
				subvisual_text	= "루펠은 <br/><label class=""t500 "">시인성이 좋은</label> 자동차 윈도우<br/>필름의 이미지와 뜻을<br/>담고있습니다."
		End Select 	
		menu_arr			= Array("공지사항")
		boardid_arr			= Array("Notice")
		menu_colr			= "#59a8df"
		Menu01				= "공지사항"
		table_colr			= "#6DB0F4"
		td_colr				= "#B6D8FA"
		ste_linecolr		= "#DAECFC"
		ste_bgcolr			= "#F1F8FE"
	
	Case "sub04"
		mmenu				= 4		
		sCnt				= 1
		Select Case sMenu
			Case "01"
				UrlPage 	= ""				
				menu02 		= "커뮤니티"	
				subTITLE	= "당신과 같은 이야기를 갖고 있는 사람들의 커뮤니티" 
		End Select
		menu_arr		= Array("커뮤니티")
		boardid_arr		= Array("comunity")
		Menu01			= "커뮤니티"
		menu_colr		= "#744cbb"
		table_colr 		= "#AA53A9"
		td_colr 		= "#D4A9D4"
		ste_linecolr 	= "#EAD4EA"
		ste_bgcolr 		= "#F7EFF7"

	Case "sub05"
		mmenu				= 5		
		sCnt				= 6
		Select Case sMenu
			Case "01"
				UrlPage 	= ""				
				menu02 		= "공지사항"	
			Case "02"
				UrlPage 	= ""				
				menu02 		= "갤러리"	
			Case "03"
				UrlPage 	= ""				
				menu02 		= "가족의견나눔"	
			Case "04"
				UrlPage 	= "diary.asp"				
				menu02 		= "월별계획표"	
			Case "05"
				UrlPage 	= ""				
				menu02 		= "식단표"	
			Case "06"
				UrlPage 	= ""				
				menu02 		= "동영상"	
		End Select
		menu_arr		= Array("공지사항","갤러리","가족의견나눔","월별계획표","식단표","동영상")
		boardid_arr		= Array("Notice","Gallery","freeboard","","board001","vodboard")
		Menu01			= "알림마당"
		menu_colr		= "#744cbb"
		table_colr 		= "#AA53A9"
		td_colr 		= "#D4A9D4"
		ste_linecolr 	= "#EAD4EA"
		ste_bgcolr 		= "#F7EFF7"
	Case "sub06" 
		mmenu		= 6
		sCnt		= 5
		Select Case sMenu
			Case "02"
				UrlPage			= "01.html"
				menu02			= "인사말"			
			Case "03"
				UrlPage			= "02.html"
				menu02			= "법인소개"	
			Case "04"
				UrlPage			= "03.html"
				menu02			= "센터소개"	
			Case "05"
				UrlPage			= "04.html"
				menu02			= "함께하는 사람들"	
			Case "06"
				UrlPage			= "05.html"
				menu02			= "오시는 길"	
			Case "01"
				UrlPage			= "06.html"
				menu02			= "대표인사말"	
		End Select
		menu_arr		= Array("대표인사말","인사말","법인소개","센터소개","함께하는 사람들","오시는 길")
		boardid_arr		= ""
		Menu01			= "센터안내"
		menu_colr		= "#FFA800"
		table_colr		= "#FFA800"
		td_colr			= "#FFEAC0"
		ste_linecolr	= "#FFF4E0"
		ste_bgcolr		= "#FFFCF8"
	
	Case "sub07" 
		mmenu		= 7
		sCnt		= 3
		Select Case sMenu
			Case "01"
				UrlPage			= "01.html"
				menu02			= "이용안내"	
			Case "02"
				UrlPage			= "03.html"
				menu02			= "이용안내"	
		End Select
		menu_arr		= Array("개인정보보호정책","이메일무단수집거부")
		Menu01			= "이용안내"
		menu_colr		= "#FFA800"
		table_colr		= "#FFA800"
		td_colr			= "#FFEAC0"
		ste_linecolr	= "#FFF4E0"
		ste_bgcolr		= "#FFFCF8"
	
	Case "sub10" '회원가입이 없을때 관리자만 가입가능
		mmenu			= 10		
		sCnt			= 1
		UrlPage			= "01.asp"	
		menu02			= "로그인"
		menu_subtitle 	= ""
		menu_arr		= Array("로그인")
		boardid_arr		= ""
		Menu01			= "MYPAGE"
		menu_colr		= "#FFA800"
		table_colr		= "#FFA800"
		td_colr			= "#FFEAC0"
		ste_linecolr	= "#FFF4E0"
		ste_bgcolr		= "#FFFCF8"	
	Case "sub100" '회원가입이 있을때
		mmenu	= 10
		if MYid = "" then
			sCnt	= 2
			Select Case sMenu
				Case "01"
					UrlPage		= "01.asp"	
					menu02		= "로그인"
				Case "02"
					UrlPage		= "01.asp"
					menu02		= "회원가입"
					mode		= "Join"
					daum_Addr() '회원가입할때 다음 주소찾기 소스 보이게			
			End Select
		else
			sCnt		= 1
			UrlPage		= "01.asp"	
			menu02		= "정보수정"
			mode		= "edit"
			menu_arr	= Array("정보수정")
			daum_Addr() '회원가입할때 다음 주소찾기 소스 보이게
		end if
		boardid_arr		= ""
		menu_subtitle 	= ""
		Menu01			= "LOGIN "
		menu_colr		= "#FFA800"
		table_colr		= "#FFA800"
		td_colr			= "#FFEAC0"
		ste_linecolr	= "#FFF4E0"
		ste_bgcolr		= "#FFFCF8"
End Select%>
