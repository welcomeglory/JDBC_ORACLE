package com.seoung.ex.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.seoung.ex.dto.MemberDto;

// 데이터를 직접 접속해서 데이터를 관리 및 수정합니다.
public class MemberDao {
	
	public static final int MEMBER_LOGIN_FAIL = 0; // 회원 로그인 실패 상태를 나타내는 상수입니다.
	public static final int MEMBER_LOGIN_SUCCESS = 1; // 회원 로그인 성공 상태를 나타내는 상수입니다.
	
	// 커넥션 풀 객체
	private DataSource dataSource = null;
	
	// 생성자에서 DataSource를 초기화합니다.
	public MemberDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 사용자의 아이디와 비밀번호를 확인하여 로그인 상태를 반환합니다.
	public int userCheck(String id, String pw){
		int result = MemberDao.MEMBER_LOGIN_FAIL; // 초기값을 로그인 실패로 설정합니다.
		
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		String sql = "select * from members where id = ? and pw = ?";
		
		try {
			con = dataSource.getConnection(); // 커넥션을 가져옵니다.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);	 
			rs = pstmt.executeQuery();
			
			if(rs.next()){ // 결과가 있다면 로그인 성공 상태로 변경합니다.
				pw = rs.getString("pw");
				id = rs.getString("id");
				System.out.println("로그인 정보 있음 id pw" + id + pw);
				result = MemberDao.MEMBER_LOGIN_SUCCESS;
			}  	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 리소스를 닫습니다.
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(con != null)
					con.close();		
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	// 아이디를 기준으로 회원 정보를 가져옵니다.
	public MemberDto getMember(String id){
		MemberDto dto = null;
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		String sql = "select * from members where id = ?";
		
		try {
			con = dataSource.getConnection(); // 커넥션을 가져옵니다.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){ // 결과가 있다면 MemberDto 객체에 값을 설정합니다.
				dto = new MemberDto();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));      		
			}  	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 리소스를 닫습니다.
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(con != null)
					con.close();		
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	// 회원 정보를 추가합니다.
	public int insertMember(MemberDto member){
		int result = 0;
		Connection con=null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into members values(?,?,?,?)";
		
		try {
			con = dataSource.getConnection(); // 커넥션을 가져옵니다.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getAddress());	    	
			// 실행한 결과 갯수를 리턴
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 리소스를 닫습니다.
				if(pstmt != null)
					pstmt.close();
				if(con != null)
					con.close();		
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	// 회원 정보를 업데이트합니다.
	public int updateMember(MemberDto dto) {
		int result = 0;
		Connection con=null;
		PreparedStatement pstmt = null;
		
		String sql = "update members set pw=?, email=?, address=?, where id=?";
		try {
			con = dataSource.getConnection(); // 커넥션을 가져옵니다.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getAddress());	    	
			// 실행한 결과 갯수를 리턴
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 리소스를 닫습니다.
				if(pstmt != null)
					pstmt.close();
				if(con != null)
					con.close();		
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		return result;
	}
}
