package cn.edu.zhku.model;

public class Order {

	private int id;//int(11) pk not null
	private int customerID;//int(11) not null
	private String customerName;//varc(45) NN
	private String customerAddress;//varc(255) NN
	private String customerPhone;//varc(15) NN
	
	private int idOfCart;//可以有多个商品id,以“;”分离，int(11) not null 
	private String status;//订单状态：enum('等待买家付款','买家已付款，等待平台确认','等待发货','已部分发货','等待买家确认收货','已确认收货','交易成功','交易关闭','买家申请退款，等待协商结果','买家取消退款申请','部分退款后等待发货','退款协议已达成','取消订单','退款/退货协商中，等待协议达成','协议已达成，执行中','买家投诉至平台','已确认发货，买家发起售后纠纷',) default '交易关闭';
	//具体：alter table maiya.order modify status enum('等待买家付款','买家已付款，等待平台确认','等待发货','已部分发货','等待买家确认收货','已确认收货','交易成功','交易关闭','买家申请退款，等待协商结果','买家取消退款申请','部分退款后等待发货','退款协议已达成','取消订单','退款/退货协商中，等待协议达成','协议已达成，执行中','买家投诉至平台','已确认发货，买家发起售后纠纷') not null default '交易关闭';
	
	//快递方式
	private String expressMode;//alter table maiya.order modify delivermode enum('EMS','中通','圆通','申通','韵达','顺丰','天天','宅急送','全峰','德邦') not null default '圆通';
	
	//快递费用
	private double expressCharge;//double NN default 0.00
	
	//支付方式
	private String payMode;//alter table maiya.order modify paymode enum('线上支付','微信扫一扫支付','货到付款',) not null default '线上支付';
	
	private String expressWorker;//快递员名字 varchar(45) NN def:小二哥
	private String expressWorkerPhone;//快递员电话 varchar(45) NN default:12345678999
	private String invoiceStypeAndInfo;//发票类型及信息信息 varchar(255) default:电子发票;个人明细等
	private double totalMoney;//double NN default:0.00
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	
	
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	
	
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	
	public int getIdOfCart() {
		return idOfCart;
	}
	public void setIdOfCart(int idOfCart) {
		this.idOfCart = idOfCart;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getExpressMode() {
		return expressMode;
	}
	public void setExpressMode(String expressMode) {
		this.expressMode = expressMode;
	}
	public double getExpressCharge() {
		return expressCharge;
	}
	public void setExpressCharge(double expressCharge) {
		this.expressCharge = expressCharge;
	}
	public String getPayMode() {
		return payMode;
	}
	public void setPayMode(String payMode) {
		this.payMode = payMode;
	}
	public String getExpressWorker() {
		return expressWorker;
	}
	public void setExpressWorker(String expressWorker) {
		this.expressWorker = expressWorker;
	}
	public String getExpressWorkerPhone() {
		return expressWorkerPhone;
	}
	public void setExpressWorkerPhone(String expressWorkerPhone) {
		this.expressWorkerPhone = expressWorkerPhone;
	}
	public String getInvoiceStypeAndInfo() {
		return invoiceStypeAndInfo;
	}
	public void setInvoiceStypeAndInfo(String invoiceStypeAndInfo) {
		this.invoiceStypeAndInfo = invoiceStypeAndInfo;
	}
	public double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}
	
	
	
	
}
