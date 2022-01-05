<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<%
gubun       = Request.queryString("gubun")
mode       = Request.queryString("mode")
if mode = "" then mode  = "login"
if MYID <> "" then mode = "join"
if mode = "" or mode = "login" then
    strTitle        = "Login"
    str_subTitle    = "로그인 안내 페이지입니다."
elseif mode = "join" then
    strTitle        = "Registration"
    str_subTitle    = "회원가입을 하시면 다양한 혜택을 누리실 수 있습니다."
elseif mode = "idpw_find_result" then
    strTitle        = gubun  & " Find"
   str_subTitle    = " 찾을 이름(아이디)과 이메일로 검색합니다."
end if%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>MYPAGE</title>
 </head>
 <body>
 <div id="sub_content" class="sub10">
    <div class="cont02">01_<%=mode%>.asp?mode=<%=mode%></div>
 </div>
 </body>
</html>
<script type="text/javascript">
   $(".sub10 .cont02").load("sub10/01_<%=mode%>.asp?mode=<%=mode%>&gubun=<%=gubun%>")
</script>
