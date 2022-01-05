<!--#include file='../../LIB/_headInclude.asp'-->
<!--#include virtual="/includefiles/func/function.auth.asp"-->
<!--#include virtual="/LIB/injection_chk.asp"-->
<!--#include virtual="/LIB/pagefind.asp"-->
<%
arng		= Request("arng")
If arng = "" Then arng = "list"
 Select Case arng
	Case "view"
		menuTitle	= "주문정보"
	Case Else
		menuTitle	= "주문목록"
End Select
%>
<section id="sub_content" class="sub10">
    <div class="cont01 apply_table">
		 <div class="login-title black">
			<h2><%=menuTitle%></h2>
		  </div>
	<%
	 Select Case arng
			Case "list"%>
				<!--#include file='apply_list.asp'-->
		  <%Case  "view"%>
				<!--#include file='apply_view.asp'-->
	<%End select%>
	</div>
</section>
<script>
	function product_view(seq){
		var setUrl			= "/contents/sub100/product_apply.asp";
		if (seq != ""){
			setParam		= "seq="+seq+"&arng=view&<%=setParams%>";
		} else {
			setParam		= "<%=setParams%>";
		}
		$.ajax({
			type : "post",
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
	}
</script>
