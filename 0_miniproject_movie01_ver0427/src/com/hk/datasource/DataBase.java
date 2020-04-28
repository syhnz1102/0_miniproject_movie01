package com.hk.datasource;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataBase {
	public DataBase() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("1단계:드라이브로딩성공");
		} catch (ClassNotFoundException e) {
			System.out.println("1단계:드라이브로딩실패");
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws SQLException{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="hk";
		String password="hk";
		return DriverManager.getConnection(url,user,password);
	}
	
	public void close(ResultSet rs, PreparedStatement psmt, Connection conn) {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(psmt!=null) {
				psmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
			System.out.println("db닫기성공");
		} catch (SQLException e) {
			System.out.println("db닫기실패");
			e.printStackTrace();
		} catch (Exception e) {	//catch 여러개 가능, 큰게 더 뒤로 -> SQlException < Exception이므로 더 뒤에 와야한다.
			System.out.println("db닫기실패");
			e.printStackTrace();
		}
	}
		
}
