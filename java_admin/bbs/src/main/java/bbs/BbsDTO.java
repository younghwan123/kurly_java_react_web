package bbs;

public class BbsDTO {
    private int bbsId;
    private String userId;
    private String subject;
    private String content;
    private String writeDate;
    private int deleteOk;
    private int hit;
       
   
    
	public int getBbsId() {
		return bbsId;
	}
	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getDeleteOk() {
		return deleteOk;
	}
	public void setDeleteOk(int deleteOk) {
		this.deleteOk = deleteOk;
	}
	 public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
		
	    
}
