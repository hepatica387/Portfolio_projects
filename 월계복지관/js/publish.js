function wrapWindowByMask(){
	//화면의 높이와 너비를 구한다.
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();
	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	$('#mask').show().css({'width':maskWidth,'height':maskHeight,'z-index':1010});  
    //마스크의 투명도 처리
    $('#mask').fadeTo("slow",0.85);  		  
}
	
// 팝업 , 불투명 배경 띄우기
function markin(){		
	wrapWindowByMask();
}	

function markexit(){$('#mask').hide();}

// 이란 페이지에서 jquery.loadpage
function divLoad_page(v1, Url){	
	$(v1).load(url);
}

function ifrm_apen(div_name, target_name, url){
	$("#"+target_name).remove();
	$("body").append("<IFRAME style='display:none' src='"+url+"' name='" + target_name + "' id='"+target_name+"'></IFRAME>" )	
}

function ifrm_form(target_name){
	$("#"+target_name).remove();
	$("body").append("<IFRAME style='display:none' name='" + target_name + "' id='"+target_name+"' ></IFRAME>" );
}



// 메세지 길이를 검사함
function checkBytes(x,num)
{
	var bytesLimit = num;
	var msgVal = x.value;
	var bytesLen = 0;
	var curMsgLen = '';
	var curBytesLen = 0;
	var realVal = '';
	var realLen = 0;

	for(var i = 0; i < msgVal.length; i++)
	{
		var oneChar = msgVal.charAt(i);

		if ( escape(oneChar).length > 4 )
			bytesLen += 2;
		else if ( oneChar != '\r' || oneChar != '\n' )
			bytesLen++;

		if ( bytesLen <= bytesLimit ) {
			curMsgLen = i + 1;
			curBytesLen = bytesLen;
		}
	}

	if ( bytesLen > bytesLimit )
	{
		alert(bytesLimit + "bytes 이상의 문자는 입력이 불가능합니다.");
		x.value = msgVal.substr(0, curMsgLen);		// 초과 입력시 초과된 만큼 잘라줌
		realLen = curBytesLen;
		x.focus();
	}
	
	else
		realLen = bytesLen;
	
}

function printWindow(header,footer) {	
	$("body").css('font-size','12px');
	$("#noPrint").hide();
	factory.printing.header = header;
	factory.printing.footer = footer;
	factory.printing.portrait = true
	factory.printing.leftMargin = 10.0
	factory.printing.topMargin = 10.0
	factory.printing.rightMargin = 10.0
	factory.printing.bottomMargin = 10.0
	//factory.printing.SetMarginMeasure(1); 
   //factory.printing.printBackground = true  //배경 및 이미지 인쇄

	factory.printing.Print(true, window);
	$("#noPrint").show();
	$("body").css('font-size','14px');}

function print_window(){
	$(".noPrint").hide();
	$("*").css('font-size','18px');
	window.print();
	$(".noPrint").show();
	$("*").css('font-size','14px');
}

function check_device(){
       var uAgent = navigator.userAgent.toLowerCase();
	var mobileKeyWords = new Array('ipad', 'iphone', 'ipod', 'blackBerry', 'android', 'windows ce', 'lg', 'mot', 'samsung', 'sonyericsson','iemobile');
    var device_name = '';
	for (var i = 0;i < mobileKeyWords.length;  i++) {		
		if (uAgent.indexOf(mobileKeyWords[i]) != -1){
			device_name = mobileKeyWords[i];
			break;
		}	
	}
  return device_name; 
}


function setClipBoard(str)
{
	var g4_is_gecko  = navigator.userAgent.toLowerCase().indexOf("gecko") != -1;
	var g4_is_ie     = navigator.userAgent.toLowerCase().indexOf("msie") != -1;
	if (g4_is_gecko)
        prompt("이 글의 URL 복사되었습니다. 주소창에 붙여넣기를 하면 됩니다." , str);
    else if (g4_is_ie) {
        window.clipboardData.setData("Text", str);
        alert("이 글의 URL 복사되었습니다. 주소창에 붙여넣기를 하면 됩니다.");
    }

}

/*======================================================
	// 멘위로 이동 
======================================================*/

function topmove(){parent.$('html, body').animate({scrollTop:0}, 'slow');}


/*======================================================
	// 페이지 크기 조정
======================================================*/
function FrmResize(){
	var resizeFrameName = $js.request.get("n");
	var resizeHeight = $js.request.get("h");
	var contentsFrame = null;
	try {
		contentsFrame = top.$("iframe").attr("name");
	} catch(e) {
		try {
			contentsFrame = top.document.getElementById(resizeFrameName);
		} catch(e2) {
			contentsFrame = null;
		}
	}
	if (contentsFrame!=null&&Math.isInt(resizeHeight)) {
		contentsFrame.style.height = resizeHeight+"px";
		try {
			top.$(top.window).trigger("iframeResize");
		} catch(e) { }
	}	
}

// 숫자에 컴마 찍기
function number_format(num){
    var num_str = num.toString().replace(/,/gi,"");
    var result = "";
    for(var i=0; i<num_str.length; i++){
        var tmp = num_str.length - (i+1);
		if(((i%3)==0) && (i!=0))    result = ',' + result;
        result = num_str.charAt(tmp) + result;
    }
    return result;
}

// 숫자 컴마 지우기
function Int_parse(v1) {   
 var num_str = v1.toString().replace(/,/gi,"");
 var  result =  parseInt(num_str);
 return result;
}

// 일정입력뒤에 다음으로 전환
function moveNext( obj, num ) {
	val = event.srcElement.value;
	if( val.length == num ) obj.focus();
}

function getCookie( name ) {
  var arg = name + "=";
  var alen = arg.length;
  var clen = document.cookie.length;
  var i = 0;

  while( i < clen ) {
	  var j = i + alen;

	  if( document.cookie.substring(i,j) == arg ) {
		  var end = document.cookie.indexOf( ";", j );
		  if( end == -1 ) end = document.cookie.length;
		  return unescape( document.cookie.substring( j, end ) );
	  }

	  i = document.cookie.indexOf( " ", i ) + 1;
	  if( i == 0 ) break;
  }

  return null;
}

// 쿠키 생성하는 함수 : 입력값 - 쿠키이름 + 쿠키값 + 유효기간
function setCookie( name, value, expires ) {
	document.cookie = name + "=" + escape(value) + ( ( expires == null ) ? "" : ( ";expires = " + expires.toGMTString() ) )+ "; path=";
}

function setCookieSimple( name, value, expiresSec ) {
	var today = new Date();
	var expires = new Date();
	expires.setTime( today.getTime() + expiresSec );
	setCookie( name, value, expires );
}


/*======================================================
    화면 확대/축소
======================================================*/
/*
// 화면확대페이지에 소스 추가 
var size = 1.0;
$(document).ready(function(){
<%if (Request.cookies("zoom_size") <> "" ) then%>
		size = <%=Request.cookies("zoom_size")%>-0.05; //0.05를 빼주는 이유는 바로 하단에 updateZoom(1);실행함으로써 한번 더 화면이 확대되기때문.
	updateZoom(1);
	<%end if%>
$('#zoom-in').on("click",function() {updateZoom(1);});
	$('#zoom-out').on("click",function() {updateZoom(-1);});
	$("#zoomView").on("click",function() {zoomDefault();});
});
// 화면확대페이지에 소스 추가 끝
*/

function zoomview(size){	
	updateZoom(size);
}


//화면 원래대로 
function zoomDefault() { 
	updateZoom(0);
	$(".zoomView").html("화면크기");
}

function send_ses(size){ 
	 // ajax 통신으로 세션에 저장하는 것.. 저장 이후에 페이지 전환 후에도 계속 확대된 상태고 있기 위해서
	 var url="/includefiles/prog/ajax_zoom.asp";
	 var param="size="+encodeURIComponent(size); 
	 var method="POST"; 
	 $.ajax({ 
		 type: method,  
		 url:url, 
		 dataType:"html", 
		 data:param, 
		 success:function (msg){ 
			if (size != 1) $(".zoomView").html("원래크기");
		 } 
	 });
}

function updateZoom(zoom) {	
	var currentSize=0 ;
	if (zoom == 0) {
		currentSize = 1.0;
	} else {
		currentSize += size+zoom* 0.05;
	}
		this.size = currentSize;
		$('html').css('-webkit-transform','scale(' + this.size + ')');
		$('html').css('-moz-transform','scale(' + this.size + ')');
		$('html').css('-o-transform','scale(' + this.size + ')');		

		$('html').css('-webkit-transform-origin', '50% 0%');
		$('html').css('-moz-transform-origin', '50% 0%');
		$('html').css('-o-transform-origin', '50% 0%');

		$('html').css('transform','scale(' + this.size + ')');
		$('html').css('transform-origin', '50% 0%');
		send_ses(this.size);
}



// 문서 제목 바꾸기
function docTitle(v1) {
	 document.title = v1;
}


function timer() {
 var today = new Date();
 var H = today.getHours();
 var ampm;

 if(H>=12){
	 H = H -12;
     ampm="오후"; }
else
 {
     ampm="오전";
 }

var M = today.getMinutes();
 var s = today.getSeconds();
 var year = today.getFullYear();
 var mon = today.getMonth()+1;
 var dat = today.getDate();
 var week = new Array('일','월','화','수','목','금','토');
	nowTime = year+"년 "+mon+"월 "+dat+"일 "+ ampm+" "+ H +":"+ M +":"+s;
 return nowTime
 }

 function real_timer() {
 var today = new Date();
 var H = today.getHours();
 var ampm;

 if(H>=12){
	 H = H -12;
     ampm="오후"; }
else
 {
     ampm="오전";
 }

var M = today.getMinutes();
 var s = today.getSeconds();
 var year = today.getFullYear();
 var mon = today.getMonth()+1;
 var dat = today.getDate();
 var week = new Array('일','월','화','수','목','금','토');
	nowTime = mon+"월 "+dat+"일 "+ ampm+" "+ H +":"+ M +":"+s;
 return nowTime
 }

// 페이지에서 나갈때 사용
 function areYouSure() {
	var pageout = false;
    var link = false;
        function pout() {
            if (!pageout && !link) {
              pageout = true;
              return "이 페이지에서 나가시겠습니까";
            }
          }
   window.onbeforeunload = pout;
}


// #hiddenZone 아이프레임 show
function datapopup_(folder, page, query){
	//var tempY = event.clientY ;
	var tempY = $(document).scrollTop()+200;
	var leftX = parseInt($("html").css("width"))/2;		
	$("#hiddenZone").css({"left":leftX+"px","top":tempY+"px","width":"690px","height":"700px"}).show();		
	hiddenZone.location.replace(folder + page +"?"+ query); 
}


//내용 바이트로 구하기
function calculateBytes(szValue){
  var tcount = 0;
  var tmpStr = new String(szValue);
  var temp = tmpStr.length;
  var onechar;
  for ( k=0; k<temp; k++ )  {
    onechar = tmpStr.charAt(k);
    if (escape(onechar).length > 4){
      tcount += 2;}
    else{
      tcount += 1;}
  }
  return tcount;
}


//윈도우 창끝 이벤트
/*$(window).scroll(function() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
        alert('End of Window');
    }
});​

// div 끝 이벤트
$("#inside").scroll( function() {
  var elem = $("#inside");

  if ( elem[0].scrollHeight - elem.scrollTop() == elem.outerHeight())
    {
        alert("End of Yellow");
    }
}); */

function gFnc_MakeForm(id, name, action) {
	var f = document.createElement("form");
	f.setAttribute("method", "post");
	f.setAttribute("id", id);
	f.setAttribute("name", name);
	f.setAttribute("action", action);
	document.body.appendChild(f);
	return f;
}

function gFnc_MakeInput(type, id, name, value) {
	var i = document.createElement("input");
	if (type == "") {
		type = "hidden";
	}
	i.setAttribute("type", type);
	if (id != "") {
		i.setAttribute("id", id);
	}
	i.setAttribute("name", name);
	i.setAttribute("value", value);
	return i;
}

function getResponse_post(res_parameter, postUrl){
	var arr_res_param		= res_parameter.split("&");
	var arr_param_count		= arr_res_param.length;
	var frm					= gFnc_MakeForm("sendFRM", "sendFRM", "");
		frm.method	= "POST";
		for (arr_i = 0; arr_i < arr_param_count ; arr_i++){
			var f_names		= arr_res_param[arr_i].split("=")				
			frm.appendChild(gFnc_MakeInput("hidden", f_names[0], f_names[0], f_names[1]));			
		}	
		frm.action	= postUrl;			
		frm.submit();
}