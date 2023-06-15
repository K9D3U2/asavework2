package com.tech.w01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	public static Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "hr";
		String pw = "123456";
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("JDBC ����̹� ���� ����!");
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("DB ���� ����!");
		} catch (ClassNotFoundException e) {
			System.out.println("����̹� ����!");
		} catch (SQLException e) {
			System.out.println("DB ���� ����!");
		}
		
		return conn;
	}
}