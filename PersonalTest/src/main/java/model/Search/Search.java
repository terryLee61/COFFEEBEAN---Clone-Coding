package model.Search;

public class Search {
	private int product_idx;   
	private String product_name;
	private int product_price;
	private String product_image;
	
	public Search(int product_idx, String product_name, int product_price, String product_image) {
		this.product_idx = product_idx ;   
		this.product_name = product_name ;   
		this.product_price = product_price ;   
		this.product_image = product_image ;   
	}
	
	public int getProduct_idx() {
		return product_idx;
	}
	public String getProduct_name() {
		return product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public String getProduct_image() {
		return product_image;
	}
}
