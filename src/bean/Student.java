package bean;

import annotation.TableFieldAnno;
import annotation.TableNameAnno;

/**
 * 学生类
 * 
 * @author LOOK
 * 
 */
@TableNameAnno("student")
public class Student {
	@TableFieldAnno(field = "user_id", primaryKey = true)
	private String userId;
	@TableFieldAnno(field="user_name",length=6)
	private String userName;
	@TableFieldAnno(field = "stu_sex",length=1)
	private String stuSex;
	@TableFieldAnno(field = "stu_birth",length=10)
	private String stuBirth;
	@TableFieldAnno(field = "stu_nation",length=4)
	private String stuNation;
	@TableFieldAnno(field = "stu_major",length=10)
	private String stuMajor;
	@TableFieldAnno(field = "stu_classno",length=4)
	private String stuClassNo;
	@TableFieldAnno(field = "stu_status",length=6)
	private String stuStatus;
	@TableFieldAnno(field = "stu_job",length=6)
	private String stuJob;
	@TableFieldAnno(field = "stu_home",length=20)
	private String stuHome;
	@TableFieldAnno(field = "stu_qq",length=10)
	private String stuQq;
	@TableFieldAnno(field = "stu_dorm",length=10)
	private String stuDorm;
	@TableFieldAnno(field = "stu_num",length=20)
	private String stuNum;
	@TableFieldAnno(field = "stu_score",length=3)
	private String stuScore;
	@TableFieldAnno(field = "stu_poor",length=6)
	private String stuPoor;
	@TableFieldAnno(field = "stu_result",length=1)
	private String stuResult;// 贫困级别

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

	public String getStuSex() {
		return stuSex;
	}

	public void setStuSex(String stuSex) {
		this.stuSex = stuSex;
	}

	public String getStuBirth() {
		return stuBirth;
	}

	public void setStuBirth(String stuBirth) {
		this.stuBirth = stuBirth;
	}

	public String getStuNation() {
		return stuNation;
	}

	public void setStuNation(String stuNation) {
		this.stuNation = stuNation;
	}

	public String getStuMajor() {
		return stuMajor;
	}

	public void setStuMajor(String stuMajor) {
		this.stuMajor = stuMajor;
	}

	public String getStuClassNo() {
		return stuClassNo;
	}

	public void setStuClassNo(String stuClassNo) {
		this.stuClassNo = stuClassNo;
	}

	public String getStuStatus() {
		return stuStatus;
	}

	public void setStuStatus(String stuStatus) {
		this.stuStatus = stuStatus;
	}

	public String getStuJob() {
		return stuJob;
	}

	public void setStuJob(String stuJob) {
		this.stuJob = stuJob;
	}

	public String getStuHome() {
		return stuHome;
	}

	public void setStuHome(String stuHome) {
		this.stuHome = stuHome;
	}

	public String getStuQq() {
		return stuQq;
	}

	public void setStuQq(String stuQq) {
		this.stuQq = stuQq;
	}

	public String getStuDorm() {
		return stuDorm;
	}

	public void setStuDorm(String stuDorm) {
		this.stuDorm = stuDorm;
	}

	public String getStuNum() {
		return stuNum;
	}

	public void setStuNum(String stuNum) {
		this.stuNum = stuNum;
	}

	public String getStuScore() {
		return stuScore;
	}

	public void setStuScore(String stuScore) {
		this.stuScore = stuScore;
	}

	public String getStuPoor() {
		return stuPoor;
	}

	public void setStuPoor(String stuPoor) {
		this.stuPoor = stuPoor;
	}

	public String getStuResult() {
		return stuResult;
	}

	public void setStuResult(String stuResult) {
		this.stuResult = stuResult;
	}

}
