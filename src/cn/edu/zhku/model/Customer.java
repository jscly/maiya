package cn.edu.zhku.model;


public class Customer {

	private int id;//int(11) NN
	private String name;//varc(45) NN
	private String psw;//varc(20) NN
	private String payPsw;//varc(20) NN
	
	private String phone;//varc(11) NN
	private double balance;//double NN def :0.00
	
	private String ordersId;//varc(255) 以英文分号分隔
	private String deliveryAddress;//varc(255) 
	private String isValidCustomer;//varc(1) 默认：0（未认证）
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPsw() {
		return psw;
	}
	public void setPsw(String psw) {
		this.psw = psw;
	}
	public String getPayPsw() {
		return payPsw;
	}
	public void setPayPsw(String payPsw) {
		this.payPsw = payPsw;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public String getOrdersId() {
		return ordersId;
	}
	public void setOrdersId(String ordersId) {
		this.ordersId = ordersId;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public String getIsValidCustomer() {
		return isValidCustomer;
	}
	public void setIsValidCustomer(String isValidCustomer) {
		this.isValidCustomer = isValidCustomer;
	}
	
	
	
}
