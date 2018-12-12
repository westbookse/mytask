$(function(){
  if(location.search.indexOf("lid=")!=-1){
    var lid=location.search.split("=")[1];
    (async function(){
      var res=await $.ajax({
        url:"http://localhost:3000/details",
        type:"get",
        data:{lid},//"lid="+lid,
        dataType:"json"
      })//ver res=open(res)
      console.log(res);
      var {product,pics,specs}=res;
      var {title,msales,sales,price}=product;
      var divDetails=document.getElementById("details");
      var divchoose=document.getElementById("choose");
      divDetails.children[0].innerHTML=title;
      divDetails.children[1].children[1].children[1].innerHTML="¥"+price.toFixed(2);
      divDetails.children[1].children[4].children[0].children[0].innerHTML=msales;
      divDetails.children[1].children[4].children[1].children[0].innerHTML=sales;

      var html="";
      for(var sp of specs){
        html+=`<a class="my-border ${sp.lid==lid?'active':''}" href="introduction.html?lid=${sp.lid}">${sp.spec}</a>`;
      }
      divchoose.innerHTML=html;

      var divPrev=document.getElementById("intro-img");
      var imglist=document.querySelector(".intro-left>.img-list>div");
      var html="";
      for(var pic of pics){
        var {sm,md,lg}=pic;
        html+=`<img src="${sm}" data-md="${md}" data-lg="${lg}">`
      }
      imglist.innerHTML=html;
      imglist.style.width=60*pics.length+"px";
      var mImg=divPrev.querySelector(
        ".img-md>img"
      )
      mImg.src=pics[0].md;
      var lgDiv=document.getElementById("div-lg");
      lgDiv.style.backgroundImage=`url(${pics[0].lg})`;
      //鼠标进入每个小图片，切换中图片和大图片
      imglist.onmouseover=function(e){
        if(e.target.nodeName==="IMG"){
          var img=e.target;
          var md=img.dataset.md;
          var lg=img.dataset.lg;
          mImg.src=md;
          lgDiv.style.backgroundImage=`url(${lg})`;
        }
      }
      //小图片左右移动
      $imglist=$(imglist);
      $left=//找到左边按钮后退按钮
        $(".prev")
      //找到右边按钮-前进按钮
      var $right=$left.nextAll().last()
      //如果pics中图片总数<=5
      if(pics.length<=5)
        //为右边按钮添加disabled class
        $right.addClass("disabled")
      var moved=0;//记录已经左移的图片个数
      $left.on("click",function(){       
        var $left=$(this);
        if(moved==0)
        $left.addClass("disabled")
        if(!$left.is(".disabled")){
          moved--;//已经左移的图片个数-1
          //ul的marginLeft始终等于:-li宽度62*左移图片个数
          $imglist.css("marginLeft",-80*moved)//不用px
          $right.removeClass("disabled")
          if(moved==0)
            $left.addClass("disabled")
        }
      })
      $right.on("click",function(){
        var $right=$(this);
        if(!$right.is(".disabled")){
          moved++;//已经左移的图片个数+1
          $imglist.css("marginLeft",-80*moved)
          //让左边按钮去掉disabled class
          $left.removeClass("disabled")
          //如果pics中的图片总个数-moved次数==4
          if(pics.length-moved==5)
            //为右边按钮加上disabled class
            $right.addClass("disabled")
        }
      })

      var $mImg=$(mImg),//中图片
      $lgDiv=$(lgDiv),//大图片
      $mask=$("#mask"),//半透明遮罩
      $smask=$("#super-mask");//透明玻璃板
      var MSIZE=200,//mask的大小
          MAX=400-MSIZE;//top和left的最大值
      $smask
      .hover(
        function(){
          $mask.toggleClass("d-none");
          $lgDiv.toggleClass("d-none");
        }
      )
      .mousemove(function(e){
        var left=e.offsetX-MSIZE/2;
        var top=e.offsetY-MSIZE/2;
        if(left<0) left=0; 
        else if(left>MAX) left=MAX;
        if(top<0) top=0;
        else if(top>MAX) top=MAX;
        $mask.css({left,top});
        $lgDiv.css("background-position",
          `-${5/4*left}px -${5/4*top}px`)
      })
    })()
  }
})
