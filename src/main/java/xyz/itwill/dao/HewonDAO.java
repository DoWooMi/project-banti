package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.HewonDTO;
import xyz.itwill.dto.OrdersDTO;


public class HewonDAO extends JdbcDAO {
	private static HewonDAO _dao;
	
	private HewonDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new HewonDAO();
	}
	
	public static HewonDAO getDAO() {
		return _dao;
	}
	
	
	//아이디를 전달받아 hewon 테이블에 저장된 해당 아이디의 회원정보를 검색하여 반환하는 메소드
	public HewonDTO selectHewon(String h_hewonid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		HewonDTO hewon=null;
		try {
			con=getConnection();
			
			String sql="select * from hewon where h_hewonid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, h_hewonid);
			
			rs=pstmt.executeQuery();

			if(rs.next()) {
				hewon=new HewonDTO();
				hewon.setH_hewonid(rs.getString("h_hewonid"));
				hewon.setH_pw(rs.getString("h_pw"));
				hewon.setH_name(rs.getString("h_name"));
				hewon.setH_phone(rs.getString("h_phone"));
				hewon.setH_zipcode(rs.getString("h_zipcode"));
				hewon.setH_address1(rs.getString("h_address1"));
				hewon.setH_address2(rs.getString("h_address2"));
				hewon.setH_email(rs.getString("h_email"));
				hewon.setH_status(rs.getInt("h_status"));
				hewon.setH_joindate(rs.getString("h_joindate"));
				hewon.setH_lastlogin(rs.getString("h_lastlogin"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectHewon() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return hewon;
	}
	
	
	//회원정보를 전달받아 hewon 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
	public int insertHewon(HewonDTO hewon) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				
				String sql="insert into hewon values(?,?,?,?,?,?,?,?,1,sysdate,null)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, hewon.getH_hewonid());
				pstmt.setString(2, hewon.getH_pw());
				pstmt.setString(3, hewon.getH_name());
				pstmt.setString(4, hewon.getH_phone());
				pstmt.setString(5, hewon.getH_zipcode());
				pstmt.setString(6, hewon.getH_address1());
				pstmt.setString(7, hewon.getH_address2());
				pstmt.setString(8, hewon.getH_email());
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]insertHewon() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
	
		//아이디와 회원상태를 전달받아 Hewon 태이블에 저장된 해당 아이디의 회원정보에서 회원상태를
		//변경하고 변경행의 갯수를 반환하는 메소드
		public int updateH_Status(String h_hewonid, int h_status) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
					
				String sql="update hewon set h_status=? where h_hewonid=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, h_status);
				pstmt.setString(2, h_hewonid);
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]updateH_Status() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
	
		
		//아이디를 전달받아 Hewon 테이블에 저장된 해당 아이디의 회원정보에서 마지막 로그인 날짜를
		//변경하고 변경행의 갯수를 반환하는 메소드
		public int updateLastLogin(String h_hewonid) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update hewon set h_lastlogin=sysdate where h_hewonid=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, h_hewonid);
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]updateLastLogin() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
	
		//Hewon 테이블에 저장된 모든 회원정보를 검색하여 반환하는 메소드
		public List<HewonDTO> selectHewonList() {
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				List<HewonDTO> hewonList=new ArrayList<>();
				try {
					con=getConnection();
					
					String sql="select * from hewon order by h_hewonid";
					pstmt=con.prepareStatement(sql);
					
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						HewonDTO hewon=new HewonDTO();
						hewon.setH_hewonid(rs.getString("h_hewonid"));
						hewon.setH_pw(rs.getString("h_pw"));
						hewon.setH_name(rs.getString("h_name"));
						hewon.setH_phone(rs.getString("h_phone"));
						hewon.setH_zipcode(rs.getString("h_zipcode"));
						hewon.setH_address1(rs.getString("h_address1"));
						hewon.setH_address2(rs.getString("h_address2"));
						hewon.setH_email(rs.getString("h_email"));
						hewon.setH_status(rs.getInt("h_status"));
						hewon.setH_joindate(rs.getString("h_joindate"));
						hewon.setH_lastlogin(rs.getString("h_lastlogin"));
						hewonList.add(hewon);
					}
				} catch (SQLException e) {
					System.out.println("[에러]selectHewonList() 메소드의 SQL 오류 = "+e.getMessage());
				} finally {
					close(con, pstmt, rs);
				}
				return hewonList;
			}		

		
		//아이디를 전달받아 Hewon 테이블에 저장된 해당 아이디의 회원정보를 삭제하고 삭제행의 갯수를 반환하는 메소드
		public int deleteHewon(String h_hewonid) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="delete from hewon where h_hewonid=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, h_hewonid);
					
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]deleteHewon() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
		//회원정보를 전달받아 Hewon 테이블에 저장된 회원정보를 변경하고 변경행의 갯수를 반환하는 메소드
		
		public int updateHewon(HewonDTO hewon) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update hewon set h_pw=?,h_name=?,h_email=?,h_phone=?,h_zipcode=?"
						+ ",h_address1=?,h_address2=? where h_hewonid=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, hewon.getH_pw());
				pstmt.setString(2, hewon.getH_name());
				pstmt.setString(3, hewon.getH_email());
				pstmt.setString(4, hewon.getH_phone());
				pstmt.setString(5, hewon.getH_zipcode());
				pstmt.setString(6, hewon.getH_address1());
				pstmt.setString(7, hewon.getH_address2());
				pstmt.setString(8, hewon.getH_hewonid());
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]updateMember() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
		public HewonDTO selectProductOrderedHewon(String h_hewonid) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			HewonDTO orderedhewon=null;
					try {
				con=getConnection();
				String sql=" select h_hewonid, o_pnum, o_status"
						+ " from orders join hewon on hewon.h_hewonid = orders.o_hewonid"
						+ " join product on orders.o_pnum = product.p_pnum"
						+ " where h_hewonid =?"; 
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, h_hewonid);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					orderedhewon=new HewonDTO();
					orderedhewon.setH_hewonid(rs.getString("h_hewonid"));
					orderedhewon.setH_pw(rs.getString("h_pw"));
					orderedhewon.setH_name(rs.getString("h_name"));
					orderedhewon.setH_phone(rs.getString("h_phone"));
					orderedhewon.setH_zipcode(rs.getString("h_zipcode"));
					orderedhewon.setH_address1(rs.getString("h_address1"));
					orderedhewon.setH_address2(rs.getString("h_address2"));
					orderedhewon.setH_email(rs.getString("h_email"));
					orderedhewon.setH_status(rs.getInt("h_status"));
					orderedhewon.setH_joindate(rs.getString("h_joindate"));
					orderedhewon.setH_lastlogin(rs.getString("h_lastlogin"));
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectProductOrderedHewon() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return orderedhewon;
		}	
}