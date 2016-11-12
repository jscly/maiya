package cn.edu.zhku.model;

public class ShopInfo {
	
	private int shopId;//int(11) pk not null
	private String shopName;//varchar(45) not null
	private int sellerId;//一个卖家对应一个店铺int(11) not null 
	//是否有效认证店铺
	private String isValidShop;//enum('0','1') 0位无效认证店铺，1为有效 ;ALTER TABLE `maiya`.`seller` modify isValidSeller enum('0','1') NOT NULL default '0';
	//店铺营业额
	private double shopTurnOver;//double
	//店铺店铺
	private String shopGoodsId;//商品id字符串，用“;”分隔  varchar(255) not null 默认：‘’
	//店铺订单
	private String shopOrdersId;//订单id字符串，用“;”分隔  varchar(255) not null 默认：‘’
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public String getIsValidShop() {
		return isValidShop;
	}
	public void setIsValidShop(String isValidShop) {
		this.isValidShop = isValidShop;
	}
	public double getShopTurnOver() {
		return shopTurnOver;
	}
	public void setShopTurnOver(double shopTurnOver) {
		this.shopTurnOver = shopTurnOver;
	}
	public String getShopGoodsId() {
		return shopGoodsId;
	}
	public void setShopGoodsId(String shopGoodsId) {
		this.shopGoodsId = shopGoodsId;
	}
	public String getShopOrdersId() {
		return shopOrdersId;
	}
	public void setShopOrdersId(String shopOrdersId) {
		this.shopOrdersId = shopOrdersId;
	}
	
	
	
}
