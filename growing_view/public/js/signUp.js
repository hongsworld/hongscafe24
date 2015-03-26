$(document).ready(function(){
  var height100 = $(window).height();
	$("div.body").css("minHeight",height100 - 202 - 130);
  $("div.body").css("width","100%").css("width","-=60px");
  $("input.radius_input").css("width","100%").css("width","-=91");
  $("div.modal-inner").css("width","100%").css("width","-=60px");
});

