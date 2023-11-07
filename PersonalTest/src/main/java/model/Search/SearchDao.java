package model.Search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import model.Search.Search;
import model.Search.SearchDao;
import util.DBManager;

public class SearchDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");

	private SearchDao() {
	}

	private static SearchDao instance = new SearchDao();

	public static SearchDao getInstance() {
		return instance;
	}

	public List<Search> getSearchbyId(String product_name) {
	    List<Search> searchResults = new ArrayList<>();
	    this.conn = DBManager.getConnection();

	    if (this.conn != null) {
	        String sql = "SELECT * FROM product WHERE product_name LIKE ?";
//	        System.out.println(product_name + "/");
	        try {
	            this.pstmt = this.conn.prepareStatement(sql);
	            this.pstmt.setString(1, "%" + product_name + "%"); // "%"를 사용하여 부분 일치 검색
	            this.rs = this.pstmt.executeQuery();
	            
	            while (this.rs.next()) {
	                int product_idx = this.rs.getInt(1);
	                String full_product_name = this.rs.getString(2); // 전체 제품 이름 가져오기
	                int product_price = this.rs.getInt(3);
	                byte[] product_image = this.rs.getBytes(4);

	                Search search = new Search(product_idx, full_product_name, product_price, product_image);
	                searchResults.add(search);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            DBManager.close(this.conn, this.pstmt, this.rs);
	        }
	    }

	    return searchResults;
	}

}
