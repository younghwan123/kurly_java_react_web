package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	 
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs; 
	private int totalRecords=0; 
	private int viewList=3;  
	 
	public BbsDAO() { 
		try {
			String DBURL = "jdbc:mariadb://localhost:3306/moonjongjsp";		
			String DBID = "moonjongjsp";
			String DBPW = "moonjong@!";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(DBURL, DBID, DBPW);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	
	
	
			// 글쓰기에 사용한 현재날짜시간 메서드 : dateTime
			public String getDate() {
				String SQL = "SELECT now()";				
				try {
					PreparedStatement ps = conn.prepareStatement(SQL);
					rs = ps.executeQuery();
					if(rs.next()) {
						return rs.getString(1);
					}					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}				
				return "";  // 데이터베이스 오류
			}
						
			// 게시 글번호 다음 번호 생성
			public int getNumber() {
				//마지막글번호+1 
				String SQL = "SELECT bbsId FROM bbs ORDER BY bbsId DESC";
				try {
					PreparedStatement ps = conn.prepareStatement(SQL);
					rs = ps.executeQuery();
					if(rs.next()) {
						return rs.getInt(1)+1; // 글번호 증가
					}
					else {
						return 1; // 첫번째 입력할 글번호 즉 => 저장된 게시글이 한개도 없을 때	
					}					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return -1; // 데이터베이스 오류
			}
			
			
			
			
			// 게시판 글쓰기(Write) 메서드
			public int write(String userId, String subject, String content) {
				String SQL = "INSERT INTO bbs VALUES(?, ?, ?, ?, ?, ?, ?)";	
				
				try {
					PreparedStatement ps = conn.prepareStatement(SQL);
					ps.setInt(1, getNumber()); // bbsId => 글번호 생성(마지막글번호+1 함수 getNumber)  
					ps.setString(2, userId); // 작성자
					ps.setString(3, subject); // 제목  
					ps.setString(4, content); // 내용  
					ps.setString(5, getDate()); // 작성일(현재날짜가져오기 함수) 
					ps.setInt(6, 1); // 삭제여부기본값입력 가용데이터(1) 삭제데이터(0은삭제)
					ps.setInt(7, 0); // 조회수 => 글보기를 하면 1씩 증가하는 조회수 hit 최초 글쓰기하면 0 디폴트값
					return ps.executeUpdate();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}				
				return -1;  // 데이터베이스 오류
			}
			
			
			
			
			
			// 게시글 리스트(목록) 메서드 => JSP에서 페이지네이션 구현
			// 페이지네이션
			// 조건문 => 매개변수로 글번호 bbsId deleteOk=1 사용가능한목록만 글번호 bbsId 내림차순 그리고 5개씩 출력
			public ArrayList<BbsDTO> getList(int pageNumber){
			// String SQL = "SELECT * FROM (SELECT *, @no := @no + 1 as no FROM bbs, (SELECT @no:=0) as v_format_no  WHERE deleteOk=1) as v_table WHERE no <=? ORDER BY bbsId DESC LIMIT ?";  
				String SQL = "SELECT * FROM "
						   + "(SELECT *, @no := @no + 1 as no FROM bbs, "
						   + "(SELECT @no:=0) as v_format_no  WHERE deleteOk=1) as v_table "
						   + "WHERE no <=? ORDER BY bbsId DESC LIMIT ?";  
				ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();	
				
				try {
					PreparedStatement ps = conn.prepareStatement(SQL);
					ps.setInt(1, totalRecordsMethod() - (pageNumber-1) * viewList );
					ps.setInt(2, viewList );
					rs = ps.executeQuery();
					while(rs.next()) {						
						BbsDTO bbsDTO = new BbsDTO();
						bbsDTO.setBbsId(rs.getInt(1));
						bbsDTO.setUserId(rs.getString(2));
						bbsDTO.setSubject(rs.getString(3));
						bbsDTO.setContent(rs.getString(4));
						bbsDTO.setWriteDate(rs.getString(5));
						bbsDTO.setDeleteOk(rs.getInt(6));
						bbsDTO.setHit(rs.getInt(7));
						list.add(bbsDTO);
					}

				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}				
				return list;
			}
			
			
			
			// 리액트 리스트(목록) 메서드 => 리액트에서 페이지네이션구현
			// 게시글 리스트(목록) 메서드
			// 조건문 => 매개변수로 글번호 bbsId deleteOk=1 사용가능한목록만 글번호 bbsId 내림차순 그리고 5개씩 출력
			public ArrayList<BbsDTO> getListReact(){
			// String SQL = "SELECT * FROM (SELECT *, @no := @no + 1 as no FROM bbs, (SELECT @no:=0) as v_format_no  WHERE deleteOk=1) as v_table WHERE no <=? ORDER BY bbsId DESC LIMIT ?";  
				String SQL = "SELECT * FROM "
						   + "(SELECT *, @no := @no + 1 as no FROM bbs, "
						   + "(SELECT @no:=0) as v_format_no  WHERE deleteOk=1) as v_table "
						   + "ORDER BY bbsId DESC";  
				ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();	
				
				try {
					PreparedStatement ps = conn.prepareStatement(SQL);
					rs = ps.executeQuery();
					while(rs.next()) {						
						BbsDTO bbsDTO = new BbsDTO();
						bbsDTO.setBbsId(rs.getInt(1));
						bbsDTO.setUserId(rs.getString(2));
						bbsDTO.setSubject(rs.getString(3));
						bbsDTO.setContent(rs.getString(4));
						bbsDTO.setWriteDate(rs.getString(5));
						bbsDTO.setDeleteOk(rs.getInt(6));
						bbsDTO.setHit(rs.getInt(7));
						list.add(bbsDTO);
					}

				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}				
				return list;
			}

			
			
			
			// 다음페이지함수 리턴값은 다음페이지 유무 true(다음페이지존재함) or false(다음페이지없음)
			// 다음페이지카운트함수
			public boolean nextPage(int pageNumber) {
//				String SQL = "SELECT * FROM bbs WHERE bbsId < ? AND deleteOk=1 ORDER BY bbsId DESC LIMIT ?";
				String SQL = "SELECT * FROM "
						   + "(SELECT *, @no := @no + 1 as no FROM bbs, "
						   + "(SELECT @no:=0) as v_format_no  WHERE deleteOk=1) as v_table "
						   + "WHERE no <=? ORDER BY bbsId DESC LIMIT ?";
				try {
					PreparedStatement ps = conn.prepareStatement(SQL);
					ps.setInt(1, totalRecordsMethod() - (pageNumber-1) * viewList );
					ps.setInt(2, viewList );
					rs = ps.executeQuery();
					while(rs.next()) {	
						return true;
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return false;
			}
			
			// 전체레코드수 카운트 함수
			public int totalRecordsMethod() {				
				String SQL = "SELECT COUNT(bbsId) FROM bbs WHERE deleteOk = 1";			
				try {
					PreparedStatement ps = conn.prepareStatement(SQL);					
					rs = ps.executeQuery();
					while(rs.next()) {	
						return totalRecords=rs.getInt(1);
					}
										
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return totalRecords;
			}
			
			
			// 조회수(hit)증가(카운트)하는함수(bbsId)
			public int hitCount(int bbsId) {
				// SQL 조회수 증가 업데이트 조회수 1증가
				String SQL = "UPDATE bbs SET hit = hit + 1 WHERE deleteOk = 1 AND bbsId = ?";
				try {
					PreparedStatement ps = conn.prepareStatement(SQL);
					ps.setInt(1, bbsId);
					return ps.executeUpdate();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return -1;
			}
			
			// 추가 => 글보기를 클릭하고 보면 조회수가 1이 증가하게 하는 생성하여 메서드를 연결한다
			// 글보기 하나의 글목록 내용을 리턴
			// 존재하지 않는 번호는 리턴값 null 이 반환된다.			
			public BbsDTO getView(int bbsId) {
				String SQL = "SELECT * FROM bbs WHERE deleteOk=1 AND bbsId = ?";
				try {
					PreparedStatement ps = conn.prepareStatement(SQL);
					ps.setInt(1, bbsId);
					// 조회수증가하는함수(bbsId) 아규먼트 전달
					hitCount(bbsId);
					rs = ps.executeQuery();
					while(rs.next()) {						
						BbsDTO bbsDTO = new BbsDTO();
						bbsDTO.setBbsId(rs.getInt(1));
						bbsDTO.setUserId(rs.getString(2));
						bbsDTO.setSubject(rs.getString(3));
						bbsDTO.setContent(rs.getString(4));
						bbsDTO.setWriteDate(rs.getString(5));
						bbsDTO.setDeleteOk(rs.getInt(6));
						bbsDTO.setHit(rs.getInt(7));
						return bbsDTO;
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return null;  // 데이터가 없는경우 DB오류
			}
			
			
			// 삭제 구현
			// 1. 게시글 삭제 메서드 => deleteOk = 0 변경 update
			// 2. 액션파일
			public int delete(int bbsId) {
				// 본인 글 작성자 일치 그리고 글번호 일치 그러면 삭제
				// String SQL = "DELETE FROM bbs WHERE bbsId = ?  AND userId = ?";
				String SQL = "UPDATE bbs SET deleteOk=0 WHERE bbsId = ?";
				try {
					PreparedStatement ps = conn.prepareStatement(SQL);
					ps.setInt(1, bbsId);
					return ps.executeUpdate();
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return -1; // 데이터베이스 오류
			}
			
			
			public int update(int bbsId, String subject, String content) {
				String SQL = "UPDATE bbs SET subject=?, content=?, writeDate=?  WHERE bbsId = ?";
				try {
					PreparedStatement ps = conn.prepareStatement(SQL);
					ps.setString(1, subject);
					ps.setString(2, content);
					ps.setString(3, getDate());
					ps.setInt(4, bbsId);
					return ps.executeUpdate();					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return -1; // 데이터베이스 오류
			}
			
			
	
		
}








