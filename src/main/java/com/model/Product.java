package com.model;

import java.io.InputStream;

public class Product {

	private int pID;
	private String pName;
	private String pPrice;
	private String pCategory;
	private String pSubCategory;
	private String pStock;
	private InputStream pImg;
	private String base64Image;
	private String pDesc;
	
	public int getpID() {
		return pID;
	}
	public void setpID(int pID) {
		this.pID = pID;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpPrice() {
		return pPrice;
	}
	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	public String getpSubCategory() {
		return pSubCategory;
	}
	public void setpSubCategory(String pSubCategory) {
		this.pSubCategory = pSubCategory;
	}
	public String getpStock() {
		return pStock;
	}
	public void setpStock(String pStock) {
		this.pStock = pStock;
	}
	public InputStream getpImg() {
		return pImg;
	}
	public void setpImg(InputStream pImg) {
		this.pImg = pImg;
	}
	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	
	
	
}
