<!--#include virtual="/includefiles/global/leftMenu_css.asp"-->
<%For i = 0 To ubound(menu_arr)
	If i = CInt(sMenu)-1 Then 
		active 		= "active" 
		acLabel		= "<i class=""el el-chevron-right f-right mgt5 mgr10""></i>"	
	Else 
		active 		= ""
		acLabel		= "<i class=""el el-chevron-right f-right  mgt5 mgr10""></i>"
	end if
	If i < 10 Then s_menu = "0"&i+1 Else s_menu = i + 1	
	If isArray(boardid_arr) Then
		select case st	
			case "sub05"
				if i = 3 then 
					RW("<a href=""/contents/?st="&st&"&sMenu="&s_menu&""" class=""_list-group-item "&active& " title"" >  "&menu_arr(i)& acLabel &"</a>")
				else
					RW("<a href=""/board/?boardid="&boardid_arr(i)&""" class=""_list-group-item "&active& " title"" >  "&menu_arr(i) & acLabel &" </a>")
				end if
			case else	
				RW("<a href=""/board/?boardid="&boardid_arr(i)&""" class=""_list-group-item "&active& " title"" >  "&menu_arr(i) & acLabel &"</a>")
		end select 
	Else
		RW("<a href=""/contents/?st="&st&"&sMenu="&s_menu&""" class=""_list-group-item "&active& " title"" >  "&menu_arr(i)& acLabel &"</a>")
	end if
Next%>