$(function(){
  if(location.search.indexOf("kwords=")!=-1){
    var kwords=decodeURI(
      location.search.split("=")[1]
    );
    var pno=0;
    function loadPage(no=0){//no:新页号
      pno=no;
      $.ajax({
        url:"http://localhost:3000/products",
        type:"get",
        data:{kwords,pno},
        dataType:"json",
        success:function(output){
          console.log(output);
          var { products,pageCount }=output;
          var html="";
          for(var p of products){
            var {lid,title,price,md,sales}=p;
            html+=`<div class="product-detail">
            <img src="${md}" alt="">
            <div class="title fl">【良品铺子旗舰店】${title}包邮</div>
            <div class="price fl">
              <b>¥</b>
              <strong>${price.toFixed(2)}</strong>
            </div>
            <div class="number fl">
              销量<span>${sales}</span>
            </div>
            <button class="btn btn-outline-secondary p-0 border-0 fl ml-2 mt-1 my_button" type="button">-</button>
            <input type="text" class="form-control p-1 fl ml-2" value="1">
            <button class="btn btn-outline-secondary p-0 border-0 fl ml-2 mt-1 my_button" type="button">+</button>
            <a class="btn my_color float-right ml-1 pl-1 pr-1" href="#" data-lid="${lid}">加入购物车</a>
            <table class="clear"></table>
            </div>`
          }

          $plist.html(html);

          var html="";
          for(var i=1;i<=pageCount;i++){
            html+=`<span class="${i==pno+1?'active':''}"><a href="#">${i}</a></span>`
          }
          var $my_page=$("#my_page");
          $my_page.children(":not(:first-child):not(:last-child)").remove()
          $my_page.children().first().after(html);
          if(pno==0){//如果当前页是第一页就禁用上一页
            $my_page.children().first().addClass("disabled")
          }else{
            $my_page.children().removeClass("disabled");
          }
          if(pno==pageCount-1){
            $my_page.children().last().addClass("disabled");
          }else{
            $my_page.children().last().removeClass("disabled");
          }
        }
      })
    }
    loadPage();
    var $my_page=$("#my_page");
    //只有在页面首次加载时，在分页按钮的父元素上绑定一次
    $my_page.on("click","a",function(e){
      e.preventDefault();
      var $a=$(this);
      //除了禁用和当前正在激活按钮之外才能点击
      if(!$a.parent().is(".disabled,.active")){
        if($a.parent().is(":first-child"))//上一页
          var no=pno-1;//新页号=当前页号-1
        else if($a.parent().is(":last-child"))
          var no=pno+1;//新页号=当前页号+1
        else//1、2、3按钮
          var no=$a.html()-1;//新页号=按钮内容-1
        loadPage(no);//重新加载新页号的页面内容
      }
    });



    var $plist=$("#plist");
   //34行,href="cart.html"->href="#"
   $plist.on("click","button,a.btn",function(e){
    e.preventDefault();
    //获得目标元素保存在变量$btn中
    var $btn=$(this);
    if($btn.is("button")){
      //找到$btn旁边的input，保存在变量$input中
      var $input=$btn.siblings("input")
      //获得$input的内容保存在变量n中
      var n=parseInt($input.val())
      //如果$btn的内容是+
      if($btn.html()=="+")
        n++;//n++
      else if(n>1)//否则，如果n>1
        n--//n--
      //设置$input的内容是n
      $input.val(n);
    }else{
      (async function(){
        var res=await $.ajax({
          url:"http://localhost:3000/users/islogin",
          type:"get",
          dataType:"json"
        });
        if(res.ok==1){
          var lid=$btn.attr("data-lid");
          var count=$btn.siblings("input").val()
          await $.ajax({
            url:"http://localhost:3000/cart/add",
            type:"get",
            data:{lid,count}
          })
          $btn.siblings("input").val(1);
          alert("添加成功！");
        }else alert("请先登录!"); 
      })()
    }
  });
 

}
})