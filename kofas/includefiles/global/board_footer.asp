					</div>
			</div>
<!--main body end-->
<script>
	<%if UrlPage <> "" then%>
		var setUrl			= "/contents/<%=st%>/<%=UrlPage%>";
		var setParam		= "<%=QUERYSTRING%>";
		$.ajax({
			type : "post",
			async : false,
			url : setUrl,
			data : setParam,
			success : function(args) {
				$("#body-cont").html(args);
			},
			error : function(result) {
				$("#body-cont").html(result);
			}
		});
		docTitle("<%=menu02%>");
	<%end if%>
AOS.init();
</script>
<!--#include virtual="/includefiles/global/_footer.asp"-->