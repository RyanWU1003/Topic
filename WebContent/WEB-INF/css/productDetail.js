$(function(){
	//購物車隱藏
	$(".mycart").hide();

/*	$(".showMyCart").click(function(){
		if(!($(".mycart").hasClass("show"))){
				$(".mycart").show();
				$(".mycart").addClass("show");
				
			}else{
				$(".mycart").hide();
				$(".mycart").removeClass("show");
				
			}
		})*/
	loadMyCart();
	function loadMyCart(){
		$.ajax({
		url:"loadMyCart",
		type:"POST",
		dataType:"json",
		success:function(result){
			//	var rs =JSON.parse(JSON.stringify(result));
				var s ="";
				var sum=0;
				var count =0;
				if(result.length==0){
					$("#cartTable").html("購物車是空的");
					$("#badge").html(count);
				}else{
				
				$.each(result,function(i,v){
					count+=1;
					sum+=v.price*v.quantity;
					s+=`<tr><td>${v.name}</td><td>${v.quantity}</td><td>${v.price}</td><td>${v.price*v.quantity}</td><td><button type="button" id="${v.id}" class="delproduct">刪除</button></td></tr>`
				});
				$("#cartTable").html(s+`<tr><td>${sum}</td></tr><tr><td><button><a href="goToCart">前往購物車</a></button></td></tr>`);
				$("#badge").html(count);}
				}
		})
		}
	
	$(document).on('click','.add2Cart',function(e){
			e.preventDefault();
		    var productid =$(this).attr('id');
			var qty=$(".pqty").val();
			fetch("addToCart?id="+productid+"&quantity="+qty,{method:"GET"})
			.then(response=>{return response;})
			.then(result=>{loadMyCart();})

		})
		

	$(document).on('click','.delproduct',function(e){
			e.preventDefault();
		    var productid =$(this).attr('id');

			fetch("deletProduct?id="+productid,{method:"GET"})
			.then(response=>{return response;})
			.then(result=>{loadMyCart();})
		
				
	})
	$(".pqty").val(1);
	$("#qtyMinus").click(function(){
		var qty=$(".pqty").val();
		if(qty<=1){
			return;
		}else{
			$(".pqty").val(qty-1);
		}
	})
	
	$("#qtyAdd").click(function(){
		var qty=parseInt($(".pqty").val());
		var stock =$(".stock").attr("name");
		if(qty>=stock){
			$(".pqty").val(stock);
			alert("已達上限");
		}else{
			$(".pqty").val(qty+1);}
		
	})
		
	
})