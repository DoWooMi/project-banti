package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import xyz.itwill.dto.PaymentDTO;

public class PaymentDAO extends JdbcDAO {
	
	private static PaymentDAO _dao;
	
	public PaymentDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new PaymentDAO();
	}

	public static PaymentDAO getDAO() {
		return _dao;
	}
	
	//주문 정보를 전달받아 orders table에 삽입하고 삽입행의 갯수를 반환하는 메소드
	public int insertPayment(PaymentDTO payment) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into payment values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, payment.getPay_paynum());
			pstmt.setInt(2, payment.getPay_onum());
			pstmt.setString(3, payment.getPay_hewonid());
			pstmt.setInt(4, payment.getPay_total());
			pstmt.setInt(5, payment.getPay_method());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertPayment() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	
	//주문번호와 결제번호 뒷자리의 일련번호를 반환하는 메소드 (payment_seq시퀀스 이용)
	public int paymentnextNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int nextNum=0;
		try {
			con=getConnection();
			
			String sql="select payment_seq.nextval from dual";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				nextNum=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("[에러]paymentnextNum() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return nextNum;
	}
	
	
}
