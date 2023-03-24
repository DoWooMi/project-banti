package xyz.itwill.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.ReviewDTO;

/*
이름        널?       유형            
--------- -------- ------------- 
R_RNUM    NOT NULL NUMBER(10)    
R_ONUM    NOT NULL NUMBER(10)    
R_PNUM    NOT NULL NUMBER(10)    
R_HEWONID NOT NULL VARCHAR2(50)  
R_REVIEW  NOT NULL VARCHAR2(200) 
R_DATE    NOT NULL DATE          
R_RATE             NUMBER(1)     
R_REF              NUMBER(4)     
R_RESTEP           NUMBER(4)     
R_RELEVEL          NUMBER(4)     
R_STATUS           NUMBER(1)   
*/

public class ReviewDAO extends JdbcDAO{

	private static ReviewDAO _dao;
	
	private ReviewDAO() {
		
	}
	
	static {
		_dao = new ReviewDAO();
	}
	
	public static ReviewDAO getDAO() {
		return _dao;
	}
	//
	//REVIEW 테이블에 저장된 전체 게시글의 갯수를 검색하여 반환하는 메소드
	public int selectReviewCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			//
			String sql="select count(*) from review where r_status=1";
			pstmt=con.prepareStatement(sql);
			//
			rs=pstmt.executeQuery();
			//
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectReviewCount() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	//검색 관련 정보 및 요청 페이지에 대한 시작 게시글의 행번호와 종료 게시글의 행번호를 전달
	//받아 review 테이블에 저장된 특정 게시글에서 해당 범위의 게시글만을 검색하여 반환하는 메소드
	public List<ReviewDTO> selectReviewList(int startRow, int endRow) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ReviewDTO> reviewList=new ArrayList<>();
		try {
			con=getConnection();
							
			
			String sql="select * from (select rownum rn,temp.* from "
					+ "(select r_rnum, orders.o_onum, product.p_pnum,hewon.h_hewonid,h_name,r_review, r_date,r_rate,"
					+ "r_ref, r_restep, r_relevel, r_status from review"
					+ " join hewon on hewon.h_hewonid = review.r_hewonid"
					+ " join orders on review.r_onum = orders.o_onum"
					+ " join product on orders.o_pnum = product.p_pnum order by"
					+ " r_ref desc, r_restep) temp) where rn between ? and ?";
				
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
									
			rs=pstmt.executeQuery();
					
			while(rs.next()) {
				ReviewDTO review=new ReviewDTO();
				review.setR_rnum(rs.getInt("r_rnum"));
				review.setR_onum(rs.getInt("o_onum"));
				review.setR_pnum(rs.getInt("p_pnum"));
				review.setR_hewonid(rs.getString("h_hewonid"));
				review.setWriter(rs.getString("h_name"));
				review.setR_review(rs.getString("r_review"));					
				review.setR_date(rs.getString("r_date"));
				review.setR_rate(rs.getInt("r_rate"));
				review.setR_ref(rs.getInt("r_ref"));
				review.setR_restep(rs.getInt("r_restep"));
				review.setR_relevel(rs.getInt("r_relevel"));
				review.setR_status(rs.getInt("r_status"));
				
				reviewList.add(review);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectReviewList() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return reviewList;
	}
	
	
	//REVIEW_SEQ 시퀸스의 다음값을 검색하여 반환하는 메소드
	public int selectNextNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int nextNum=0;
		try {
			con=getConnection();
			
			String sql="select review_seq.nextval from dual";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				nextNum=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNextNum() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return nextNum;
	}
	
	//게시글을 전달받아 review 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
	public int insertReview(ReviewDTO review) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into review values(?,?,?,?,?,SYSDATE,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, review.getR_rnum());
			pstmt.setInt(2, review.getR_onum());
			pstmt.setInt(3, review.getR_pnum());
			pstmt.setString(4, review.getR_hewonid());
			pstmt.setString(5, review.getR_review());
			pstmt.setInt(6, review.getR_rate());
			pstmt.setInt(7, review.getR_ref());
			pstmt.setInt(8, review.getR_restep());
			pstmt.setInt(9, review.getR_relevel());
			pstmt.setInt(10, review.getR_status());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertReview() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//부모글의 정보를 전달받아 review 테이블에 저장된 게시글에서 그룹이 같은 게시글 중 
	//부모글보다 순서가 높이 모든 게시글의 RE_STEP 컬럼값이 1씩 증가되도록 변경하고 
	//변경행의 갯수를 반환하는 메소드
	public int updateReStep(int r_ref, int r_restep) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update review set r_restep=r_restep+1 where r_ref=? and r_restep>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, r_ref);
			pstmt.setInt(2, r_restep);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateReStep() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public ReviewDTO selectReview(int r_rnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ReviewDTO review=null;
		try {
			con=getConnection();
			
			String sql="select r_rnum,r_onum,r_pnum,hewon.h_hewonid,h_name,r_date,r_rate,r_ref,"
					+ "r_restep,r_relevel,r_review,review.r_status from review join hewon"
					+ " on review.r_hewonid=hewon.h_hewonid where r_rnum=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, r_rnum);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				review = new ReviewDTO();
			
				review.setR_rnum(rs.getInt("r_rnum"));
				review.setR_onum(rs.getInt("o_onum"));
				review.setR_pnum(rs.getInt("p_pnum"));
				review.setR_hewonid(rs.getString("h_hewonid"));
				review.setWriter(rs.getString("h_name"));				
				review.setR_review(rs.getString("r_review"));
				review.setR_date(rs.getString("r_date"));				
				review.setR_rate(rs.getInt("r_rate"));
				review.setR_ref(rs.getInt("r_ref"));
				review.setR_restep(rs.getInt("r_restep"));
				review.setR_relevel(rs.getInt("r_relevel"));
				review.setR_status(rs.getInt("r_status"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectReview() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return review;
	}
	
	//게시글을 전달받아 REVIEW 테이블에 저장된 해당 게시글을 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateReview(ReviewDTO review) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update review set r_rate=?,r_review=?,r_status=? where r_rnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, review.getR_rate());
			pstmt.setString(2, review.getR_review());
			pstmt.setInt(3, review.getR_status());
			pstmt.setInt(4, review.getR_rnum());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateReview() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int updateRevieww(ReviewDTO review) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update review set r_status=0 where r_rnum=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, review.getR_rnum());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateRevieww() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//글번호와 글상태를 전달받아 REVIEW 테이블에 저장된 해당 글번호의 게시글에 대한 상태를
	//변경하고 변경행의 갯수를 반환하는 메소드
	public int updateStatus(int r_rnum, int r_status) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update review set r_status=? where r_rnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, r_status);
			pstmt.setInt(2, r_rnum);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateStatus() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int deleteReview(int r_rnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from review where r_rnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, r_rnum);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteReview() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
}