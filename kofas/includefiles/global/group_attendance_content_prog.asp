<!--#include virtual="/LIB/Head_include.asp"-->
<!--#include virtual="/LIB/CharSet_utf.asp"-->
<!-- 데이터베이스에 일정 저장하는 페이지 -->
<%
Call MemberChk(MYID, MyLevel, 12, 12, "admin")

	Mem             = Request.QueryString("Mem")	
    memArr          = split(Mem,"^")
    id				= memArr(0)
	name			= memArr(1)
	group_seq		= Request.QueryString("Group_seq")	
	group_name      = Request.QueryString("group_name")	
    sYear			= Request.QueryString("sYear")
	sMonth			= Request.QueryString("sMonth")
	sDay			= Request.QueryString("sDay")
    attChk          = Request.QueryString("attChk")
    if attChk = "true" then attChk = 1 else attChk = NULL 
	
	'RW(ReQuest.QueryString)
    'response.end 
    set rs=server.createobject("adodb.recordset")
    sql="select * from GROUP_MEMBER_attendance where id = '"&id&"' and group_seq="&group_seq&" and  sYear="&sYear&" and sMOnth="&int(sMonth)
    rs.open sql, Sql_connect(), adopenstatic, adlockpessimistic,adcmdtext		
    If rs.eof then	
        rs.close
        rs.open "GROUP_MEMBER_attendance", Sql_connect(), adopenstatic, adlockpessimistic,adcmdtable
        with rs
            .addnew
            .fields("id")			= id
            .fields("name")			= Name
            .fields("sYear")		= sYear
            .fields("sMonth")		= Int(sMonth)
            .fields(""&int(sDay)&"")		= "1"	
            .fields("group_name")	= group_name
            .fields("group_seq")	= group_seq
            .update
            .close			
            end with
    Else
            rs.close
            sql="select ["&int(sDay)&"] from GROUP_MEMBER_attendance where id = '"&id&"' and group_seq="&group_seq&" and sYear="&sYear&" and sMOnth="&int(sMonth)
            rs.open sql, Sql_connect(), adopenstatic, adlockpessimistic, adcmdtext
			with rs
                .fields(""&int(sDay)&"")			= attChk	
                .update
                .close			
             end with	
    
    End If 
    set rs=Nothing

%>