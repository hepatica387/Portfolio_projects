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
	Params			= Request.QueryString
Select Case st
	Case "sub01"
		'sdiv = "#nav-01" '메뉴 ID
		menu1_subject			= "기관소개"
		arr_Menu_1depth			= Array("법인소개","월계복지관 소개","미션 & 비전 & CI","운영 / 자문위원","인사말","연혁","온라인 기관 내방","조직 및 인력","오시는 길")
		arr_m_icon				= Array("fa-university","fa-building-o","fa-user-plus","fa-users","fa-handshake-o","fa-hourglass-half","fa-desktop","fa-sitemap","fa-map-o")
		subTITLE				= ""
		subvisual_text			= ""
		Select Case sMenu
			Case "01"
				UrlPage			= "01.html"
				mTITLE			= "법인소개"
				m_text			= ""
			Case "02"
				UrlPage			= "02.html"
				mTITLE			= "월계복지관 소개"
				m_text			= ""
			Case "03"
				UrlPage			= "03.html"
				mTITLE			= "미션 & 비젼 & CI"
				m_text			= ""
			Case "04"
				UrlPage			= "04.html"
				mTITLE			= "운영/자문위원"
				m_text			= ""
			Case "05"
				UrlPage			= "05.html"
				mTITLE			= "인사말"
				m_text			= ""
			Case "06"
				UrlPage			= "06.html"
				mTITLE			= "연혁"
				m_text			= ""
			Case "07"
				UrlPage			= "07.html"
				mTITLE			= "온라인 기관 내방"
				m_text			= ""
			Case "08"
				UrlPage			= "08.html"
				mTITLE			= "조직 및 인력"
				m_text			= ""
			Case "09"
				UrlPage			= "09.html"
				mTITLE			= "오시는 길"
				m_text			= ""
		End Select
		boardid_arr			= ""
		menu_colr			= "#fc873c"
		table_colr			= "#FFAE35"
		td_colr				= "#FFD69A"
		ste_linecolr		= "#FFEACC"
		ste_bgcolr			= "#FFF7EC"
	Case "sub02"
		menu1_subject			= "월계뉴스"
		arr_Menu_1depth			= Array("공지사항","나눔글","후원지출내역","소식지","채용정보","월계 갤러리","유튜브","월계뉴스","고객의 소리")
		arr_m_icon				= Array("fa-newspaper-o","fa-leaf","fa-truck","fa-file-pdf-o","fa-id-badge","fa-picture-o","fa-youtube","fa-file-audio-o","fa-users")
		subTITLE		= ""
		subvisual_text	= ""
		Select Case sMenu
			Case "01"
				UrlPage			= ""
				mTITLE			= "공지사항"
				m_text			= ""
			Case "02"
				UrlPage			= ""
				mTITLE			= "나눔글"
				m_text			= ""
			Case "03"
				UrlPage			= ""
				mTITLE			= "후원지출내역"
				m_text			= ""
			Case "04"
				UrlPage			= ""
				mTITLE			= "소식지"
				m_text			= ""
			Case "05"
				UrlPage			= ""
				mTITLE			= "채용정보"
				m_text			= ""
			Case "06"
				UrlPage			= ""
				mTITLE			= "월계 갤러리"
				m_text			= ""
			Case "07"
				UrlPage			= ""
				mTITLE			= "유튜브"
				m_text			= ""
			Case "08"
				UrlPage			= ""
				mTITLE			= "월계뉴스"
				m_text			= ""
			Case "09"
				UrlPage			= ""
				mTITLE			= "고객의 소리"
				m_text			= ""
		End Select
		boardid_arr			= Array("wwc_notice","support_board","support02","wwc_note","recruit","wwc_photo01","youtube","wwc_pds01","wwc_QnA")
		menu_colr			= "#00a854"
		table_colr			= "#C5E5DA"
		td_colr				= "#E2F2EC"
		ste_linecolr 		= "#F0F8F6"
		ste_bgcolr			= "#F4FAF8"

	Case "sub03"
		menu1_subject			= "후원/자원봉사"
		arr_Menu_1depth			= Array("후원","후원신청","자원봉사")
		arr_m_icon				= Array("fa-gift","fa-envelope-open-o","fa-heartbeat")
		subTITLE				= ""
		subvisual_text			= ""
		Select Case sMenu
			Case "01"
				UrlPage 		= "01.html"
				mTITLE			= "후원"
				m_text			= ""
			Case "02"
				UrlPage 		= "02.html"
				mTITLE			= "후원신청"
				m_text			= ""
			Case "03"
				UrlPage 		= "03.html"
				mTITLE			= "자원봉사"
				m_text			= ""
			Case "04"
				UrlPage 		= ""
				mTITLE			= ""
				m_text			= ""
		End Select
		boardid_arr			= ""
		menu_colr			= "#59a8df"
		table_colr			= "#6DB0F4"
		td_colr				= "#B6D8FA"
		ste_linecolr		= "#DAECFC"
		ste_bgcolr			= "#F1F8FE"

	Case "sub04"
		menu1_subject			= "사업소개"
		arr_Menu_1depth			= Array("사업별","대상별")
		arr_Menu21_Depth		= Array("복지서비스 1팀","복지서비스 2팀","지역사회 조직","사례관리 사업","교육문화 사업","기관운영 사업","부설 월계지역아동센터")
		arr_Menu21_Code			= Array("01","02","03","04","05","06","07")
		arr_Menu22_Depth		= Array("아동청소년","성인","어르신","장애인")
		arr_Menu22_Code			= Array("11","12","13","14")
		subvisual_text			= ""
		arr_m_icon_d1			= Array("","")
		arr_m_icon_d2			= Array("","")
		arr_m_icon				= Array("","")
		Select Case sMenu
			Case "01"
				UrlPage 		= ""
				mTITLE			= ""
				m_text			= ""
		End Select
		boardid_arr			= ""
		menu_colr			= "#59a8df"
		table_colr			= "#6DB0F4"
		td_colr				= "#B6D8FA"
		ste_linecolr		= "#DAECFC"
		ste_bgcolr			= "#F1F8FE"

	Case "sub05"
		menu1_subject			= "상담신청"
		arr_Menu_1depth			= Array("발달지원센터","전문상담","유무료교육","이혼상담", "시설대관", "기관내방")
		arr_m_icon				= Array("fa-american-sign-language-interpreting","fa-volume-control-phone","fa-pencil-square-o","fa-phone", "fa-sign-in", "fa-street-view")
		subTITLE				= ""
		subvisual_text			= ""
		Select Case sMenu
			Case "01"
				UrlPage 		= "01.asp"
				mTITLE			= "발달지원센터"
				m_text			= ""
				Params			= Params & ""
			Case "02"
				UrlPage 		= "01.asp"
				mTITLE			= "전문상담"
				m_text			= ""
				Params			= Params & ""
			Case "03"
				UrlPage 		= "01.asp"
				mTITLE			= "유무료교육"
				m_text			= ""
				Params			= Params & ""
			Case "04"
				UrlPage 		= "01.asp"
				mTITLE			= "이혼상담"
				m_text			= ""
				Params			= Params & ""
			Case "05"
				UrlPage 		= "02.asp"
				mTITLE			= "시설대관"
				m_text			= ""
			Case "06"
				UrlPage 		= "03.asp"
				mTITLE			= "기관내방"
				m_text			= ""
		End Select
		boardid_arr			= ""
		menu_colr			= "#59a8df"
		table_colr			= "#6DB0F4"
		td_colr				= "#B6D8FA"
		ste_linecolr		= "#DAECFC"
		ste_bgcolr			= "#F1F8FE"
	Case "sub06","sub07"
		If st = "sub06" Then
			boardid_arr = "mento_notice,bravo_board"
			boardid_arr			= Array("mento_notice","bravo_board")
			If Request.cookies("member")("memGubun") = "브라보실버" then
				UrlPage = "05.asp"
				menu02 = "정보수정"
			Else
				UrlPage = "04.asp"
				menu02 = "회원가입"
			End If
			menu1_subject			= "브라보실버"

			subTITLE				= ""
			subvisual_text			= ""


		Else
			boardid_arr			= Array("youth_notice","group_board")
			If Request.cookies("member")("memGubun") = "청소년 조직" then
				UrlPage = "05.asp"
				menu02 = "정보수정"
			Else
				UrlPage = "04.asp"
				menu02 = "회원가입"
			End If
			menu1_subject			= "청소년 조직화"

		End If
		arr_Menu_1depth			= Array("공지사항","Q&A 게시판","활동보고서",menu02)
		arr_m_icon				= Array("fa-volume-down","fa-question-circle-o","fa-pencil","fa-user-circle-o")

		Select Case sMenu
			Case "01"
				UrlPage = ""
				menu02 = "공지사항"
			Case "02"
				UrlPage = ""
				menu02 = "Q&A 게시판"
			Case "03"
				UrlPage = "03.asp"
				menu02 = "활동보고서"
			Case "04"
				UrlPage = "01.asp"
				menu02 = menu02
		End Select


	Case "sub08"
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
		menu1_subject			= "MEMBER"
		mTITLE			= "회원가입"


		subTITLE				= ""
		subvisual_text			= ""

		if MYid = "" Then
			arr_Menu_1depth			= Array("로그인","회원가입")
			arr_m_icon				= Array("fa-power-off","fa-laptop")
			Select Case sMenu
				Case "01"
					UrlPage		= "01.asp"
					menu02		= "로그인"
					mTITLE			= "로그인"
				Case "02"
					UrlPage		= "02.asp"
					menu02		= "회원가입"
					mode		= "Join"
					'daum_Addr() '회원가입할때 다음 주소찾기 소스 보이게
			End Select
		Else
			arr_Menu_1depth			= Array("정보수정","로그아웃")
			arr_m_icon				= Array("","")
			UrlPage		= "03.asp"
			menu02		= "정보수정"
			mode		= "edit"
			menu_arr	= Array("정보수정")
			'daum_Addr() '회원가입할때 다음 주소찾기 소스 보이게
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
<script>
	//alert($(window).width());
$(document).ready(function(){
	<%if UrlPage <> "" then%>
			var setUrl			= "/contents/<%=st%>/<%=UrlPage%>";
			var setParam		= "<%=Params%>";
			$.ajax({
				type : "get",
				async: false,
				url : setUrl,
				data : setParam,
				success : function(args) {
					$("#body-cont").html(args);
				},
				error : function(result) {
					$("#body-cont").html(result);
				}
			});
			docTitle("<%=mTITLE%>");
		<%end if%>
	//$('.lazy').lazy();
	AOS.init();
	});

</script>
