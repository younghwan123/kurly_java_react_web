package kurly;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public UserDAO(){
        try{    
			String DBURL = "jdbc:mariadb://localhost:3306/moonjongjsp";		
			String DBID = "moonjongjsp";
			String DBPW = "moonjong@!";
			Class.forName("org.mariadb.jdbc.Driver");
            System.out.println("JDBC Driver 로드성공!");

            conn = DriverManager.getConnection(DBURL, DBID, DBPW);
            System.out.println("데이터베이스 Connection 연결성공!");
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

        public int signup(UserDTO userDTO){
            String SQL = "INSERT  INTO  signup_table(user_id, user_pw, user_irum, user_email, user_hp, user_addr, user_gender, user_birth, user_chooga, user_service) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try{
            	PreparedStatement ps = conn.prepareStatement(SQL);	
                ps.setString(1,  userDTO.getUser_id());
                ps.setString(2,  userDTO.getUser_pw());
                ps.setString(3,  userDTO.getUser_irum());
                ps.setString(4,  userDTO.getUser_email());
                ps.setString(5,  userDTO.getUser_hp());
                ps.setString(6,  userDTO.getUser_addr());
                ps.setString(7,  userDTO.getUser_gender());
                ps.setString(8,  userDTO.getUser_birth());
                ps.setString(9,  userDTO.getUser_chooga());
                ps.setString(10, userDTO.getUser_service());
                return ps.executeUpdate();
            }
            catch(Exception e){
                e.printStackTrace();
            }
            finally {
                try{
                     if(rs !=null ){rs.close();}
                     if(ps !=null ){ps.close();}
                     if(conn !=null ){conn.close();}
                }
                catch(Exception e){                    
                } 
            }
            return -1;
        }

        public int signin(String user_id, String user_pw){
            String SQL = "SELECT user_pw FROM signup_table WHERE user_id = ?";

            try{
            	PreparedStatement ps = conn.prepareStatement(SQL);	
               ps.setString(1, user_id);
               rs = ps.executeQuery();

               if(rs.next()){
                    if(rs.getString(1).equals( user_pw )){
                        return 1;
                    }
                    else{
                        return 0;
                    }
               }
               else{
                    return -1;
               }
            }
            catch( Exception e ){
                e.printStackTrace();
            }
            finally {
                try{
                     if(rs !=null ){rs.close();}
                     if(ps !=null ){ps.close();}
                     if(conn !=null ){conn.close();}
                }
                catch(Exception e){                    
                } 
            }
            return -2;
        }


        // 수정 메서드
        public int update(UserDTO userDTO){
            String SQL = "UPDATE signup_table SET user_pw = ?, user_irum = ?, user_email = ?, user_hp = ?, user_addr = ?, user_gender = ?, user_birth = ?, user_chooga = ?, user_service = ?  WHERE user_id = ? ";
            try{
            	PreparedStatement ps = conn.prepareStatement(SQL);	
                ps.setString(1,  userDTO.getUser_pw());
                ps.setString(2,  userDTO.getUser_irum());
                ps.setString(3,  userDTO.getUser_email());
                ps.setString(4,  userDTO.getUser_hp());
                ps.setString(5,  userDTO.getUser_addr());
                ps.setString(6,  userDTO.getUser_gender());
                ps.setString(7,  userDTO.getUser_birth());
                ps.setString(8,  userDTO.getUser_chooga());
                ps.setString(9,  userDTO.getUser_service());
                ps.setString(10, userDTO.getUser_id());
                return ps.executeUpdate();
            }
            catch(Exception e){
                e.printStackTrace();
            }
            finally {  
                try{
                     if(rs !=null ){rs.close();}
                     if(ps !=null ){ps.close();}
                     if(conn !=null ){conn.close();}
                }
                catch(Exception e){                    
                } 
            }
            return -1;
        }
        
        
        
        
        // 삭제 메서드
        public int delete(String user_id, String user_pw){
            String SQL = "DELETE FROM signup_table  WHERE user_id = ? AND  user_pw = ?";
            try{
            	PreparedStatement ps = conn.prepareStatement(SQL);	
                ps.setString(1, user_id);
                ps.setString(2, user_pw);
                return ps.executeUpdate();
            }
            catch(Exception e){
                e.printStackTrace();
            }
            finally {  
                try{
                     if(rs !=null ){rs.close();}
                     if(ps !=null ){ps.close();}
                     if(conn !=null ){conn.close();}
                }
                catch(Exception e){                    
                } 
            }
            return -1;
        }
        
        // 개인정보확인하기
        public UserDTO getJoin(String user_id){
            UserDTO userDTO = new UserDTO();

            String SQL = "SELECT * FROM signup_table WHERE user_id = ?";

            try{
            	PreparedStatement ps = conn.prepareStatement(SQL);	
               ps.setString(1, user_id);
               rs = ps.executeQuery();

               if(rs.next()){
                    userDTO.setUser_id(rs.getString("user_id"));  
                    userDTO.setUser_pw(rs.getString("user_pw"));
                    userDTO.setUser_irum(rs.getString("user_irum"));
                    userDTO.setUser_email(rs.getString("user_email"));
                    userDTO.setUser_hp(rs.getString("user_hp"));
                    userDTO.setUser_addr(rs.getString("user_addr"));
                    userDTO.setUser_gender(rs.getString("user_gender"));
                    userDTO.setUser_birth(rs.getString("user_birth"));
                    userDTO.setUser_chooga(rs.getString("user_chooga"));
                    userDTO.setUser_service(rs.getString("user_service"));
                    userDTO.setUser_gaib_date(rs.getString("user_gaib_date"));
               }
               
            }
            catch( Exception e ){
                e.printStackTrace();
            }
            finally {  
                try{
                     if(rs !=null ){rs.close();}
                     if(ps !=null ){ps.close();}
                     if(conn !=null ){conn.close();}
                }
                catch(Exception e){                    
                } 
            }

            return userDTO;
        }

        
        // 회원목록
        public  List<UserDTO>  getJoinList(){
            UserDTO userDTO = null;
            List<UserDTO> list = new ArrayList<>();

            String SQL = "SELECT * FROM signup_table";

            try{
            	PreparedStatement ps = conn.prepareStatement(SQL);	
                rs = ps.executeQuery();
                while(rs.next()){
                    userDTO = new UserDTO();
                    userDTO.setUser_id(rs.getString("user_id"));  
                    userDTO.setUser_pw(rs.getString("user_pw"));
                    userDTO.setUser_irum(rs.getString("user_irum"));
                    userDTO.setUser_email(rs.getString("user_email"));
                    userDTO.setUser_hp(rs.getString("user_hp"));
                    userDTO.setUser_addr(rs.getString("user_addr"));
                    userDTO.setUser_gender(rs.getString("user_gender"));
                    userDTO.setUser_birth(rs.getString("user_birth"));
                    userDTO.setUser_chooga(rs.getString("user_chooga"));
                    userDTO.setUser_service(rs.getString("user_service"));
                    userDTO.setUser_gaib_date(rs.getString("user_gaib_date"));
                    list.add(userDTO);
                }
            }
            catch(Exception e){
                e.printStackTrace();
            }
            finally {  
                try{
                     if(rs !=null ){rs.close();}
                     if(ps !=null ){ps.close();}
                     if(conn !=null ){conn.close();}
                }
                catch(Exception e){                    
                } 
            }
            return list;
        }



        // 아이디찾기 메서드
        // 1차 검색 이름
        // 1차 검색 결과를 이용하여 반복문 WHILE 사용 이메일을 검색 			
        public UserDTO idSearch(String user_irum, String user_hp){
            String SQL = "SELECT user_hp, user_id, user_gaib_date  FROM signup_table WHERE user_irum = ?";
            try {
                PreparedStatement ps = conn.prepareStatement(SQL);	
                ps.setString(1, user_irum);
                rs = ps.executeQuery();
                while(rs.next()) {
                    // user_email 비교
                    if(rs.getString(1).equals(user_hp)) {
                        UserDTO userDTO = new UserDTO();
                        // 이메일이 입력하면 검색 정보 아이디를 반환한다.
                        userDTO.setUser_id(rs.getString(2)); //SQL 조회딘 아이디를 반환
                        userDTO.setUser_gaib_date(rs.getString(3)); //SQL 조회딘 아이디를 반환
                        return userDTO;
                    }
                    //return 이메일일 틀린것
                }
            } catch (Exception e) {
                // TODO: handle exception
            	 e.printStackTrace();
            }
            finally {  
                try{
                     if(rs !=null ){rs.close();}
                     if(ps !=null ){ps.close();}
                     if(conn !=null ){conn.close();}
                }
                catch(Exception e){                    
                } 
            }
            return null;
        }
    	
		// 비밀번호찾기 메서드
		public UserDTO pwSearch(String user_id, String user_hp){
			String SQL = "SELECT user_hp, user_pw, user_gaib_date  FROM signup_table WHERE user_id = ?";
			try {
				PreparedStatement ps = conn.prepareStatement(SQL);	
				ps.setString(1, user_id);
				rs = ps.executeQuery();
				while(rs.next()) {
					// user_hp 비교
					if(rs.getString(1).equals(user_hp)) {
						UserDTO userDTO = new UserDTO();
						// 이메일이 일하면 검색 정보 비밀번호를 반환한다.
						userDTO.setUser_pw(rs.getString(2)); //SQL 조회딘 비밀번호를 반환
						 userDTO.setUser_gaib_date(rs.getString(3)); //SQL 가입일자
						return userDTO;
					}
				}
			} catch (Exception e) {
                // TODO: handle exception
            	 e.printStackTrace();
            }
            finally {  
                try{
                     if(rs !=null ){rs.close();}
                     if(ps !=null ){ps.close();}
                     if(conn !=null ){conn.close();}
                }
                catch(Exception e){                    
                } 
            }
			return null;
		}
		

		// 아이디 중복확인 메서드
	    public boolean idCheckMethod(String user_id){
	    	boolean result = false; //초기값 중복안된상태
	    	
            String SQL = "SELECT user_id  FROM signup_table WHERE user_id = ?";

            try{
               PreparedStatement ps = conn.prepareStatement(SQL);	
               ps.setString(1, user_id);
               rs = ps.executeQuery();
               if(rs.next()){
                   result=true;  // 중복된 아이디
               }
               else{
            	   result=false; // 사용가능한 아이디
               }
            }
            catch( Exception e ){
                e.printStackTrace();
            }
            finally {
                try{
                     if(rs !=null ){rs.close();}
                     if(ps !=null ){ps.close();}
                     if(conn !=null ){conn.close();}
                }
                catch(Exception e){                    
                } 
            }
            return result;  // 아이디 중복여부 결과 리턴 boolean 
        }

	    // 이메일 중복확인  메서드
	    public boolean emailCheckMethod(String user_email){
	    	boolean result = false; //초기값 중복안된상태
	    	
	    	String SQL = "SELECT user_email  FROM signup_table WHERE user_email = ?";
	    	
	    	try{
	    		PreparedStatement ps = conn.prepareStatement(SQL);	
	    		ps.setString(1, user_email);
	    		rs = ps.executeQuery();
	    		if(rs.next()){
	    			result=true;  // 중복된 이메일
	    		}
	    		else{
	    			result=false; // 사용가능한 이메일
	    		}
	    	}
	    	catch( Exception e ){
	    		e.printStackTrace();
	    	}
	    	finally {
	    		try{
	    			if(rs !=null ){rs.close();}
	    			if(ps !=null ){ps.close();}
	    			if(conn !=null ){conn.close();}
	    		}
	    		catch(Exception e){                    
	    		} 
	    	}
	    	return result;  // 이메일 중복여부 결과 리턴 boolean 
	    }
	    
	    // 비밀번호 새비밀번호 재설정 메서드
        public int pwReset(String user_pw, String user_id){
            String SQL = "UPDATE signup_table SET user_pw = ? WHERE user_id = ?";
            try{
                ps = conn.prepareStatement(SQL);
                ps.setString(1, user_pw);
                ps.setString(2, user_id);
                return ps.executeUpdate();  // 1반환
            }
            catch(Exception e){
                e.printStackTrace();
            }
            finally {  
                try{
                     if(rs !=null ){rs.close();}
                     if(ps !=null ){ps.close();}
                     if(conn !=null ){conn.close();}
                }
                catch(Exception e){                    
                } 
            }
            return -1;  // -1반환
        }
        
		
        
        

}
