$(".middle-right-title").on("click","a",function(){
  $a=$(this);
  if($a.text()=="邮箱注册"){
    $(".middle-right-center-email").addClass("border-btm2");
    $(".middle-right-center-email").removeClass("border-btm1");
    $(".middle-right-center-phone").addClass("border-btm1");
    $(".middle-right-center-phone").removeClass("border-btm2");
  }else if($a.text()=="手机号注册"){
    $(".middle-right-center-email").addClass("border-btm1");
    $(".middle-right-center-email").removeClass("border-btm2");
    $(".middle-right-center-phone").addClass("border-btm2");
    $(".middle-right-center-phone").removeClass("border-btm1");
  }
});