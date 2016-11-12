package cn.edu.zhku.entity;
//商品实体类
public class Goods {

	private int goodsID;
	private String goodsName;
	private int goodsPrice;
	private int goodsIN;
	private String beizhu;
	private int goodsLess;
	
	public int getGoodsLess() {
		return goodsLess;
	}
	public void setGoodsLess(int goodsLess) {
		this.goodsLess = goodsLess;
	}
	public Goods(){
		
	}
	public int getGoodsID() {
		return goodsID;
	}
	public void setGoodsID(int goodsID) {
		this.goodsID = goodsID;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getGoodsIN() {
		return goodsIN;
	}
	public void setGoodsIN(int goodsIN) {
		this.goodsIN = goodsIN;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	
	
}
