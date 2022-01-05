if (parent.$.cookie('zoom') == "y"){ zoomcookie();}
/*======================================================
    화면 확대/축소
======================================================*/

 //화면 키운다.
 function zoomcookie() {     
	 var ie=false;
     parent.$("body").css("zoom","1.2"); 
	 parent.$("body").css("-webkit-transform","scale(1.2)");
	 parent.$("body").css("-webkit-transform-origin","0 0");
	 parent.$("body").css("-moz-transform","scale(1.2)");
	 parent.$("body").css("-moz-transform-origin","0 0");
	 parent.$("body").css("-o-transform","scale(1.2)");
	 parent.$("body").css("-o-transform-origin","0 0");

	if($.browser.msie){ie=true}
	if (ie == false){$("body").css("zoom","1.2") }
	 return false;
 }

 //화면 키운다.
 function zoomIn() {     
	 var ie=false;
     parent.$("body").css("zoom","1.2"); 
	 parent.$("body").css("-webkit-transform","scale(1.2)");
	 parent.$("body").css("-webkit-transform-origin","0 0");
	 parent.$("body").css("-moz-transform","scale(1.2)");
	 parent.$("body").css("-moz-transform-origin","0 0");
	 parent.$("body").css("-o-transform","scale(1.2)");
	 parent.$("body").css("-o-transform-origin","0 0");

	if($.browser.msie){ie=true}
	if (ie == false){$("body").css("zoom","1.2") }
	else{
		 parent.$(".menu_bg").css("background","")
		 parent.$(".twt_bg").css("background","")
		 var tw_left = parseInt(parent.$("#twt").css("left")); 
		 var param={'left':(tw_left)+258+'px'};
		 parent.$("#twt").css(param);
		 parent.$("#siteMap").css("left","245");
		 parent.$("#TOP").hide;
	}
	 return false;
 }
 
//화면 원래대로 
function zoomDefault() { 		
	 var ie=false;
     parent.$("body").css("zoom","1");
	 parent.$("body").css("-webkit-transform","scale(1)");
	 parent.$("body").css("-webkit-transform-origin","0 0");
	 parent.$("body").css("-moz-transform","scale(1)");
	 parent.$("body").css("-moz-transform-origin","0 0");
	 parent.$("body").css("-o-transform","scale(1)");
	 parent.$("body").css("-o-transform-origin","0 0");
	 if($.browser.msie){ie=true}
	if (ie == false){$("body").css("zoom","1") }
	else {
		 parent.$(".menu_bg").css("background","/images/main/left_bg.png no-repeat")
		 parent.$(".twt_bg").css("background","/images/main/right_bg.png no-repeat")
		 var tw_left = parseInt(parent.$("#twt").css("left")); 
		 var param={'left':(tw_left)-258+'px'};
		 parent.$("#twt").css(param);
		 parent.$("#siteMap").css("left","151");
		 parent.$("#TOP").show();
	}
	return false;
} 