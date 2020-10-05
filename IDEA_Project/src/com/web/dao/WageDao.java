package com.web.dao;

import com.web.model.Wage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class WageDao {

	public List<Wage> WageList(Connection con) throws SQLException {
		List<Wage> wageList = new LinkedList<Wage>();

		String sql = "select * from wage";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Wage wage = new Wage();
			wage.setSno(rs.getInt("sno"));
			wage.setName(rs.getString("name"));
			wage.setPosition(rs.getString("position"));
			wage.setYear(rs.getString("year"));
			wage.setMonth(rs.getString("month"));
			wage.setBasic_wage(rs.getDouble("basic_wage"));
			wage.setSubsidy(rs.getDouble("subsidy"));
			wage.setBonus(rs.getDouble("bonus"));
			wage.setTax(rs.getDouble("tax"));
			wage.setReal_wage(rs.getDouble("real_wage"));
			wageList.add(wage);
		}

		return wageList;
	}
	public boolean WageAdd(Connection con, Wage wage)
			throws SQLException {

		boolean isSuccess = true;
		// 查询数据库
		String sql = "select * from wage where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, wage.getId());
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			isSuccess = false;
		}
		if (isSuccess) {
			sql = "insert into wage values(null,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, wage.getSno());
			pstmt.setString(2, wage.getName());
			pstmt.setString(3, wage.getPosition());
			pstmt.setString(4, wage.getYear());
			pstmt.setString(5, wage.getMonth());
			pstmt.setDouble(6, wage.getBasic_wage());
			pstmt.setDouble(7, wage.getSubsidy());
			pstmt.setDouble(8, wage.getBonus());
			pstmt.setDouble(9,wage.getTax());
			pstmt.setDouble(10,wage.getReal_wage());
			pstmt.executeUpdate();
		}
		System.out.println("工资增加");
		return isSuccess;
	}

	public void WageDelete(Connection con, int id) throws SQLException {
		String sql = "delete from wage where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		pstmt.executeUpdate();
		System.out.println("工资删除成功");
	}

	public void WageUpdate(Connection con, Wage wage)
			throws SQLException {
		String sql = "update wage set name=?,position=?,year=?,month=?,basic_wage=?,subsidy=?,bonus=?,tax=?,real_wage=?,sno=? where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,wage.getName());;
		pstmt.setString(2, wage.getPosition());
		pstmt.setString(3, wage.getYear());
		pstmt.setString(4, wage.getMonth());
		pstmt.setDouble(5, wage.getBasic_wage());
		pstmt.setDouble(6, wage.getSubsidy());
		pstmt.setDouble(7, wage.getBonus());
		pstmt.setDouble(8, wage.getTax());
		pstmt.setDouble(9, wage.getReal_wage());
		pstmt.setInt(10, wage.getSno());
		pstmt.setInt(11, wage.getId());
		pstmt.executeUpdate();
		System.out.println("添加工资成功");
	}

	public Wage WageFindById(Connection con, int sno) throws SQLException {
		Wage currWage = null;
		// 查询数据库表
		String sql = "select * from wage where sno=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, sno);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			currWage = new Wage();
			currWage.setSno(rs.getInt("sno"));
			currWage.setName(rs.getString("name"));
			currWage.setPosition(rs.getString("position"));
			currWage.setYear(rs.getString("year"));
			currWage.setMonth(rs.getString("month"));
			currWage.setBasic_wage(rs.getDouble("basic_wage"));
			currWage.setSubsidy(rs.getDouble("subsidy"));
			currWage.setBonus(rs.getDouble("bonus"));
			currWage.setTax(rs.getDouble("tax"));
			currWage.setReal_wage(rs.getDouble("real_wage"));
			currWage.setId(rs.getInt("id"));
		}

		return currWage;
	}

	public List<Wage> WageFindByName(Connection con, String s_Text)
			throws SQLException {
		List<Wage> wagesList = new LinkedList<Wage>();

		String sql = "select * from wage where sno like '%" + s_Text + "%' ";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Wage wage = new Wage();
			wage.setSno(rs.getInt("sno"));
			wage.setName(rs.getString("name"));
			wage.setPosition(rs.getString("position"));
			wage.setYear(rs.getString("year"));
			wage.setMonth(rs.getString("month"));
			wage.setBasic_wage(rs.getDouble("basic_wage"));
			wage.setSubsidy(rs.getDouble("subsidy"));
			wage.setBonus(rs.getDouble("bonus"));
			wage.setTax(rs.getDouble("tax"));
			wage.setReal_wage(rs.getDouble("real_wage"));
			wage.setId(rs.getInt("id"));
			wagesList.add(wage);
		}

		return wagesList;
	}
}
