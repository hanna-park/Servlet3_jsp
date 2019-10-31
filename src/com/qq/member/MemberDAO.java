package com.qq.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class MemberDAO {
	
	//insert
	public int memberInsert(Connection con, MemberDTO memberDTO) throws Exception {
		int result = 0;
		String sql = "insert into member values(?,?,?,?,?,?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getPhone());
		st.setInt(6, memberDTO.getGrade());
		
		st.close();
		con.close();
		
		return result;
	}
	
	//update
	public int memberUpdate(Connection con, MemberDTO memberDTO) throws Exception{
		int result=0;
		String sql = "update member set pw=? phone=? where id=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getPw());
		st.setString(2, memberDTO.getPhone());
		st.setString(3, memberDTO.getId());
		
		result = st.executeUpdate();
		
		st.close();
		con.close();
		
		return result;
	}
	
	
}
