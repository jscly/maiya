	function check(obj){
				
			
				var goodsNameChecked = true;
				var goodsPriceChecked = true;
				var goodsINChecked = true;
				
				
				goodsNameChecked = checkgoodsName(obj);
				goodsPriceChecked = checkgoodsPrice(obj);
				goodsINChecked = checkgoodsIN(obj);
				
				var flag = goodsNameChecked && goodsPriceChecked && goodsINChecked;
				
				return flag;
			}
			
			
			
			function checkgoodsName(obj){
				var name = obj.goodsName.value;
				
				var flag = true;
				
				if(name == ""){
					flag = false;
					A2.innerHTML="<font color='red' size='2'>&times;商品名称不能为空！";
					return flag;
				}
				
				return flag;
			}
			
			function checkgoodsPrice(obj){
				var price = obj.goodsPrice.value;
				
				var flag = true;
				
				if(price == ""){
					flag = false;
					A3.innerHTML="<font color='red' size='2'>&times;商品价格不能为空！";
					return flag;
				}
				
				return flag;
			}
			
			function checkgoodsIN(obj){
				var input = obj.goodsLess.value;
				
				var flag = true;
				
				if(input == ""){
					flag = false;
					A4.innerHTML="<font color='red' size='2'>&times;库存量不能为空！可为0";
					return flag;
				}
				
				return flag;
			}