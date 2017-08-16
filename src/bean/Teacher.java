package bean;

import annotation.TableFieldAnno;
import annotation.TableNameAnno;

/**
 * 
 * @author LOOK
 * 
 */
@TableNameAnno("teacher")
public class Teacher {
	@TableFieldAnno(field = "tid", length = 10)
	private String tid;
	@TableFieldAnno(field = "age", type = "int", length = 1)
	private String age;
	@TableFieldAnno(field = "sex", length = 2)
	private String sex;
	@TableFieldAnno(field = "email", length = 30)
	private String email;
	@TableFieldAnno(field = "title", length = 30)
	private String title;
	@TableFieldAnno(field = "university",length=15)
	private String university;
	@TableFieldAnno(field = "achievement",  length = 100)
	private String achievement;
	@TableFieldAnno(field = "course",  length = 50)
	private String course;
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public String getAchievement() {
		return achievement;
	}
	public void setAchievement(String achievement) {
		this.achievement = achievement;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}

}
