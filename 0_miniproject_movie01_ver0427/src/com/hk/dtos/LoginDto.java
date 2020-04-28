package com.hk.dtos;

public class LoginDto {
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_address;
	private String m_phone;
	private String m_email;
	private String m_enabled;
	private String m_role;
	
	public LoginDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public LoginDto(String m_id, String m_password, String m_name, String m_address, String m_phone, String m_email,
			String m_enabled, String m_role) {
		super();
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_address = m_address;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_enabled = m_enabled;
		this.m_role = m_role;
	}
	//회원가입용
	public LoginDto(String m_id, String m_password, String m_name, String m_address, String m_phone, String m_email) {
		super();
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_address = m_address;
		this.m_phone = m_phone;
		this.m_email = m_email;
	}
	//회원정보수정용
	public LoginDto(String m_id, String m_address, String m_phone, String m_email) {
		super();
		this.m_id = m_id;
		this.m_address = m_address;
		this.m_phone = m_phone;
		this.m_email = m_email;
	}
//
//	public LoginDto(String m_id, String m_name, String m_enabled, String m_role) {
//		super();
//		this.m_id = m_id;
//		this.m_name = m_name;
//		this.m_enabled = m_enabled;
//		this.m_role = m_role;
//	}

//	public LoginDto(String m_id, String m_password) {
//		super();
//		this.m_id = m_id;
//		this.m_password = m_password;
//	}

	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_enabled() {
		return m_enabled;
	}
	public void setM_enabled(String m_enabled) {
		this.m_enabled = m_enabled;
	}
	public String getM_role() {
		return m_role;
	}
	public void setM_role(String m_role) {
		this.m_role = m_role;
	}
	
	@Override
	public String toString() {
		return "LoginDto [m_id=" + m_id + ", m_password=" + m_password + ", m_name=" + m_name + ", m_address="
				+ m_address + ", m_phone=" + m_phone + ", m_email=" + m_email + ", m_enabled=" + m_enabled + ", m_role="
				+ m_role + "]";
	}
	
}
