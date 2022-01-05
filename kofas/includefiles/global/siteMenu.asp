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
	return_page	= ""

	arr_Menu_depth	=  Array("코파스 소개","코파스 볼트","코파스 F.A 부품","기술현황","고객지원")
	arr_menu_link	=  Array("/sub01/01","/productK/","/productM/","/sub03/01","/board/?boardid=notice")



Select Case st
	Case "sub01"
		'sdiv = "#nav-01" '메뉴 ID
		menu1_subject			= "코파스 소개"
		menu1_TITLE				= "COMPANY"
		m_text					= "세계 속의 KOFAS! 이제 더 큰 목표를 위해 새롭게 도약합니다."
		arr_Menu_1depth			= Array("기업개요","인사말","연혁","비전 & 미션","조직도","사업영역","사업장안내","주요거래처")
		arr_menu_link_1depth	=  Array("/sub01/01","/sub01/02","/sub01/03","/sub01/04","/sub01/05","/sub01/06","/sub01/07","/sub01/08")
		arr_m_icon				= Array("fa-university","fa-building-o","fa-user-plus","fa-users","fa-handshake-o","fa-hourglass-half","fa-desktop","fa-sitemap")
		subTITLE				= ""
		subvisual_text			= ""
		Select Case sMenu
			Case "01"
				UrlPage			= "01.html"
				mTITLE			= "코파스 소개"
				'm_text			= "세계 속의 KOFAS! 이제 더 큰 목표를 위해 새롭게 도약합니다."
			Case "02"
				UrlPage			= "02.html"
				mTITLE			= "인사말"
				'm_text			= ""
			Case "03"
				UrlPage			= "03.html"
				mTITLE			= "연혁"
				'm_text			= ""
			Case "04"
				UrlPage			= "04.html"
				mTITLE			= "비전 & 미션"
				'm_text			= ""
			Case "05"
				UrlPage			= "05.html"
				mTITLE			= "조직도"
				'm_text			= ""
			Case "06"
				UrlPage			= "06.html"
				mTITLE			= "사업장안내"
				'm_text			= ""
			Case "07"
				UrlPage			= "07.html"
				mTITLE			= "온라인 기관 내방"
				'm_text			= ""
			Case "08"
				UrlPage			= "08.html"
				mTITLE			= "조직 및 인력"
				'm_text			= ""
			Case "09"
				UrlPage			= "09.html"
				mTITLE			= "오시는 길"
				'm_text			= ""
		End Select
		boardid_arr			= ""
		menu_colr			= "#fc873c"
		table_colr			= "#FFAE35"
		td_colr				= "#FFD69A"
		ste_linecolr		= "#FFEACC"
		ste_bgcolr			= "#FFF7EC"

	Case "productM"


		'boardid_arr			= Array("wwc_notice","support_board","support02","wwc_note","recruit","wwc_photo01","youtube","wwc_pds01","wwc_QnA")
		boardid_arr			= ""
		menu_colr			= "#00a854"
		table_colr			= "#C5E5DA"
		td_colr				= "#E2F2EC"
		ste_linecolr 		= "#F0F8F6"
		ste_bgcolr			= "#F4FAF8"

	Case "productK"
		menu1_subject			= "코파스 몰"
		menu1_TITLE				= "KOFAS MALL"

		boardid_arr			= ""
		menu_colr			= "#59a8df"
		table_colr			= "#6DB0F4"
		td_colr				= "#B6D8FA"
		ste_linecolr		= "#DAECFC"
		ste_bgcolr			= "#F1F8FE"

	Case "sub03"
		menu1_subject			= "기술현황"
		menu1_TITLE				= "TECHNOLOGY"
		m_text					= "KOFAS는 최상의 제품 생산 및 관리로 HIGH QUALITY 제품을 공급하고 있습니다."

		arr_Menu_1depth			= Array("코파스볼트 특징","생산규격","정밀가공사업부","연구개발 및 품질관리","품질관리 설비 보유현황","인증현황")
		arr_menu_link_1depth	=  Array("/sub03/01","/sub03/02","/sub03/03","/sub03/04","","")
		arr_m_icon				= Array("fa-gift","fa-envelope-open-o","fa-gift","fa-heartbeat")
		subTITLE				= ""
		subvisual_text			= ""
		Select Case sMenu
			Case "01"
				UrlPage 		= "01.html"
				mTITLE			= "코파스볼트 특징"
'				m_text			= ""
			Case "02"
				UrlPage 		= "02.html"
				mTITLE			= "생산규격"
'				m_text			= ""
			Case "04"
				UrlPage 		= "03.html"
				mTITLE			= "연구개발 및 품질관리"
'				m_text			= ""
			Case "03"
				UrlPage 		= "04.html"
				mTITLE			= "정밀가공사업부"
'				m_text			= ""
			Case "05"
				UrlPage 		= ""
				mTITLE			= "품질관리 설비 보유현황"
'				m_text			= ""
			Case "06"
				UrlPage 		= ""
				mTITLE			= "인증현황"
'				m_text			= ""
		End Select
		boardid_arr			= Array("","","","","machine","auth")
		menu_colr			= "#59a8df"
		table_colr			= "#6DB0F4"
		td_colr				= "#B6D8FA"
		ste_linecolr		= "#DAECFC"
		ste_bgcolr			= "#F1F8FE"
	Case "sub04"
		menu1_subject			= "고객지원"
		menu1_TITLE				= "TECHNOLOGY"
		m_text					= "KOFAS는 최상의 제품 생산 및 관리로 HIGH QUALITY 제품을 공급하고 있습니다."
		arr_Menu_1depth			= Array("뉴스/공지","갤러리","홍보자료","고객문의")
		arr_menu_link_1depth	=  Array("","","/sub04/03","")
		subvisual_text			= ""
		arr_m_icon_d1			= Array("fa-linode","fa-heart","fa-sign-in","fa-object-group","fa-building","fa-columns")
		arr_m_icon				= Array("","")
		Select Case sMenu
			Case "03"
				UrlPage 		= "01.html"
				mTITLE			= "홍보자료"
				m_text			= ""
				menu1_subject	= arr_Menu_1depth(0) & " "&  menu1_subject
			Case "04"
				UrlPage 		= ""
				mTITLE			= "고객문의"
				m_text			= ""
				menu1_subject	= arr_Menu_1depth(1) & " "& menu1_subject
			Case "05"
				UrlPage 		= ""
				mTITLE			= "부서별 사업"
				m_text			= ""
				menu1_subject	= arr_Menu_1depth(2) & " "&  menu1_subject
		End Select
		boardid_arr			= Array("notice","gall","","qna_bbs")
		menu_colr			= "#59a8df"
		table_colr			= "#6DB0F4"
		td_colr				= "#B6D8FA"
		ste_linecolr		= "#DAECFC"
		ste_bgcolr			= "#F1F8FE"

	Case "sub05"
		menu1_subject			= "고객지원"
		arr_Menu_1depth			= Array("발달지원센터","전문상담","유무료교육","이혼상담", "시설대관", "기관내방")
		arr_m_icon				= Array("fa-american-sign-language-interpreting","fa-volume-control-phone","fa-pencil-square-o","fa-phone", "fa-sign-in", "fa-street-view")
		subTITLE				= ""
		subvisual_text			= ""
		Select Case sMenu
			Case "01"
				UrlPage 		= "01.asp"
				mTITLE			= "발달지원센터"
				m_text			= ""
				Params			= "program_code=101&sinCode=201&"&Params
			Case "02"
				UrlPage 		= "01.asp"
				mTITLE			= "전문상담"
				m_text			= ""
				Params			= "program_code=102&sinCode=201&"&Params
			Case "03"
				UrlPage 		= "01.asp"
				mTITLE			= "유무료교육"
				m_text			= ""
				Params			= "program_code=103&sinCode=201&"&Params
			Case "04"
				UrlPage 		= "01.asp"
				mTITLE			= "이혼상담"
				m_text			= ""
				Params			= "program_code=104&sinCode=201&"&Params
			Case "05"
				UrlPage 		= "02.asp"
				mTITLE			= "시설대관"
				m_text			= ""
				Params			= "sinCode=202&"&Params
			Case "06"
				UrlPage 		= "03.asp"
				mTITLE			= "기관내방"
				m_text			= ""
				Params			= "sinCode=203&"&Params
		End Select
		boardid_arr			= ""
		menu_colr			= "#59a8df"
		table_colr			= "#6DB0F4"
		td_colr				= "#B6D8FA"
		ste_linecolr		= "#DAECFC"
		ste_bgcolr			= "#F1F8FE"
		daum_Addr() '회원가입할때 다음 주소찾기 소스 보이게
	Case "sub06","sub07"
		If st = "sub06" Then

			menu1_subject			= "브라보실버"
			subTITLE				= ""
			subvisual_text			= ""
			If (MYDEPART = "silver" And MYID <> "" ) Or (MYID <> "" And MYLEVEL < 9) Then
				boardid_arr			= Array("mento_notice","bravo_board","","")
				UrlPage		= "05.asp"
				m_icon		= "fa-edit"

				Select Case sMenu
					Case "01"
						UrlPage		= ""
						mTITLE		= "공지사항"
					Case "02"
						UrlPage		= ""
						mTITLE		= "Q&A 게시판"
					Case "03"
						UrlPage		= ""
						mTITLE		= "활동보고서"
						return_page	= "/contents/sub06/?act=Y&"&Params
					Case "04"
						UrlPage		= "01.asp"
						mTITLE		= "회원 정보수정"
				End Select
				arr_Menu_1depth			= Array("공지사항","Q&A 게시판","활동보고서","회원 정보수정")
				arr_m_icon				= Array("fa-volume-down","fa-question-circle-o","fa-pencil",m_icon)
			Else
				UrlPage					= "01.asp"
				mTITLE					= "회원가입"
				m_icon					= "fa-user-circle-o"
				arr_Menu_1depth			= Array("회원가입")
				arr_m_icon				= Array("fa-user-circle-o")
			End If
		Else
			menu1_subject				= "청소년 조직화"
			If (MYDEPART = "youth"  And MYID <> "")  Or (MYID <> "" And MYLEVEL < 9) Then
				boardid_arr				= Array("youth_notice","group_board","","")
				UrlPage					= "05.asp"
				mTITLE					= "정보수정"
				m_icon					= "fa-edit"
				Select Case sMenu
					Case "01"
						UrlPage		= ""
						mTITLE		= "공지사항"
					Case "02"
						UrlPage		= ""
						mTITLE		= "Q&A 게시판"
					Case "03"
						UrlPage		= ""
						mTITLE		= "활동보고서"
						return_page	= "/contents/sub07/?act=Y&"&Params
					Case "04"
						UrlPage		= "01.asp"
						mTITLE		= "회원 정보수정"
				End Select
				arr_Menu_1depth			= Array("공지사항","Q&A 게시판","활동보고서","회원 정보수정")
				arr_m_icon				= Array("fa-volume-down","fa-question-circle-o","fa-pencil",m_icon)
			Else
				UrlPage					= "01.asp"
				mTITLE					= "회원가입"
				m_icon					= "fa-user-circle-o"
				arr_Menu_1depth			= Array("회원가입")
				arr_m_icon				= Array("fa-user-circle-o")
			End If
		End If


		If MYDEPART = ""  Then
			Select Case sMenu
				Case "01"
					UrlPage = "01.asp"
					mTITLE = mTITLE
			End Select
		End If

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
		mmenu				= 10
		sCnt				= 1
		UrlPage				= "01.asp"
		menu02				= "로그인"
		menu_subtitle 		= ""
		menu_arr			= Array("로그인")
		boardid_arr			= ""
		Menu01				= "MYPAGE"
		menu_colr			= "#FFA800"
		table_colr			= "#FFA800"
		td_colr				= "#FFEAC0"
		ste_linecolr		= "#FFF4E0"
		ste_bgcolr			= "#FFFCF8"

	Case "sub100" '회원가입이 있을때
		menu1_subject		= "MYPAGE"
		mTITLE				= "회원가입"
		subTITLE			= ""
		subvisual_text		= ""

		if MYid = "" Then
			arr_Menu_1depth			= Array("로그인","회원가입")
			arr_menu_link_1depth	=  Array("/sub100/01","/sub100/02")
			arr_m_icon				= Array("fa-sign-in","fa-laptop")
			Select Case sMenu
				Case "01"
					UrlPage		= "01.asp"
					menu02		= "로그인"
					mTITLE		= "로그인"
				Case "02"
					UrlPage		= "02.asp"
					menu02		= "회원가입"
					mode		= "Join"
					Call daum_ZipAddr() '회원가입할때 다음 주소찾기 소스 보이게
			End Select
		Else
'			arr_m_icon				= Array("fa-edit","fa-sign-out")
			arr_Menu_1depth			= Array("주문목록", "정보수정","회원탈퇴")
			arr_menu_link_1depth	=  Array("/sub100/01","/sub100/02","/sub100/03")
			'arr_m_icon				= Array("fa-edit")
			UrlPage		= "03.asp"
			menu02		= "정보수정"
			mode		= "edit"
			menu_arr	= Array("정보수정")
			Select Case sMenu
				Case "01"
					UrlPage			= "product_apply.asp"
					mTITLE			= "주문목록"
				Case "02"
					UrlPage			= "02.asp"
					mTITLE			= "회원정보수정"
				Case "03"
					UrlPage			= "10.asp"
					mTITLE			= "회원탈퇴"
					'return_page	= "/includefiles/global/logout.asp"
					'daum_Addr() '회원가입할때 다음 주소찾기 소스 보이게
			End Select
			Call daum_ZipAddr() '회원가입할때 다음 주소찾기 소스 보이게
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
$(document).ready(function($){
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
<%elseif return_page <> "" and act = "" then%>
location.href = "<%=return_page%>"
<%end if%>

	$('.lazy').lazy();
		AOS.init({
			easing: 'ease-out-back',
			duration: 1000
		});
	});

</script>
