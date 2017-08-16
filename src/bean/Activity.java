package bean;

import annotation.TableFieldAnno;
import annotation.TableNameAnno;

@TableNameAnno("activity")
public class Activity {
	@TableFieldAnno(field = "ac_no",primaryKey=true, length = 100)
	private String acNo;
	@TableFieldAnno(field = "created", length = 50)
	private String created;
	@TableFieldAnno(field = "culture", length = 60)
	private String culture;
	@TableFieldAnno(field = "done", length = 80)
	private String done;
	@TableFieldAnno(field = "goals", length = 50)
	private String goals;
	@TableFieldAnno(field = "goal", length = 50)
	private String goal;
	@TableFieldAnno(field = "other", length = 50)
	private String other;
	@TableFieldAnno(field = "award", length = 50)
	private String award;
	@TableFieldAnno(field = "punish", length = 50)
	private String punish;
	@TableFieldAnno(field = "user_id", length = 50)
	private String userId;

	public String getAcNo() {
		return acNo;
	}

	public void setAcNo(String acNo) {
		this.acNo = acNo;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getCulture() {
		return culture;
	}

	public void setCulture(String culture) {
		this.culture = culture;
	}

	public String getDone() {
		return done;
	}

	public void setDone(String done) {
		this.done = done;
	}

	public String getGoals() {
		return goals;
	}

	public void setGoals(String goals) {
		this.goals = goals;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getAward() {
		return award;
	}

	public void setAward(String award) {
		this.award = award;
	}

	public String getPunish() {
		return punish;
	}

	public void setPunish(String punish) {
		this.punish = punish;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
