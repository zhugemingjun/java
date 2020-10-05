package com.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.web.model.Admin;

public class AdminDao {

	/**
	 * 
	 * @Title: Login @Description: TODO(登录) @param conn @param
	 *         admin @return @throws SQLException @return Admin 返回类型 @throws
	 */
	public Admin Login(Connection conn, Admin admin) throws SQLException {
		Admin currAdmin = null;
		// 查询数据库
		String sql = "select * from admin_ where username=? and password=? and role=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, admin.getUsername());
		pstmt.setString(2, admin.getPassword());
		pstmt.setString(3, admin.getRole());
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			currAdmin = new Admin();
			currAdmin.setId(rs.getInt("id"));
			currAdmin.setUsername(rs.getString("username"));
			currAdmin.setName(rs.getString("name"));
			currAdmin.setPhone_id(rs.getString("phone_id"));
			currAdmin.setRole(rs.getString("role"));
		}

		return currAdmin;
	}

	/**
	 * 
	 * @Title: AdminList @Description: TODO(Admin列表) @param conn @return @throws
	 *         SQLException 參數描述 @return List<Admin> 返回类型 @throws
	 */
	public List<Admin> AdminList(Connection conn) throws SQLException {
		List<Admin> adminList = new LinkedList<Admin>();

		// 查询数据库
		String sql = "select * from admin_";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Admin admin = new Admin();
			admin.setId(rs.getInt("id"));
			admin.setUsername(rs.getString("username"));
			admin.setName(rs.getString("name"));
			admin.setPhone_id(rs.getString("phone_id"));
			admin.setRole(rs.getString("role"));
			adminList.add(admin);
		}

		return adminList;
	}
	/**
	 * 
	 * @Title: AdminAdd @Description: TODO(添加管理员) @param con @param
	 *         admin @return @throws SQLException @return boolean 返回类型 @throws
	 */
	public boolean AdminAdd(Connection con, Admin admin) throws SQLException {

		boolean isSuccess = true;
		// 查询数据库
		String sql = "select * from admin_ where username=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, admin.getUsername());
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			isSuccess = false;
		}
		if (isSuccess) {
			sql = "insert into admin_ values(null,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, admin.getUsername());
			pstmt.setString(2, admin.getPassword());
			pstmt.setString(3, admin.getName());
			pstmt.setString(4, admin.getPhone_id());
			pstmt.setString(5, admin.getRole());
			pstmt.executeUpdate();
		}
		return isSuccess;
	}

	/**
	 * 
	 * @Title: AdminDelete @Description: TODO(删除管理员) @param con @param
	 *         id @throws SQLException 參數描述 @return void 返回类型 @throws
	 */
	public void AdminDelete(Connection con, int id) throws SQLException {
		String sql = "delete from admin_ where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		pstmt.executeUpdate();
	}
	/*修改管理员信息*/
	public void AdminUpdate(Connection con, Admin admin) throws SQLException {
		String sql = "update admin_ set username=?,password=?,name=?,email=?,role=? where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, admin.getUsername());
		pstmt.setString(2, admin.getPassword());
		pstmt.setString(3, admin.getName());
		pstmt.setString(4, admin.getPhone_id());
		pstmt.setString(5, admin.getRole());
		pstmt.setInt(6, admin.getId());
		pstmt.executeUpdate();
	}

	public Admin AdminFindById(Connection con, int id) throws SQLException {
		Admin currAdmin = null;
		// 查询数据库表
		String sql = "select * from admin_ where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			currAdmin = new Admin();
			currAdmin.setId(rs.getInt("id"));
			currAdmin.setUsername(rs.getString("username"));
			currAdmin.setPassword(rs.getString("password"));
			currAdmin.setName(rs.getString("name"));
			currAdmin.setPhone_id(rs.getString("phone_id"));
			currAdmin.setRole(rs.getString("role"));
		}

		return currAdmin;
	}
	public List<Admin> AdminFindByName(Connection con, String usertext)
			throws SQLException {
		List<Admin> adminList = new LinkedList<Admin>();

		String sql = "select * from admin_ where username like '%" + usertext
				+ "%' ";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Admin admin = new Admin();
			admin.setId(rs.getInt("id"));
			admin.setUsername(rs.getString("username"));
			admin.setName(rs.getString("name"));
			admin.setPhone_id(rs.getString("phone_id"));
			admin.setRole(rs.getString("role"));
			adminList.add(admin);
		}

		return adminList;
	}

	public List<Admin> AdminFindByPhone(Connection con, String usertext)
			throws SQLException {
		List<Admin> adminList = new LinkedList<Admin>();

		String sql = "select * from admin_ where phone_id like '%" + usertext
				+ "%' ";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Admin admin = new Admin();
			admin.setId(rs.getInt("id"));
			admin.setUsername(rs.getString("username"));
			admin.setName(rs.getString("name"));
			admin.setPhone_id(rs.getString("phone_id"));
			admin.setRole(rs.getString("role"));
			adminList.add(admin);
		}

		return adminList;
	}

	public List<Admin> AdminFindByRole(Connection con, String usertext)
			throws SQLException {
		List<Admin> adminList = new LinkedList<Admin>();

		String sql = "select * from admin_ where role = '"+ usertext +"'";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Admin admin = new Admin();
			admin.setId(rs.getInt("id"));
			admin.setUsername(rs.getString("username"));
			admin.setName(rs.getString("name"));
			admin.setPhone_id(rs.getString("phone_id"));
			admin.setRole(rs.getString("role"));
			adminList.add(admin);
		}

		return adminList;
	}
}
