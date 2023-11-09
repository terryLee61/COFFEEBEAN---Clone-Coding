package model.Search;

public class SearchRequestDto {
	private int product_idx;
	private String product_name;
	private int product_price;
	private String product_image;

	public SearchRequestDto(int product_idx, String product_name, int product_price, String product_image) {
		this.product_idx = product_idx;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_image = product_image;
	}
	
	public SearchRequestDto(String product_name) {
		this.product_name = product_name;
	}
	
	public SearchRequestDto(int product_idx, String product_name) {
		this.product_idx = product_idx;
		this.product_name = product_name;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

}
