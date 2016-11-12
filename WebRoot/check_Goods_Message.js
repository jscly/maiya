	function check(obj){
				
				var GoodsIDChecked = true;
				var goodsNameChecked = true;
				var goodsPriceChecked = true;
				var goodsINChecked = true;
				
				GoodsIDChecked = checkGoodsID(obj);
				goodsNameChecked = checkgoodsName(obj);
				goodsPriceChecked = checkgoodsPrice(obj);
				goodsINChecked = checkgoodsIN(obj);
				
				var flag = GoodsIDChecked  && goodsNameChecked && goodsPriceChecked && goodsINChecked;
				
				return flag;
			}
			
			function checkGoodsID(obj){
				var ID = obj.goodsID.value;
				
				var flag = true;
				
				if(ID == ""){
					flag = false;
					A1.innerHTML="<font color='red' size='2'>&times;商品编号不能为空！";
					return flag;
				}
				var r=/^\d[1-9]+$/;
		        if(!r.test(ID)){ 
		        	A1.innerHTML="<font color='red' size='2'>&times;商品编号需为数值型！";
		        }
				
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
				var input = obj.goodsIN.value;
				
				var flag = true;
				
				if(input == ""){
					flag = false;
					A4.innerHTML="<font color='red' size='2'>&times;进货量不能为空！";
					return flag;
				}
				
				return flag;
			}