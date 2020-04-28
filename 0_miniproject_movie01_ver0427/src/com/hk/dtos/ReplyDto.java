package com.hk.dtos;

public class ReplyDto {
	private int m_seq;
	private String m_title;
	private String m_id;
	private int m_rate;
	private String m_comment;
	private String m_director;
	private String m_naverrate;
	private String m_pubdate;
	private String m_msubtitle;
	private String m_actornm;
	private String m_link;
	private String m_img;
	
	public ReplyDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReplyDto(int m_seq, String m_title, String m_id, int m_rate, String m_comment, String m_director,
			String m_naverrate, String m_pubdate, String m_msubtitle, String m_actornm, String m_link, String m_img) {
		super();
		this.m_seq = m_seq;
		this.m_title = m_title;
		this.m_id = m_id;
		this.m_rate = m_rate;
		this.m_comment = m_comment;
		this.m_director = m_director;
		this.m_naverrate = m_naverrate;
		this.m_pubdate = m_pubdate;
		this.m_msubtitle = m_msubtitle;
		this.m_actornm = m_actornm;
		this.m_link = m_link;
		this.m_img = m_img;
	}

	//전체
	public ReplyDto(int m_seq, String m_title, String m_id, int m_rate, String m_comment, String m_director) {
		super();
		this.m_seq = m_seq;
		this.m_title = m_title;
		this.m_id = m_id;
		this.m_rate = m_rate;
		this.m_comment = m_comment;
		this.m_director = m_director;
	}
	
	public ReplyDto(String m_title, String m_director) {
		super();
		this.m_title = m_title;
		this.m_director = m_director;
	}

	//addRate 평점등록시/updateRate 평점업뎃시 - 바꾼것
	public ReplyDto(String m_title, String m_id, int m_rate, String m_director, String m_naverrate, String m_pubdate,
			String m_msubtitle, String m_actornm, String m_link, String m_img) {
		super();
		this.m_title = m_title;
		this.m_id = m_id;
		this.m_rate = m_rate;
		this.m_director = m_director;
		this.m_naverrate = m_naverrate;
		this.m_pubdate = m_pubdate;
		this.m_msubtitle = m_msubtitle;
		this.m_actornm = m_actornm;
		this.m_link = m_link;
		this.m_img = m_img;
	}

	//addRate 평점등록시/updateRate 평점업뎃시
	public ReplyDto(String m_title, String m_id, int m_rate, String m_director) {
		super();
		this.m_title = m_title;
		this.m_id = m_id;
		this.m_rate = m_rate;
		this.m_director = m_director;
	}
	
	//chkRate 평점등록여부 체크시
	public ReplyDto(String m_title, String m_id, String m_director) {
		super();
		this.m_title = m_title;
		this.m_id = m_id;
		this.m_director = m_director;
	}

	//addComment 코멘트 등록시
	public ReplyDto(String m_title, String m_id, String m_comment, String m_director) {
		super();
		this.m_title = m_title;
		this.m_id = m_id;
		this.m_comment = m_comment;
		this.m_director = m_director;
	}

	public int getM_seq() {
		return m_seq;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getM_rate() {
		return m_rate;
	}

	public void setM_rate(int m_rate) {
		this.m_rate = m_rate;
	}

	public String getM_comment() {
		return m_comment;
	}

	public void setM_comment(String m_comment) {
		this.m_comment = m_comment;
	}

	public String getM_director() {
		return m_director;
	}

	public void setM_director(String m_director) {
		this.m_director = m_director;
	}

	public String getM_naverrate() {
		return m_naverrate;
	}

	public void setM_naverrate(String m_naverrate) {
		this.m_naverrate = m_naverrate;
	}

	public String getM_pubdate() {
		return m_pubdate;
	}

	public void setM_pubdate(String m_pubdate) {
		this.m_pubdate = m_pubdate;
	}

	public String getM_msubtitle() {
		return m_msubtitle;
	}

	public void setM_msubtitle(String m_msubtitle) {
		this.m_msubtitle = m_msubtitle;
	}

	public String getM_actornm() {
		return m_actornm;
	}

	public void setM_actornm(String m_actornm) {
		this.m_actornm = m_actornm;
	}

	public String getM_link() {
		return m_link;
	}

	public void setM_link(String m_link) {
		this.m_link = m_link;
	}

	public String getM_img() {
		return m_img;
	}

	public void setM_img(String m_img) {
		this.m_img = m_img;
	}

	@Override
	public String toString() {
		return "ReplyDto [m_seq=" + m_seq + ", m_title=" + m_title + ", m_id=" + m_id + ", m_rate=" + m_rate
				+ ", m_comment=" + m_comment + ", m_director=" + m_director + ", m_naverrate=" + m_naverrate
				+ ", m_pubdate=" + m_pubdate + ", m_msubtitle=" + m_msubtitle + ", m_actornm=" + m_actornm + ", m_link="
				+ m_link + ", m_img=" + m_img + "]";
	}

	
	
}
