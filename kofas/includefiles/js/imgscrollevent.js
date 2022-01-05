function project_(){
    var mgt  = parseInt($(".body-sub04 .project").css("margin-top"));
    $(".body-sub04 .project").animate({ "margin-top": "-80px"}, "slow");
    $(".body-sub04 .cont02" ).animate({ "margin-top": "-470px"}, "slow",function(){
       // if (mgt == 0) {$(".body-sub04 .cont02 .img").rotate({duration:2000,angle: 0,animateTo:360}); }
    });
    
}
function project_default(){
    var mgt  = parseInt($(".body-sub04 .project").css("margin-top"));
    $(".body-sub04 .project").animate({ "margin-top": "0px"}, "slow");
    $(".body-sub04 .cont02" ).animate({ "margin-top": "-400px"}, "slow");
    
}