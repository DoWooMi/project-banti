package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.CartDTO;
import xyz.itwill.dto.ProductDTO;

public class CartDAO extends JdbcDAO {
	private static CartDAO _dao;
	
	public CartDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new CartDAO();
	}

	public static CartDAO getDAO() {
		return _dao;
	}
	
	
	//id를 전달받아 cart테이블에 저장된 모든 정보를 검색하여 반환하는 메소드
	public List<CartDTO> selectCartList(String c_hewonid){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CartDTO> cartList=new ArrayList<>();
		try {
			con=getConnection();
			String sql="select * from cart where c_hewonid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, c_hewonid);
			
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				CartDTO cart=new CartDTO();
				cart.setC_cnum(rs.getInt("c_cnum"));
				cart.setC_hewonid(rs.getString("c_hewonid"));
				cart.setC_pnum(rs.getInt("c_pnum"));
				cart.setC_quantity(rs.getInt("c_quantity"));
				cartList.add(cart);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectCartList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return cartList;
	}
	
	
	
	
	
	//cart번호를 전달받아 cart테이블에 저장된 정보를 검색하여 반환하는 메소드
	public CartDTO selectCart(int c_cnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CartDTO cart=null;
		try {
			con=getConnection();
			String sql="select * from cart where c_cnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, c_cnum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cart=new CartDTO();
				cart.setC_cnum(rs.getInt("c_cnum"));
				cart.setC_hewonid(rs.getString("c_hewonid"));
				cart.setC_pnum(rs.getInt("c_pnum"));
				cart.setC_quantity(rs.getInt("c_quantity"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectCart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return cart;
	}
	
	
	//cart 테이블에 저장된 상품번호를 전달 받아 해당 상품번호의 상품을 검색하여 반환하는 메소드
	public ProductDTO selectProduct(int c_pnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductDTO cartProduct=null;
		try {
			con=getConnection();
			String sql="select p_name,p_price, p_mainimg from product join cart on c_pnum=p_pnum where c_pnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, c_pnum);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cartProduct=new ProductDTO();
				cartProduct.setP_name(rs.getString("p_name"));
				cartProduct.setP_price(rs.getInt("p_price"));
				cartProduct.setP_mainimg(rs.getString("p_mainimg"));
				
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return cartProduct;
	}
	
	
	//id를 전달받아 cart table에 저장된 장바구니 상품 갯수를 검색하여 반환하는 메소드
	public int selectCartCount(String c_hewonid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from cart where c_hewonid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, c_hewonid);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectCartCount() 메소드의 SQL 오류 = "+e.getMessage());					
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	
	//시퀀스 다음번호인 cart번호 출력
	public int selectCartNextNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int cartnextNum=0;
		try {
			con=getConnection();
			
			String sql="select cart_seq.nextval from dual";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cartnextNum=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNextNum() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return cartnextNum;
	}
	
	
	
	
	//cart번호를 전달받아 cart 테이블에 저장된 해당 상품번호의 상품을 검색하여 삭제하는 메소드
	public int deletecart(int c_cnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			
			con=getConnection();
			String sql="delete from cart where c_cnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, c_cnum);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deletecart() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	//cart table 전체삭제

	public int alldeletecart() {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			
			con=getConnection();
			String sql="delete from cart";
			pstmt=con.prepareStatement(sql);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]alldeletecart() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//장바구니 정보를 전달받아 cart table에 삽입하고 삽입행의 갯수를 반환하는 메소드
	public int insertCart(CartDTO cart) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into cart values(cart_seq.nextval,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, cart.getC_hewonid());
			pstmt.setInt(2, cart.getC_pnum());
			pstmt.setInt(3, cart.getC_quantity());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertCart() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
}
