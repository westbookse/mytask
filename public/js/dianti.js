$(()=>{
  var $divLift=$(".fixed-lift");    //获取电梯div
  var $ulLift=$(".fixed-lift>ul");  //获取div里面的ul
  var $floors=$(".floor");  //获取楼层
  $(window).scroll(function(){
    var scrollTop=document.body.scrollTop || document.documentElement.scrollTop;
    var offsetTop1=$(".activity").offset().top;
    if(offsetTop1<scrollTop+innerHeight/2)  //超出页面的距离
      $divLift.show();
    else
      $divLift.hide();

    $floors.each((i,f)=>{
      var $f=$(f);
      var offsetTop=$f.offset().top;//当前元素距离页面顶端的距离
      if(offsetTop<=scrollTop+innerHeight/2){
        $ulLift.children(":eq("+i+")").addClass("lift-active")
          .siblings().removeClass("lift-active");
      }//给当前楼层对应的li加上样式，其他的清除样式
    })

    $ulLift.children().click(function(){
      //this->li
      var $li=$(this);//获取li
      var i=$li.index();//获取到当前li的编号
      if(i<3){
      var offsetTop=$(".floor:eq("+i+")").offset().top;//当前楼层距离页面顶端的距离
      $("html").stop(true).animate({
        scrollTop:offsetTop//楼层滚动
      },500);
    }
    })
  })
})
$(document).ready(function(){
  //返回顶部
$("[data-toggle=top]").click(function(){
  var $body=$(document.documentElement);
  var $body2=$(document.body);
  $body.animate({scrollTop:0},800);
  $body2.animate({scrollTop:0},800);
});

})

