package com.tech.w01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {
	private static AccountDAO instance;
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;

	public AccountDAO() {
		conn = DBConnector.getConnection();
	}

	public static AccountDAO getInstance() {
		if (instance == null)
			instance = new AccountDAO();

		return instance;
	}

	// 0: ok, 1: 존재하지 않는 계정, -1: 에러
	public int checkAccount(AccountBean ab) {
		String sql = "select * from test where id = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ab.getId());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String dbId = rs.getString("id");
				String dbPw = rs.getString("pw");

				if (dbId.equals(ab.getId()) && dbPw.equals(ab.getPw()))
					return 0;
			}

			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return -1;
	}
}