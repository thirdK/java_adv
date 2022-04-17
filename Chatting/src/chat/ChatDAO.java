package chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ChatDAO {
	private Connection conn;
	
	public ChatDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/chatting";
			String dbID = "root";
			String dbPassword = "0000";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Chat> getChatList(String nowTime){	
		//매개변수명을 nowTime이라고 정한 이유는 현재시각에 맞춰 모든 데이터(메세지)를 가져오겠다 라는 의미 
		ArrayList<Chat> chatList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String SQL = "SELECT * FROM chat WHERE chatTime > ? ORDER BY chatTime";
		// chat테이블에서 chatTime이 매개변수 nowTime보다 오랜 시간인 경우
		// chatTime을 기준으로 정렬하여 가져온다. (오름차순)
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, nowTime);
			rs = pstmt.executeQuery();
			
			chatList = new ArrayList<Chat>();
			while(rs.next()) {
				Chat chat = new Chat();
				chat.setChatName(rs.getString("chatName"));
				chat.setChatContent(rs.getString("chatContent"));
				chat.setChatTime(rs.getString("chatTime"));
				chatList.add(chat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		
		return chatList;
	}
	
	//사용자가 메세지를 입력할 수 있도록하는 submit 메서드
	public int submit(String chatName, String chatContent) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String SQL = "INSERT INTO chat VALUES(?, ?, now())";
		//now()를 넘기면 현재시간이 넘어간다.
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, chatName);
			pstmt.setString(2, chatContent);
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		return -1;
	}
}
