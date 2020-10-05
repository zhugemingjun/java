package com.web.dao;

import com.web.model.Staff;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class StaffDao {

	public List<Staff> StaffList(Connection con) throws SQLException {
		List<Staff> staffList = new LinkedList<Staff>();

		String sql = "select * from staff";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Staff staff = new Staff();
			staff.setSno(rs.getInt("sno"));
			staff.setName(rs.getString("name"));
			staff.setSex(rs.getString("sex"));
			staff.setPosition(rs.getString("position"));
			staff.setPhone_id(rs.getString("phone_id"));
			staff.setEnroldate(rs.getString("enroldate"));

			staffList.add(staff);
		}

		return staffList;
	}

	public boolean StaffAdd(Connection con, Staff staff)
			throws SQLException {

		boolean isSuccess = true;
		// 查询数据库
		String sql = "select * from staff where sno=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, staff.getSno());
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			isSuccess = false;
		}
		if (isSuccess) {
			sql = "insert into staff values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, staff.getSno());
			pstmt.setString(2, staff.getName());
			pstmt.setString(3, staff.getSex());
			pstmt.setString(4, staff.getPosition());
			pstmt.setString(5, staff.getPhone_id());
			pstmt.setString(6, staff.getEnroldate());
			pstmt.executeUpdate();
		}
		System.out.println("添加成功");
		return isSuccess;
	}

	public void StaffDelete(Connection con, int sno) throws SQLException {
		String sql = "delete from staff where sno=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, sno);
		pstmt.executeUpdate();
		System.out.println("删除成功");
	}

	public void StaffUpdate(Connection con, Staff staff)
			throws SQLException {
		String sql = "update staff set name=?,sex=?,position =?,phone_id=?,enroldate=? where sno=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, staff.getName());
		pstmt.setString(2, staff.getSex());
		pstmt.setString(3, staff.getPosition());
		pstmt.setString(4, staff.getPhone_id());
		pstmt.setString(5, staff.getEnroldate());
		pstmt.setInt(6, staff.getSno());
		pstmt.executeUpdate();
	}

	public Staff StaffFindById(Connection con, int sno) throws SQLException {
		Staff currStaff = null;
		// 查询数据库表
		String sql = "select * from staff where sno=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, sno);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			currStaff = new Staff();
			currStaff.setSno(rs.getInt("sno"));
			currStaff.setName(rs.getString("name"));
			currStaff.setSex(rs.getString("sex"));
			currStaff.setPosition(rs.getString("position"));
			currStaff.setPhone_id(rs.getString("phone_id"));
			currStaff.setEnroldate(rs.getString("enroldate"));
		}

		return currStaff;
	}

	public List<Staff> StaffFindByName(Connection con, String s_Text)
			throws SQLException {
		List<Staff> StaffList = new LinkedList<Staff>();

		String sql = "select * from staff where sno like '%" + s_Text + "%' ";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Staff Staff = new Staff();
			Staff.setSno(rs.getInt("sno"));
			Staff.setName(rs.getString("name"));
			Staff.setSex(rs.getString("sex"));
			Staff.setPosition(rs.getString("position"));
			Staff.setPhone_id(rs.getString("phone_id"));
			Staff.setEnroldate(rs.getString("enroldate"));
			StaffList.add(Staff);
		}

		return StaffList;
	}
}
