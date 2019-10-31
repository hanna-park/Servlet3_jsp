package com.qq.point;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.qq.util.DBConnector;


public class PointDAO {
	
	
	//update
	public int update(Connection con, PointDTO pointDTO) throws Exception {
		int result =0;
		
		String sql = "update point set name=?,kor=?, eng=?, math=?,total =?,avg=? where num =?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMath());
		st.setInt(5, pointDTO.getKor()+pointDTO.getEng()+pointDTO.getMath());
		st.setDouble(6, pointDTO.getTotal()/3.0);
		st.setInt(7, pointDTO.getNum());
		
		result= st.executeUpdate();
		
		st.close();
		return result;
	}
	
	
	
	//insert
	public int insert(Connection con, PointDTO pointDTO) throws Exception {
		int result = 0;
		
		String sql = "insert into point values (point_seq.nextval,?,?,?,?,?,?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, pointDTO.getName());
		st.setInt(2,pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMath());
		st.setInt(5, pointDTO.getTotal());
		st.setDouble(6, pointDTO.getAvg());
		
		result = st.executeUpdate();
				
		st.close();
		
		return result;
	}
	
	
	//delete
	public int delete(Connection con, int num) throws Exception {
		int result=0;
		
		String sql = "delete from point where num =?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1,num);
		
		result = st.executeUpdate();
		
		st.close();
		return result;
	}
	
	//selectOne
	public PointDTO selectOne(Connection con, int num) throws Exception{
		
		String sql = "select * from point where num=?";
		
		PreparedStatement st  =con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		
		PointDTO pointDTO = null;
		
		if(rs.next()) {
			pointDTO = new PointDTO();
			pointDTO.setNum(rs.getInt("num"));
			pointDTO.setName(rs.getString("name"));
			pointDTO.setKor(rs.getInt("kor"));
			pointDTO.setEng(rs.getInt("eng"));
			pointDTO.setMath(rs.getInt("math"));
			pointDTO.setTotal(rs.getInt("total"));
			pointDTO.setAvg(rs.getDouble("avg"));
			
		}
		
		rs.close();
		st.close();
		return pointDTO;
	}
	
	//selectList 최신번호순
	
	public ArrayList<PointDTO> selectList(Connection con) throws Exception{
		ArrayList<PointDTO> ar = new ArrayList<PointDTO>();
		
		String sql = "select * from point ORDER BY num desc";
		
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			PointDTO pointDTO = new PointDTO();
			pointDTO.setNum(rs.getInt("num"));
			pointDTO.setName(rs.getString("name"));
			pointDTO.setKor(rs.getInt("kor"));
			pointDTO.setEng(rs.getInt("eng"));
			pointDTO.setMath(rs.getInt("math"));
			pointDTO.setTotal(rs.getInt("total"));
			pointDTO.setAvg(rs.getDouble("avg"));
			ar.add(pointDTO);
		}
		
		
		return ar;
	}
	
}
