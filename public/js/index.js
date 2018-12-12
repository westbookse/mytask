$(function(){
  $.ajax({
    url:"http://localhost:3000/index/getIndexProducts",
    type:"get",
    dataType:"json",//ajax可自动将json转为obj
    success:function(res){
      console.log(res);
      var {pic}=res[0];
      var html=
      `<div class="activity-title1"></div>
      <h4>秒杀</h4>
      <div><img src="${pic}" alt=""></div>
      <h3>春节送礼优选</h3>`;
      var divCard=document.querySelector(
        ".activity-details>div:nth-child(1)"
      );
      divCard.innerHTML=html;

      var {pic}=res[1];
      var html=
      `<div class="activity-title2"></div>
      <h4>特惠</h4>
      <div><img src="${pic}" alt=""></div>
      <h3>春节送礼优选</h3>`;
      var divCard=document.querySelector(
        ".activity-details>div:nth-child(2)"
      );
      divCard.innerHTML=html;

      var {pic}=res[2];
      var html=
      `<div class="activity-title2"></div>
      <h4>团购</h4>
      <div><img src="${pic}" alt=""></div>
      <h3>春节送礼优选</h3>`;
      var divCard=document.querySelector(
        ".activity-details>div:nth-child(3)"
      );
      divCard.innerHTML=html;

      var {pic}=res[3];
      var html=
      `<div class="activity-title2"></div>
      <h4>超值</h4>
      <div><img src="${pic}" alt=""></div>
      <h3>春节送礼优选</h3>`;
      var divCard=document.querySelector(
        ".activity-details>div:nth-child(4)"
      );
      divCard.innerHTML=html;
    }
  })
})


$(function(){
  $.ajax({
    url:"http://localhost:3000/index/getIndexProducts2",
    type:"get",
    dataType:"json",//ajax可自动将json转为obj
    success:function(res){
      console.log(res);
      var {pic,details,subdetails}=res[0];
      var html=
      `<a href="#"><img src="${pic}" alt=""></a>
    <p>${details}<br>${subdetails}</p>`;
      var divCard=document.querySelector(
        ".clock>div:nth-child(1)"
      );
      divCard.innerHTML=html;

      var {pic,details,subdetails}=res[1];
      var html=
      `<h3>${details}</h3>
      <h4>${subdetails}</h4>
      <a href="#"><img src="${pic}" alt=""></a>`;
      var divCard=document.querySelector(
        ".clock>div:nth-child(2)"
      );
      divCard.innerHTML=html;

      var {pic,details,subdetails}=res[2];
      var html=
      `<h3>${details}</h3>
      <h4>${subdetails}</h4>
      <a href="#"><img src="${pic}" alt=""></a>`;
      var divCard=document.querySelector(
        ".clock>div:nth-child(3)"
      );
      divCard.innerHTML=html;

      var {pic,details,subdetails}=res[3];
      var html=
      `<h3>${details}</h3>
      <h4>${subdetails}</h4>
      <a href="#"><img src="${pic}" alt=""></a>`;
      var divCard=document.querySelector(
        ".clock>div:nth-child(4)"
      );
      divCard.innerHTML=html;
    }
  })
})


$(function(){
  $.ajax({
    url:"http://localhost:3000/index/getIndexProducts3",
    type:"get",
    dataType:"json",//ajax可自动将json转为obj
    success:function(res){
      console.log(res);
      var {pic,price,details,href}=res[0];
      var html=
      ` <div>${details}</div>
      <div>￥${price}</div>
      <i class="am-icon-shopping-basket"></i> 
      <a href="${href}"><img src="${pic}" alt=""></a>`;
      var divCard=document.querySelector(
        ".product-two-top"
      );
      divCard.innerHTML=html;
        /*2*/ 

      var {pic,price,details}=res[1];
      var html=
      ` <div>${details}</div>
      <div>￥${price}</div>
      <i class="am-icon-shopping-basket"></i> 
      <a href="${href}"><img src="${pic}" alt=""></a>`;
      var divCard=document.querySelector(
        ".product-two-bottom"
      );
      divCard.innerHTML=html;
/*3 */
      var {pic,price,details}=res[2];
      var html=
      ` <div>${details}</div>
      <div>￥${price}</div>
      <i class="am-icon-shopping-basket"></i> 
      <a href="${href}"><img src="${pic}" alt=""></a>`;
      var divCard=document.querySelector(
        ".product-two-right"
      );
      divCard.innerHTML=html;
/*4*/
      var {pic,price,details}=res[3];
      var html=
      ` <div>${details}</div>
      <div>￥${price}</div>
      <i class="am-icon-shopping-basket"></i> 
      <a href="${href}"><img src="${pic}" alt=""></a>`;
      var divCard=document.querySelector(
        ".product-three-top"
      );
      divCard.innerHTML=html;
/*5*/ 
      var {pic,price,details}=res[4];
      var html=
      ` <div>${details}</div>
      <div>￥${price}</div>
      <i class="am-icon-shopping-basket"></i> 
      <a href="${href}"><img src="${pic}" alt=""></a>`;
      var divCard=document.querySelector(
        ".product-three-bottom"
      );
      divCard.innerHTML=html;
/*6*/ 
      var {pic,price,details}=res[5];
      var html=
      ` <div>${details}</div>
      <div>￥${price}</div>
      <i class="am-icon-shopping-basket"></i> 
      <a href="${href}"><img src="${pic}" alt=""></a>`;
      var divCard=document.querySelector(
        ".product-three-right"
      );
      divCard.innerHTML=html;

    }
  })
})