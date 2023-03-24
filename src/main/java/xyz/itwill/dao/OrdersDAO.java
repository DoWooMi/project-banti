package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.OrdersDTO;
import xyz.itwill.dto.ProductDTO;

public class OrdersDAO extends JdbcDAO {
	private static OrdersDAO _dao;
	
	private OrdersDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new OrdersDAO();
	}
	
	public static OrdersDAO getDAO() {
		return _dao;
	}
	
	
	
		//회원아이디를 전달받아 ORDERS 테이블에 저장된 회원의 주문정보를 검색하여 반환하는 메소드
		public List<OrdersDTO> selecthewonOrders(String o_hewonid) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<OrdersDTO> orderhewonlist=new ArrayList<>();
			try {
				con=getConnection();
				
				String sql="select * from orders where o_hewonid=? order by o_onum";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, o_hewonid);
				
				rs=pstmt.executeQuery();
				
				while (rs.next()) {
					OrdersDTO orderslist=new OrdersDTO();
					orderslist.setO_onum(rs.getInt("o_onum"));
					orderslist.setO_status(rs.getInt("o_status"));
					orderslist.setO_date(rs.getString("o_date"));
					orderslist.setO_comment(rs.getString("o_comment"));
					orderslist.setO_hewonid(rs.getString("o_hewonid"));
					orderslist.setO_quantity(rs.getInt("o_quantity"));
					orderslist.setO_pnum(rs.getInt("o_pnum"));
					orderslist.setO_address1(rs.getString("o_address1"));
					orderslist.setO_address2(rs.getString("o_address2"));
					orderslist.setO_zipcode(rs.getString("o_zipcode"));
					orderslist.setO_phone(rs.getString("o_phone"));
					orderhewonlist.add(orderslist);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectOrders() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return orderhewonlist;
		}
		
		
		//order번호를 전달받아 order 테이블에 저장된 해당 상품번호의 값을 검색하여 반환하는 메소드
		public ProductDTO selectProduct(int o_pnum) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ProductDTO orderProduct=null;
			try {
				con=getConnection();
				String sql="select p_pnum, p_name,p_price from product join orders on o_pnum=p_pnum where o_pnum=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, o_pnum);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					orderProduct=new ProductDTO();
					orderProduct.setP_pnum(rs.getInt("p_pnum"));
					orderProduct.setP_name(rs.getString("p_name"));
					orderProduct.setP_price(rs.getInt("p_price"));
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectProduct() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return orderProduct;
		}
	
	
	//주문정보를 전달받아 ORDERS 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
	public int insertOrders(OrdersDTO orders) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into orders values(?,0,sysdate,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, orders.getO_onum());
			pstmt.setString(2, orders.getO_comment());
			pstmt.setString(3, orders.getO_hewonid());			
			pstmt.setInt(4, orders.getO_quantity());
			pstmt.setInt(5, orders.getO_pnum());
			pstmt.setString(6, orders.getO_address1());
			pstmt.setString(7, orders.getO_address2());
			pstmt.setString(8, orders.getO_zipcode());
			pstmt.setString(9, orders.getO_phone());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertOrders() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//주문번호를 전달받아 ORDERS 테이블에 저장된 주문정보를 검색하여 반환하는 메소드
	public OrdersDTO selectOrders(int o_onum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		OrdersDTO orders=null;
		try {
			con=getConnection();
			
			String sql="select * from orders where O_onum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, o_onum);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				orders=new OrdersDTO();
				orders.setO_onum(rs.getInt("o_onum"));
				orders.setO_pnum(rs.getInt("p_onum"));
				orders.setO_quantity(rs.getInt("O_quantity"));
				orders.setO_hewonid(rs.getString("o_hewonid"));
				orders.setO_comment(rs.getString("o_comment"));
				orders.setO_phone(rs.getString("o_phone"));
				orders.setO_zipcode(rs.getString("o_zipcode"));
				orders.setO_address1(rs.getString("o_address1"));
				orders.setO_address2(rs.getString("o_address2"));
				orders.setO_date(rs.getString("o_date"));
				orders.setO_status(rs.getInt("o_status"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectOrders() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orders;
	}
	
	
	//주문번호를 전달받아 ORDERS 테이블에 저장된 주문정보를 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateOrders(OrdersDTO orders) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update orders set o_comment=?,o_phone=?,zipcode=?,address1=?,address2=? where O_onum=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, orders.getO_comment());
			pstmt.setString(2, orders.getO_phone());
			pstmt.setString(3, orders.getO_zipcode());
			pstmt.setString(4, orders.getO_address1());
			pstmt.setString(5, orders.getO_address2());			
			pstmt.setInt(8, orders.getO_pnum());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateOrders() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//아이디와 회원상태를 전달받아 ORDERS 테이블에 저장된 해당 아이디의 회원정보에서 회원상태를
	//변경하고 변경행의 갯수를 반환하는 메소드
	public int updateO_Status(String o_hewonid, int o_status) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update orders set o_status=? where o_hewonid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, o_status);
			pstmt.setString(2, o_hewonid);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateStatus() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//ORDERS 테이블에 저장된 모든 회원정보를 검색하여 반환하는 메소드
	public List<OrdersDTO> selectOrdersList() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrdersDTO> ordersList=new ArrayList<>();
		try {
			con=getConnection();
			
			String sql="select * from orders order by o_onum";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				OrdersDTO orders=new OrdersDTO();
				orders.setO_onum(rs.getInt("o_onum"));
				orders.setO_pnum(rs.getInt("o_pnum"));
				orders.setO_quantity(rs.getInt("o_quantity"));
				orders.setO_hewonid(rs.getString("o_hewonid"));
				orders.setO_comment(rs.getString("o_comment"));
				orders.setO_phone(rs.getString("o_phone"));
				orders.setO_zipcode(rs.getString("o_zipcode"));
				orders.setO_address1(rs.getString("o_address1"));
				orders.setO_address2(rs.getString("o_address2"));
				orders.setO_date(rs.getString("o_date"));
				orders.setO_status(rs.getInt("o_status"));
				ordersList.add(orders);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectOrdersList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return ordersList;
	}
	
	//아이디를 전달받아 ORDERS 테이블에 저장된 해당 아이디의 회원정보를 삭제하고 삭제행의 갯수를 반환하는 메소드
	public int deleteOrders(String o_hewonid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from orders where o_onum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, o_hewonid);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteOrders() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	

	
}