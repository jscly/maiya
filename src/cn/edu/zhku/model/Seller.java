package cn.edu.zhku.model;

public class Seller {

	private int id;//int(11) not null
	private String name;//varchar(45) not null
	private String psw;//varchar(20) not null
	//是否有效认证的卖家
	private String isValidSeller;//enum('0','1') 0位无效认证卖家，1为有效 ;ALTER TABLE `maiya`.`seller` modify isValidSeller enum('0','1') NOT NULL default '0';
	private String shopId;//一个卖家只能有1或0个店铺，int(11) 暂时无店铺标志为null，即默认为null
	//营业额
	private double turnOver;//double not null 默认为0.00
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
	public String getIsValidSeller() {
		return isValidSeller;
	}
	public void setIsValidSeller(String isValidSeller) {
		this.isValidSeller = isValidSeller;
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public double getTurnOver() {
		return turnOver;
	}
	public void setTurnOver(double turnOver) {
		this.turnOver = turnOver;
	}
	
	
	
}
