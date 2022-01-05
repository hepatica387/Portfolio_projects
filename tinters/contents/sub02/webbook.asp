<%
pageCnt		= Request("pageCnt")
Webbook		= Request("Webbook")
%>
<!--#include virtual="/includefiles/global/global_head.asp"-->
<script type="text/javascript" src="/includefiles/js/turn.min.js"></script>


<style type="text/css">
#SOSIC_BOOK{
	background:#ccc;
}
#magazine{
	margin:auto;
}
#magazine .turn-page{
	background-color:#ccc;
	background-size:100% 100%;
}

.foot {width:97%;background:#FFF;height:50px;margin:auto;}
</style>
</head>
<body>

<div id="magazine" >
	<%For i = 1 To pageCnt %>
		<div class="webImg" style="background-image:url('/datafiles/WEBBOOK/<%=Webbook%>/<%=i%>.jpg');"></div>
	<%next%>
</div>
<div class="foot center alert bg-success">
	<a href="javascript:;" onclick="$('#magazine').turn('previous');" class="btn btn-default "><i class="fa fa-angle-double-left  title2"></i> 이전</a> <span class="hidden-xs" style="margin:0 10px">※ 좌우 화살표키로 페이지 이동</span> <a href="javascript:;" onclick="$('#magazine').turn('next');" class="btn btn-default " >다음 <i class="fa fa-angle-double-right title2"></i></a>
	<a href="javascript:window.close();" class="f-right mgt5 btn btn-success  " style="color:#FFF">창닫기</a>
</div>

<script type="text/javascript">
	window.resizeTo( $(window).width(), ($(window).width() * 1.4) + 100 );
	var wWID	= $(window).width()-20;
	var wHID	= wWID*1.4;
	$(window).ready(function() {
		$('#magazine').width(wWID).height(wHID).turn({
			display: 'single',
			acceleration: true,
			gradients: !$.isTouch,
			elevation:50,
			when: {
				turned: function(e, page) {
					console.log('Current view: ', $(this).turn('view'));
				}
			}
		});




	});


	$(window).bind('keydown', function(e){
		if (e.keyCode==37)
			$('#magazine').turn('previous');
		else if (e.keyCode==39)
			$('#magazine').turn('next');

	});

</script>

</body>
</html>
