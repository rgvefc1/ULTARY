package post.model.vo;

import java.sql.Date;

public class AlertScreen {
	private int alsnum;
	private Date aldate;
	private String allink;
	private String memberid;
	private int alkind;
	private char alcheck;
	private String writer;
	
	public AlertScreen() {}

	
	public AlertScreen(int alsnum, Date aldate, String allink, String memberid, int alkind, char alcheck,
			String writer) {
		super();
		this.alsnum = alsnum;
		this.aldate = aldate;
		this.allink = allink;
		this.memberid = memberid;
		this.alkind = alkind;
		this.alcheck = alcheck;
		this.writer = writer;
	}


	public int getAlsnum() {
		return alsnum;
	}

	public void setAlsnum(int alsnum) {
		this.alsnum = alsnum;
	}

	public Date getAldate() {
		return aldate;
	}

	public void setAldate(Date aldate) {
		this.aldate = aldate;
	}

	public String getAllink() {
		return allink;
	}

	public void setAllink(String allink) {
		this.allink = allink;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public int getAlkind() {
		return alkind;
	}

	public void setAlkind(int alkind) {
		this.alkind = alkind;
	}

	public char getAlcheck() {
		return alcheck;
	}

	public void setAlcheck(char alcheck) {
		this.alcheck = alcheck;
	}


	@Override
	public String toString() {
		return "AlertScreen [alsnum=" + alsnum + ", aldate=" + aldate + ", allink=" + allink + ", memberid=" + memberid
				+ ", alkind=" + alkind + ", alcheck=" + alcheck + ", writer=" + writer + "]";
	}
	
	
	
}
