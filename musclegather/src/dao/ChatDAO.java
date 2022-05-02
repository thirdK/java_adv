package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import dto.ChatDTO;
import util.ConnectionPool;

//채팅을 시작하면 ( -> 버튼을 누르든 뭐든 시작하면)
//해당 유저가 속한 방이 있는지 찾는다.(찾으면 기존 방번호를 받고 없으면 새 방번호를 부여받는다.) findChatRoom/makeChatRoom
// 새 방을 부여받으면 chatr_no은 자동증가로 받아온다.
//채팅 리스트 가져오기	getChatList -> 해당 유저가 속한 방을 찾아서 가져온다.
//채팅을 쓰면 속한 방, 유저 번호를 DB에 올려준다.
public class ChatDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public boolean makeChatRoom(String user_no) {
		String sql = "INSERT INTO chatting_room VALUES(NULL,?,NOW())";
		int result = 0;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);
			result = pstmt.executeUpdate();

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		return result == 1;
	}

	public String findChatRoom(String user_no) {
		String sql = "SELECT chatr_no FROM chat WHERE user_no = ?";
		String result = "";
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getString(1);
			} else {
				result = "-1";
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		return result;
	}

	public ArrayList<ChatDTO> getChatList(String chatr_no) {
		String sql = "SELECT * FROM chat WHERE chatr_no = ? ORDER BY chat_regdate";
		ChatDTO chat = null;
		ArrayList<ChatDTO> chats = new ArrayList<>();
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chatr_no);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				chat = new ChatDTO();
				chat.setUser_no(rs.getString("user_no"));
				chat.setChatr_no(rs.getString("chatr_no"));
				chat.setChat_content(rs.getString("chat_content"));
				chat.setChat_regdate(rs.getString("chat_regdate"));
				chat.setChat_images(rs.getString("chat_images"));
				chats.add(chat);
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		return chats;
	}

	public boolean submit(String user_no, String chatr_no, String chat_content, String images) {
		String sql = "INSERT INTO chat VALUES(?,?,?,NOW(),?)";
		int result = 0;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);
			pstmt.setString(2, chatr_no);
			pstmt.setString(3, chat_content);
			pstmt.setString(4, images);
			result = pstmt.executeUpdate();

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		return result == 1;
	}

}
