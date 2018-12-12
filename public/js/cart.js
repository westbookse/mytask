$(function(){
  async function loadCart(){
    var res=await $.ajax({
      url:"http://localhost:3000/users/islogin",
      type:"get",
      dataType:"json"
    });
    if(res.ok==0){
      alert("暂未登录，无法使用购物车");
    }else{
      var res=await $.ajax({
        url:"http://localhost:3000/cart/items",
        type:"get",
        dataType:"json"
      })
			var html="",total=0;
			console.log(res);
      for(item of res){
				var {iid,title,count,price,sm,spec}=item;
        total+=price*count;
        html+=`<div class="table-item1" id="table-item1">
				<div>
					<input type="checkbox">
				</div>
				<div class="table-product">
						<a href="#">
							<img src="${sm}" alt="">
						</a>
					<div class="cart-details">
						<a href="#">${title}
						<p>
							<span>
								规格:
							</span>
							<span>
								${spec}
							</span>
						</p>
						</a>
					</div>
					<div class="cart-price">
						<h6>悦桔专享价</h6>
						<P>￥${price}</P>
					</div>
					<div class="cart-button">
						<button type="button" data-iid="${iid}">-</button>
						<input type="text" value="${count}">
						<button type="button" data-iid="${iid}">+</button>
					</div>
					<div class="cart-sum">
						<span>￥${(price*count).toFixed(2)}</span>
					</div>
					<div class="cart-delete">
						<a href="#">删除</a>
					</div>
				</div>
				</div>
				`;
			}
			$("#table-list").html(html);

    }
	}
	loadCart()
	var $table_list=$("#table-list");
	$table_list.on("click","button",function(){
		var $btn=$(this);
		(async function(){
			var iid=$btn.attr("data-iid");
			var count=$btn.parent().children("input").val();
			if($btn.html()=="+")
				count++;
			else
				count--;
			if(count==0)
				if(!confirm("是否删除该商品?"))
					return;//退出当前函数
			
			await $.ajax({
				url:"http://localhost:3000/cart/update",
				type:"get",
				data:{iid,count}
			})
			loadCart()
		})()
	})

	
})