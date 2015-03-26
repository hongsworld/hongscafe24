$(document).ready(function(){
	$("div.thumb").css("margin-top","202px");
	$("div.body").css("width","100%").css("width","-=60px");
  var height100 = $(window).height();
  alert(height100);
  alert(height100 - 562);
	$("div.body").css("minHeight",height100 - 562);
	$("div.title_box_left").css("width","100%").css("width","-=100px");
});
