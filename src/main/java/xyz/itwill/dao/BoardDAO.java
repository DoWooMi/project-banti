package xyz.itwill.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.BoardDTO;
/*
이름         널?       유형             
---------- -------- -------------- 
B_BNUM     NOT NULL NUMBER(10)     
B_HEWONID           VARCHAR2(20)   
B_TITLE             VARCHAR2(500)  
B_DATE              DATE           
B_TYPE              NUMBER(1)      
B_REF               NUMBER(4)      
B_RESTEP            NUMBER(4)      
B_RELEVEL           NUMBER(4)      
B_QUESTION          VARCHAR2(4000) 
B_STATUS            NUMBER(1)    
 */

public class BoardDAO extends JdbcDAO{

	private static BoardDAO _dao;
	
	private BoardDAO() {
		
	}
	
	static {
		_dao = new BoardDAO();
	}
	
	public static BoardDAO getDAO() {
		return _dao;
	}
	
	public int selectQnaBoardCount(String search, String keyword ) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			if(keyword.equals("")) {//검색 기능을 사용하지 않은 경우
				String sql="select count(*) from board where b_type=0";
				pstmt=con.prepareStatement(sql);
			} else {//검색 기능을 사용한 경우
				//검색대상(컬럼명)은 값이 아니므로 ?(InParameter)로 사용 불가능
				String sql="select count(*) from board join hewon on board.b_hewonid=hewon.h_hewonid"
						+ " where "+search+" like '%'||?||'%' and board.b_status<>0 and b_type=0";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectQnaBoardCount() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	public int selectQuotBoardCount(String search, String keyword ) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			if(keyword.equals("")) {//검색 기능을 사용하지 않은 경우
				String sql="select count(*) from board where b_type=1";
				pstmt=con.prepareStatement(sql);
			} else {//검색 기능을 사용한 경우
				//검색대상(컬럼명)은 값이 아니므로 ?(InParameter)로 사용 불가능
				String sql="select count(*) from board join hewon on board.b_hewonid=hewon.h_hewonid"
						+ " where "+search+" like '%'||?||'%' and board.b_status<>0 and b_type=1";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectQuotBoardCount() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	public int selectBoardCount(String search, String keyword ) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			if(keyword.equals("")) {//검색 기능을 사용하지 않은 경우
				String sql="select count(*) from board";
				pstmt=con.prepareStatement(sql);
			} else {//검색 기능을 사용한 경우
				//검색대상(컬럼명)은 값이 아니므로 ?(InParameter)로 사용 불가능
				String sql="select count(*) from board join hewon on board.b_hewonid=hewon.h_hewonid"
						+ " where "+search+" like '%'||?||'%' and board.b_status<>0";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectBoardCount() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	

	public List<BoardDTO> selectQnaBoardList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoardDTO> boardList=new ArrayList<>();
		try {
			con=getConnection();
							
			if(keyword.equals("")) {
				String sql="select * from (select rownum rn,temp.* from "
					+ "(select b_bnum,hewon.h_hewonid,h_name,b_title,b_date,b_type,b_ref,"
					+ "b_restep,b_relevel,b_question,board.b_status from board join hewon"
					+ " on board.b_hewonid=hewon.h_hewonid where b_type=0"
					+ " order by b_ref desc, b_restep) temp) where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				String sql="select * from (select rownum rn,temp.* from "
						+ "(select b_bnum,hewon.h_hewonid,h_name,b_title,b_date,b_type,b_ref,"
						+ "b_restep,b_relevel,b_question,board.b_status from board join hewon"
						+ " on board.b_hewonid=hewon.h_hewonid"
						+ " where "+search+" like '%'||?||'%' and b_type=0 and board.b_status<>0 order by"
						+ " b_ref desc, b_restep) temp) where rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();
					
			while(rs.next()) {
				BoardDTO board=new BoardDTO();
				board.setB_bnum(rs.getInt("b_bnum"));
				board.setB_hewonid(rs.getString("h_hewonid"));
				board.setWriter(rs.getString("h_name"));
				board.setB_title(rs.getString("b_title"));
				board.setB_date(rs.getString("b_date"));
				board.setB_ref(rs.getInt("b_ref"));
				board.setB_restep(rs.getInt("b_restep"));
				board.setB_relevel(rs.getInt("b_relevel"));
				board.setB_question(rs.getString("b_question"));
				board.setB_status(rs.getInt("b_status"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectQnaBoardList() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return boardList;
	}
	
	public List<BoardDTO> selectQuotBoardList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoardDTO> boardList=new ArrayList<>();
		try {
			con=getConnection();
							
			if(keyword.equals("")) {
				String sql="select * from (select rownum rn,temp.* from "
					+ "(select b_bnum,hewon.h_hewonid,h_name,b_title,b_date,b_type,b_ref,"
					+ "b_restep,b_relevel,b_question,board.b_status from board join hewon"
					+ " on board.b_hewonid=hewon.h_hewonid where b_type=1"
					+ " order by b_ref desc, b_restep) temp) where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				String sql="select * from (select rownum rn,temp.* from "
						+ "(select b_bnum,hewon.h_hewonid,h_name,b_title,b_date,b_type,b_ref,"
						+ "b_restep,b_relevel,b_question,board.b_status from board join hewon"
						+ " on board.b_hewonid=hewon.h_hewonid"
						+ " where "+search+" like '%'||?||'%' and b_type=1 and board.b_status<>0 order by"
						+ " b_ref desc, b_restep) temp) where rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();
					
			while(rs.next()) {
				BoardDTO board=new BoardDTO();
				board.setB_bnum(rs.getInt("b_bnum"));
				board.setB_hewonid(rs.getString("h_hewonid"));
				board.setWriter(rs.getString("h_name"));
				board.setB_title(rs.getString("b_title"));
				board.setB_date(rs.getString("b_date"));
				board.setB_ref(rs.getInt("b_ref"));
				board.setB_restep(rs.getInt("b_restep"));
				board.setB_relevel(rs.getInt("b_relevel"));
				board.setB_question(rs.getString("b_question"));
				board.setB_status(rs.getInt("b_status"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectQuotBoardList() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return boardList;
	}
	
	//검색 관련 정보 및 요청 페이지에 대한 시작 게시글의 행번호와 종료 게시글의 행번호를 전달
	//받아 BOARD 테이블에 저장된 특정 게시글에서 해당 범위의 게시글만을 검색하여 반환하는 메소드
	public List<BoardDTO> selectBoardList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoardDTO> boardList=new ArrayList<>();
		try {
			con=getConnection();
							
			if(keyword.equals("")) {
				String sql="select * from (select rownum rn,temp.* from "
					+ "(select b_bnum,hewon.h_hewonid,h_name,b_title,b_date,b_type,b_ref,"
					+ "b_restep,b_relevel,b_question,board.b_status from board join hewon"
					+ " on board.b_hewonid=hewon.h_hewonid"
					+ " order by b_ref desc, b_restep) temp) where rn between ? and ?";
				
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
			} else {
				String sql="select * from (select rownum rn,temp.* from "
					+ "(select b_bnum,hewon.h_hewonid,h_name,b_title,b_date,b_type,b_ref,"
					+ "b_restep,b_relevel,b_question,board.b_status from board join hewon"
					+ " on board.b_hewonid=hewon.h_hewonid"
					+ " where "+search+" like '%'||?||'%' and board.b_status<>0 order by"
					+ " b_ref desc, b_restep) temp) where rn between ? and ?";
				
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();
					
			while(rs.next()) {
				BoardDTO board=new BoardDTO();
				board.setB_bnum(rs.getInt("b_bnum"));
				board.setB_hewonid(rs.getString("h_hewonid"));
				board.setWriter(rs.getString("h_name"));
				board.setB_title(rs.getString("b_title"));
				board.setB_date(rs.getString("b_date"));
				board.setB_ref(rs.getInt("b_ref"));
				board.setB_restep(rs.getInt("b_restep"));
				board.setB_relevel(rs.getInt("b_relevel"));
				board.setB_question(rs.getString("b_question"));
				board.setB_status(rs.getInt("b_status"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectBoardList() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return boardList;
	}
	
	
	//BOARD_SEQ 시퀸스의 다음값을 검색하여 반환하는 메소드
	public int selectNextNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int nextNum=0;
		try {
			con=getConnection();
			
			String sql="select board_seq.nextval from dual";
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
	
	//게시글을 전달받아 BOARD 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
	public int insertBoard(BoardDTO board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into board values(?,?,?,sysdate,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board.getB_bnum());
			pstmt.setString(2, board.getB_hewonid());
			pstmt.setString(3, board.getB_title());
			pstmt.setInt(4, board.getB_type());
			pstmt.setInt(5, board.getB_ref());
			pstmt.setInt(6, board.getB_restep());
			pstmt.setInt(7, board.getB_relevel());
			pstmt.setString(8, board.getB_question());
			pstmt.setInt(9, board.getB_status());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertBoard() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//부모글의 정보를 전달받아 BOARD 테이블에 저장된 게시글에서 그룹이 같은 게시글 중 
	//부모글보다 순서가 높이 모든 게시글의 RE_STEP 컬럼값이 1씩 증가되도록 변경하고 
	//변경행의 갯수를 반환하는 메소드
	public int updateReStep(int b_ref, int b_restep) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update board set b_restep=b_restep+1 where b_ref=? and b_restep>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, b_ref);
			pstmt.setInt(2, b_restep);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateReStep() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//글번호를 전달받아 BOARD 테이블에 저장된 해당 글번호의 게시글을 검색하여 반환하는 메소드
	public BoardDTO selectBoard(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardDTO board=null;
		try {
			con=getConnection();
			
			String sql="select b_bnum,hewon.h_hewonid,h_name,b_title,b_date,b_type,b_ref,"
					+ "b_restep,b_relevel,b_question,board.b_status from board join hewon"
					+ " on board.b_hewonid=hewon.h_hewonid where b_bnum=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				board=new BoardDTO();
			
				board.setB_bnum(rs.getInt("b_bnum"));
				board.setB_hewonid(rs.getString("h_hewonid"));
				board.setWriter(rs.getString("h_name"));
				board.setB_title(rs.getString("b_title"));
				board.setB_date(rs.getString("b_date"));
				board.setB_type(rs.getInt("b_type"));
				board.setB_ref(rs.getInt("b_ref"));
				board.setB_restep(rs.getInt("b_restep"));
				board.setB_relevel(rs.getInt("b_relevel"));
				board.setB_question(rs.getString("b_question"));
				board.setB_status(rs.getInt("b_status"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectBoard() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return board;
	}
		
	//게시글을 전달받아 BOARD 테이블에 저장된 해당 게시글을 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateBoard(BoardDTO board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update board set b_title=?,b_question=?,b_status=? where b_bnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, board.getB_title());
			pstmt.setString(2, board.getB_question());
			pstmt.setInt(3, board.getB_status());
			pstmt.setInt(4, board.getB_bnum());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateBoard() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//글번호와 글상태를 전달받아 BOARD 테이블에 저장된 해당 글번호의 게시글에 대한 상태를
	//변경하고 변경행의 갯수를 반환하는 메소드
	public int updateStatus(int b_bnum, int b_status) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update board set b_status=? where b_bnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, b_status);
			pstmt.setInt(2, b_bnum);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateStatus() 메서드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
}