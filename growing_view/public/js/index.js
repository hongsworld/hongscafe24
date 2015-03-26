$(document).ready(function(){
  //tappable적용
    tappable('#signIn', function(){
        location.href= "../signIn.html"
    });

    tappable('#signUp', function(){
        location.href= "../signUp.html"
    });
});
