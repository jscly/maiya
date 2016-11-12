package cn.edu.zhku.model;

public class Goods {

	private int id;//int£¨11£©
	private String name;//varc(45)
	private String sort;//ENUM('Êó±ê', '¼üÅÌ', 'ÏÔÊ¾Æ÷', 'ÓÎÏ·ÊÖ±ú', 'ÄÚ´æ', 'Ö÷°å', 'Ó²ÅÌ', 'ÏÔ¿¨', '»úÏä', 'cpu', 'ÆäËû')
	private int totalvolume;//int(11)
	private int salesvolume;//int(11)
	private int kucun;//int(11)
	
	private double price;//double
	private String introduce;//varc(255)
	private String color;//varc(45)
	private String style;//varc(45)
	private String specification;//varc(255>
	private String evaluation;//varc(500)
	private String picturepath;//varc(255)
	
	
	
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getPicturepath() {
		return picturepath;
	}
	public void setPicturepath(String picturepath) {
		this.picturepath = picturepath;
	}
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
	public int getTotalvolume() {
		return totalvolume;
	}
	public void setTotalvolume(int totalvolume) {
		this.totalvolume = totalvolume;
	}
	public int getSalesvolume() {
		return salesvolume;
	}
	public void setSalesvolume(int salesvolume) {
		this.salesvolume = salesvolume;
	}
	
	public int getKucun() {
		return kucun;
	}
	public void setKucun(int kucun) {
		this.kucun = kucun;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	public String getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}
	
	
	
	
	
}
