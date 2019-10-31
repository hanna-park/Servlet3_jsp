package com.qq.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Random;

import org.junit.Test;

import com.qq.point.PointDAO;
import com.qq.point.PointDTO;
import com.qq.util.DBConnector;

public class PointDAOTest {
	
	
	@Test
	public void updateTest() throws Exception{
		PointDAO pointDAO = new PointDAO();
		PointDTO pointDTO = new PointDTO();
		
		pointDTO.setNum(26);
		pointDTO.setName("jj");
		pointDTO.setKor(20);
		pointDTO.setEng(20);
		pointDTO.setMath(20);
		pointDTO.setTotal(60);
		pointDTO.setAvg(20.0);
		
		Connection con = DBConnector.getConnection();
		int result =pointDAO.update(con, pointDTO);
		assertEquals(1,result);
	}
	
	
	//@Test
	public void insertTest() throws Exception{
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();
		
		for(int i=0;i<10;i++) {
			Random rs = new Random();
			PointDTO pointDTO = new PointDTO();
			pointDTO.setName("name"+i);
			pointDTO.setKor(rs.nextInt(101));
			pointDTO.setEng(rs.nextInt(101));
			pointDTO.setMath(rs.nextInt(101));
			pointDTO.setTotal(pointDTO.getKor()+pointDTO.getEng()+pointDTO.getMath());
			pointDTO.setAvg(pointDTO.getTotal()/3.0);
			
			pointDAO.insert(con, pointDTO);
			
			Thread.sleep(500); // 500쉬었다가 올라가기
		}
		con.close();
		
	}
	
	
	
	//@Test
	public void selectList() throws Exception{
			PointDAO pointDAO = new PointDAO();
			Connection con = DBConnector.getConnection();
			
			ArrayList<PointDTO> ar = pointDAO.selectList(con);
			
			assertNull(ar.get(0));
		
	}
	
	//@Test
	public void selectOneTest() throws Exception{
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();
		
		PointDTO pointDTO = pointDAO.selectOne(con, 23);
		assertNull(pointDTO);
	}
	
	
	
	//@Test
	public void test2() throws Exception{
		Connection con = DBConnector.getConnection();
		assertNotNull(con);
		
	}

	//@Test
	public void test() throws Exception {
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();
		
		int result=pointDAO.delete(con, 1256);
		
		//단정문
		assertEquals(1,result);
		
		
	}

}
