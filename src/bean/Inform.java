package bean;

import annotation.TableFieldAnno;
import annotation.TableNameAnno;

@TableNameAnno("inform")
public class Inform {
	@TableFieldAnno(field = "i_id", length=100, primaryKey = true)
	private String iId;
	@TableFieldAnno(field = "i_title", length = 20)
	private String iTitle;
	@TableFieldAnno(field = "i_content", length = 300)
	private String iContent;
	@TableFieldAnno(field = "i_readed", type = "int", length = 1)
	private Integer iReaded;
	@TableFieldAnno(field = "i_deleted", type = "int", length = 1)
	private Integer iDeleted;
	@TableFieldAnno(field = "i_create", type = "datetime", length = 0)
	private String iCreate;
	@TableFieldAnno(field = "user_id")
	private String userId;// Ñ§ºÅ
	public String getiId() {
		return iId;
	}
	public void setiId(String iId) {
		this.iId = iId;
	}
	public String getiTitle() {
		return iTitle;
	}
	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}
	public String getiContent() {
		return iContent;
	}
	public void setiContent(String iContent) {
		this.iContent = iContent;
	}
	public Integer getiReaded() {
		return iReaded;
	}
	public void setiReaded(Integer iReaded) {
		this.iReaded = iReaded;
	}
	public Integer getiDeleted() {
		return iDeleted;
	}
	public void setiDeleted(Integer iDeleted) {
		this.iDeleted = iDeleted;
	}
	public String getiCreate() {
		return iCreate;
	}
	public void setiCreate(String iCreate) {
		this.iCreate = iCreate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
