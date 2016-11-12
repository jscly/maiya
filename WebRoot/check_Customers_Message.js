	function check(obj){
				
				var customerNameChecked = true;
				var customerPswChecked = true;
				var checkPswChecked = true;
				var phoneChecked = true;
				
				customerNameChecked = checkcustomerName(obj);
				customerPswChecked = checkcustomerPsw(obj);
				checkPswChecked = checkcustomercheckPsw(obj);
				phoneChecked = checkcustomerphone(obj);
				
				var flag = customerNameChecked  && customerPswChecked && checkPswChecked && phoneChecked;
				
				return flag;
			}
			
			function checkcustomerName(obj){
				var name = obj.customerName.value;
				
				var flag1 = true;
				
				if(name == ""){
					flag1 = false;
					C1.innerHTML="<font color='red' size='2'>&times;姓名不能为空！";
					return flag1;
				}
				
				return flag1;
			}
			
			function checkcustomerPsw(obj){
				var psw = obj.customerPsw.value;
				
				var flag2 = true;
				
				if(psw == ""){
					flag2 = false;
					C2.innerHTML="<font color='red' size='2'>&times;密码不能为空！";
					return flag2;
				}
				
				return flag2;
			}
			
			function checkcustomercheckPsw(obj){
				var pswcheck = obj.checkPsw.value;
				
				var flag3 = true;
				
				if(pswcheck != password){
					flag3 = false;
					C3.innerHTML="<font color='red' size='2'>&times;请重新输入确认密码！";
					return flag3;
				}
				
				return flag3;
			}
			
			function checkcustomerphone(obj){
				var call = obj.phone.value;
				
				var flag4 = true;
				
				if(call == ""){
					flag4 = false;
					C4.innerHTML="<font color='red' size='2'>&times;电话不能为空！";
					return flag4;
				}
				
				return flag4;
			}
			
			
			function checkAlter(jj){
				nameCheck=true;
				
			}