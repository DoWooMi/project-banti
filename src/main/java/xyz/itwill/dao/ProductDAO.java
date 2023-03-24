package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.HewonDTO;
import xyz.itwill.dto.ProductDTO;
import xyz.itwill.dto.ReviewDTO;

public class ProductDAO extends JdbcDAO {
	private static ProductDAO _dao;
	
	private ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new ProductDAO();
	}
	
	public static ProductDAO getDAO() {
		return _dao;
	}
	
	
		//카테고리를 전달받아 PRODUCT 테이블에 저장된 해당 카테고리의 모든 제품정보를 검색하여 반환하는 메소드
		// => PRODUCT 테이블에 저장된 모든 제품정보를 검색하여 반환
		public List<ProductDTO> selectProductList() {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<ProductDTO> productList=new ArrayList<>();
			try {
				con=getConnection();
				
				String sql="select * from product order by p_pnum";
				pstmt=con.prepareStatement(sql);
		
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					ProductDTO product=new ProductDTO();
					product.setP_pnum(rs.getInt("p_pnum"));
					product.setP_name(rs.getString("p_name"));
					product.setP_mainimg(rs.getString("p_mainimg"));
					product.setP_detailimg1(rs.getString("p_detailimg1"));
					product.setP_detailimg2(rs.getString("p_detailimg2"));
					product.setP_price(rs.getInt("p_price"));
					productList.add(product);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectProductList() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return productList;
		}
	
	
	//제품정보를 전달받아 PRODUCT 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
	public int insertProduct(ProductDTO product) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
					
			String sql="insert into product values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, product.getP_pnum());
			pstmt.setString(2, product.getP_name());
			pstmt.setInt(3, product.getP_price());
			pstmt.setString(4, product.getP_mainimg());
			pstmt.setString(5, product.getP_detailimg1());
			pstmt.setString(6, product.getP_detailimg2());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	//제품번호를 전달받아 PRODUCT 테이블에 저장된 해당 제품번호의 제품정보를 검색하여 반환하는 메소드
	public ProductDTO selectProduct(int p_pnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductDTO product=null;
		try {
			con=getConnection();
			
			String sql="select * from product where p_pnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, p_pnum);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				product=new ProductDTO();
				product.setP_pnum(rs.getInt("p_pnum"));
				product.setP_name(rs.getString("p_name"));
				product.setP_price(rs.getInt("p_price"));
				product.setP_mainimg(rs.getString("p_mainimg"));
				product.setP_detailimg1(rs.getString("p_detailimg1"));
				product.setP_detailimg2(rs.getString("p_detailimg2"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;
	}
	
	//제품명를 전달받아 product 테이블에 저장된 해당 제품정보를 삭제하고 삭제행의 갯수를 반환하는 메소드
	public int deleteProduct(String p_pnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			//String sql="delete from product where p_pnum=?";
			String sql="delete from product where p_pnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, p_pnum);
				
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteHewon() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//제품정보를 전달받아 PRODUCT 테이블에 저장된 해당 제품정보를 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateProduct(ProductDTO product) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			 		
			String sql="update product set p_name=?,p_mainimg=?,p_detailimg1=?,p_detailimg2=?,p_price=? where p_pnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, product.getP_name());
			pstmt.setString(2, product.getP_mainimg());
			pstmt.setString(3, product.getP_detailimg1());
			pstmt.setString(4, product.getP_detailimg2());
			pstmt.setInt(5, product.getP_price());
			pstmt.setInt(6, product.getP_pnum());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public HewonDTO selectHewonOrderedProduct(int p_pnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		HewonDTO hewon= null;
		try {
			con=getConnection();
			 		
			String sql="select p_pnum, o_onum, h_hewonid from product join orders"+
					" on product.p_pnum = orders.o_pnum join hewon"+
					" on orders.o_hewonid = hewon.h_hewonid"+
					" where o_status=3 AND h_status=1 and p_pnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, p_pnum);

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
			System.out.println("[에러]selectHewonOrderedProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return hewon;
	}
}