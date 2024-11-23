package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mvc.database.DBConnection;

public class BoardDAO {
	private static BoardDAO instance;
	private BoardDAO getInstance(){
		if(instance == null) instance = new BoardDAO();
		return instance;
	}
	
	public int getListcount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		int x = 0;
		
		String sql;
		
		if(items == null && text == null)
			sql = "select count(*) from board";
		else
			sql = "select count(*) from board where" + items+ "like '%"+text+"%'";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) x= rs.getInt(1);
		}catch(Exception e) {
			System.out.println("getListCount() 에러:"+e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return x;
	}
}
