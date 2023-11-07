package model.Search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

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

	public Search getSearchbyId(String product_name) {
		Search Search = null;
		this.conn = DBManager.getConnection();

		if (this.conn != null) {
			String sql = "SELECT * FROM product WHERE product_name LIKE ?";

			try {
				this.pstmt = this.conn.prepareStatement(sql);
				this.pstmt.setString(1, product_name);
				this.rs = this.pstmt.executeQuery();
				if (this.rs.next()) {
					int product_idx = this.rs.getInt(1);
					int product_price = this.rs.getInt(3);
					byte[] product_image = this.rs.getBytes(4);

					Search = new Search(product_idx, product_name, product_price, product_image);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(this.conn, this.pstmt, this.rs);
			}
		}

		return Search;
	}
}
