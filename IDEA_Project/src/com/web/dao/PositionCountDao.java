package com.web.dao;

import com.web.model.Admin;
import com.web.model.PositionCount;
import com.web.model.Staff;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class PositionCountDao {
    public List<PositionCount> PositionCountList(Connection con)throws SQLException{
        List<PositionCount> adminList = new LinkedList<PositionCount>();
        PositionCount positionCount = new PositionCount();
        String sql1 = "select count(*) as counts from staff where position=\"总裁\"";
        PreparedStatement pstmt1 = con.prepareStatement(sql1);
        ResultSet rs1 = pstmt1.executeQuery();
        while (rs1.next()) {
            positionCount.setPosition1(rs1.getInt("counts"));
        }


        String sql2 = "select count(*) as counts from staff where position=\"财务总监\"";
        PreparedStatement pstmt2 = con.prepareStatement(sql2);
        ResultSet rs2 = pstmt2.executeQuery();
        while (rs2.next()) {
            positionCount.setPosition2(rs2.getInt("counts"));
        }


        String sql3 = "select count(*) as counts from staff where position=\"技术总监\"";
        PreparedStatement pstmt3 = con.prepareStatement(sql3);
        ResultSet rs3 = pstmt3.executeQuery();
        while (rs3.next()) {
            positionCount.setPosition3(rs3.getInt("counts"));
        }


        String sql4 = "select count(*) as counts from staff where position=\"财务主管\"";
        PreparedStatement pstmt4 = con.prepareStatement(sql4);
        ResultSet rs4 = pstmt4.executeQuery();
        while (rs4.next()) {
            positionCount.setPosition4(rs4.getInt("counts"));
        }


        String sql5 = "select count(*) as counts from staff where position=\"技术主管\"";
        PreparedStatement pstmt5 = con.prepareStatement(sql5);
        ResultSet rs5 = pstmt5.executeQuery();
        while (rs5.next()) {
            positionCount.setPosition5(rs5.getInt("counts"));
        }


        String sql6 = "select count(*) as counts from staff where position=\"java开发师\"";
        PreparedStatement pstmt6 = con.prepareStatement(sql6);
        ResultSet rs6 = pstmt6.executeQuery();
        while (rs6.next()) {
            positionCount.setPosition6(rs6.getInt("counts"));
        }


        String sql7 = "select count(*) as counts from staff where position=\"python开发师\"";
        PreparedStatement pstmt7 = con.prepareStatement(sql7);
        ResultSet rs7 = pstmt7.executeQuery();
        while (rs7.next()) {
            positionCount.setPosition7(rs7.getInt("counts"));
        }


        String sql8 = "select count(*) as counts from staff where position=\"c开发师\"";
        PreparedStatement pstmt8 = con.prepareStatement(sql8);
        ResultSet rs8 = pstmt8.executeQuery();
        while (rs8.next()) {
            positionCount.setPosition8(rs8.getInt("counts"));
        }
        adminList.add(positionCount);


        return adminList;
    }
}
