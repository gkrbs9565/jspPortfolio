package mvc.model;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO {
	private static BoardDAO instance;
	private BoardDAO() {}
	
	public static BoardDAO getInstance(){
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
	
	//테이블의 목록을 가져오는 함수 생성
	public ArrayList<BoardDTO> getBoardList(int page){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from board order by board_seq DESC";
				
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			 BoardDTO board = new BoardDTO();
			 board.setNum(rs.getInt("board_seq"));
			 board.setId(rs.getString("id"));
			 board.setName(rs.getString("name"));
			 board.setSubject(rs.getString("subject"));
			 board.setContent(rs.getString("content"));
			 board.setRegistDay(rs.getString("registDay"));
			 board.setHit(rs.getInt("hit"));
			 board.setIp(rs.getString("ip"));
			 board.setUpdateDay(rs.getString("updateDay"));
			 
			 list.add(board);
			}
			
		} catch(Exception e) {
			System.out.println("getBoardList() 에러 : "+ e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
}
