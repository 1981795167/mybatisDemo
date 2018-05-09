package com.po;

public class OrderDetail {

	private Integer id,ordersId,productsId,productsNum;
	
	private Products products;
	
	

	public Products getProducts() {
		return products;
	}

	public void setProducts(Products products) {
		this.products = products;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrdersId() {
		return ordersId;
	}

	public void setOrdersId(Integer ordersId) {
		this.ordersId = ordersId;
	}

	public Integer getProductsId() {
		return productsId;
	}

	public void setProductsId(Integer productsId) {
		this.productsId = productsId;
	}

	public Integer getProductsNum() {
		return productsNum;
	}

	public void setProductsNum(Integer productsNum) {
		this.productsNum = productsNum;
	}

	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", ordersId=" + ordersId + ", productsId=" + productsId + ", productsNum="
				+ productsNum + ", products=" + products + "]";
	}

	
	
}
