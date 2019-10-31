package com.pp.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoticeDAO {
	
	//List
	public ArrayList<NoticeDTO> noticeList(Connection con) throws Exception{
		ArrayList<NoticeDTO> ar = new ArrayList<NoticeDTO>();
		
		String sql = "select * from notice order by num desc";
		
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
			ar.add(noticeDTO);
		}
		
		rs.close();
		st.close();
		
		return ar;
	}
	
	//글 하나보기
	public NoticeDTO noticeSelect(Connection con, int num) throws Exception {
		
		String sql = "select * from notice where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
			
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		
		NoticeDTO noticeDTO = null;
		
		if(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
			
		}
		
		rs.close();
		st.close();
		
		return noticeDTO;
		
	}
	
	//글 쓰기
	public int noticeWrite(Connection con, NoticeDTO noticeDTO) throws Exception {
		String sql = "insert into notice values (point_seq.nextval,?,?,?,sysdate,0)";
		int result = 0;
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getWriter());
		st.setString(3, noticeDTO.getContents());
		
		result =st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	//글 수정
	public int noticeUpdate(Connection con,NoticeDTO noticeDTO) throws Exception {
		String sql = "update notice set title=?, writer=?,contents=? where num=?";
		int result = 0;
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getWriter());
		st.setString(3, noticeDTO.getContents());
		st.setInt(4, noticeDTO.getNum());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
		
	}
	
	//글 삭제
	public int noticeDelete(Connection con, int num) throws Exception {
		String sql = "delete notice where num=?";
		int result = 0;
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
}
