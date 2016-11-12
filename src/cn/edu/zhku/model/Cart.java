package cn.edu.zhku.model;

public class Cart {

	private int idOfCart;//int(11) pk NN
	private int idOfCustomer;//int(11) NN
	private int idOfGoods;//int(11) NN
	private int numOfGoods;//int(11) NN
	private double totalMoney;//double NN
	public int getIdOfCart() {
		return idOfCart;
	}
	public void setIdOfCart(int idOfCart) {
		this.idOfCart = idOfCart;
	}
	public int getIdOfCustomer() {
		return idOfCustomer;
	}
	public void setIdOfCustomer(int idOfCustomer) {
		this.idOfCustomer = idOfCustomer;
	}
	public int getIdOfGoods() {
		return idOfGoods;
	}
	public void setIdOfGoods(int idOfGoods) {
		this.idOfGoods = idOfGoods;
	}
	public int getNumOfGoods() {
		return numOfGoods;
	}
	public void setNumOfGoods(int numOfGoods) {
		this.numOfGoods = numOfGoods;
	}
	public double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}
	
	
	
}
