package bean;

import annotation.TableFieldAnno;
import annotation.TableNameAnno;

/**
 * �����û���Ϣ
 * 
 * @author LOOK
 * 
 */
@TableNameAnno("user")
public class User {
	@TableFieldAnno(field = "user_no", primaryKey = true, length = 100)
	private String userNo;// ѧ��
	@TableFieldAnno(field = "user_id", length = 12)
	private String userId;// ѧ��
	@TableFieldAnno(field = "user_name", length = 10)
	private String userName;// ����
	@TableFieldAnno(field = "user_tel", length = 11)
	private String userTel;// ��ϵ��ʽ
	@TableFieldAnno(field = "user_type", length = 10)
	private String userType;// �������
	@TableFieldAnno(field = "user_pw")
	private String userPw;// ����
	@TableFieldAnno(field = "user_graduated", type = "int", length = 1)
	private Integer userGraduated;// �Ƿ��ҵ
	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public Integer getUserGraduated() {
		return userGraduated;
	}

	public void setUserGraduated(Integer userGraduated) {
		this.userGraduated = userGraduated;
	}

}
