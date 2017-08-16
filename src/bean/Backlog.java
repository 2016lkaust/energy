package bean;

import annotation.TableFieldAnno;
import annotation.TableNameAnno;

@TableNameAnno("backlog")
public class Backlog {
	@TableFieldAnno(field = "b_id",length=100, primaryKey = true)
	private String bId;
	@TableFieldAnno(field = "b_title", length = 20)
	private String bTitle;
	@TableFieldAnno(field = "b_content", length = 300)
	private String bContent;
	@TableFieldAnno(field = "b_completed", type = "int", length = 1)
	private Integer bCompleted;
	@TableFieldAnno(field = "b_deleted", type = "int", length = 1)
	private Integer bDeleted;
	@TableFieldAnno(field = "b_created", type = "datetime", length = 0)
	private String bCreated;
	@TableFieldAnno(field = "user_id")
	private String userId;// Ñ§ºÅ

	public String getbId() {
		return bId;
	}

	public void setbId(String bId) {
		this.bId = bId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Integer getbCompleted() {
		return bCompleted;
	}

	public void setbCompleted(Integer bCompleted) {
		this.bCompleted = bCompleted;
	}

	public Integer getbDeleted() {
		return bDeleted;
	}

	public void setbDeleted(Integer bDeleted) {
		this.bDeleted = bDeleted;
	}

	public String getbCreated() {
		return bCreated;
	}

	public void setbCreated(String bCreated) {
		this.bCreated = bCreated;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
