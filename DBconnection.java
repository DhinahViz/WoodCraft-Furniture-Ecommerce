package com.woodcraft.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {

	private static final String URL = "jdbc:mysql://localhost:3306/woodcraft_db";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "root";
	static Connection con = null;

	public static Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		System.out.println("connected");

		return con;
	}

}
