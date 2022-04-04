package com.conn.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Table_create {
	public void makeTable() {
		Connection conn = DBconnection.getConnection();
		try {
			PreparedStatement pstm = null;
			
			String sql = "CREATE TABLE test("
					+ "num int not null,"
					+ "name varchar(20),"
					+ "birthday DATE,"
					+ "primary key(num))";
			
			pstm = conn.prepareStatement(sql);
			pstm.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Table_create 오류" + e);
		}
	}
	
}
