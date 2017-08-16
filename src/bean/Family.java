package bean;

import annotation.TableFieldAnno;
import annotation.TableNameAnno;

@TableNameAnno("family")
public class Family {
	@TableFieldAnno(field = "fa_id", primaryKey = true,length=100)
	private String faId;
	@TableFieldAnno(field = "fa_name")
	private String faName;
	@TableFieldAnno(field = "fa_relative")
	private String faRelative;
	@TableFieldAnno(field = "fa_status")
	private String faStatus;
	@TableFieldAnno(field = "fa_company")
	private String faCompany;
	@TableFieldAnno(field = "fa_tel")
	private String faTel;
	@TableFieldAnno(field = "fa_other")
	private String faOther;
	@TableFieldAnno(field = "user_id")
	private String userId;
	public String getFaId() {
		return faId;
	}
	public void setFaId(String faId) {
		this.faId = faId;
	}
	public String getFaName() {
		return faName;
	}
	public void setFaName(String faName) {
		this.faName = faName;
	}
	public String getFaRelative() {
		return faRelative;
	}
	public void setFaRelative(String faRelative) {
		this.faRelative = faRelative;
	}
	public String getFaStatus() {
		return faStatus;
	}
	public void setFaStatus(String faStatus) {
		this.faStatus = faStatus;
	}
	public String getFaCompany() {
		return faCompany;
	}
	public void setFaCompany(String faCompany) {
		this.faCompany = faCompany;
	}
	public String getFaTel() {
		return faTel;
	}
	public void setFaTel(String faTel) {
		this.faTel = faTel;
	}
	public String getFaOther() {
		return faOther;
	}
	public void setFaOther(String faOther) {
		this.faOther = faOther;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
