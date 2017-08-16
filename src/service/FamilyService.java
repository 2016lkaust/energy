package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import util.DataUtil;
import bean.Family;
/**
 * ��ͥ��Ϣ����ɾ���
 * @author LOOK
 *
 */
public class FamilyService {
	public static void main(String[] args) {
		Family family=new Family();
		family.setFaCompany("��˾");
		family.setFaName("����");
		family.setFaOther("��");
		family.setFaRelative("��ϵ");
		family.setFaStatus("Ⱥ��");
		family.setFaTel("1242");
		family.setUserId("1");
		FamilyService familyService=new FamilyService();
//		familyService.insertFamily(family);
//	System.out.println(familyService.getFamilyByUserId("1"));
//	System.out.println(familyService.deleteFamilyById("eb59c19b-0b9c-4ab8-a4c7-ea134da54abd"));
		System.out.println(familyService.updateFamily("fa_tel", "131314"));
	}

	public boolean insertFamily(Family family) {
		boolean isSuccess = false;
		String sql = "insert into family values(?,?,?,?,?,?,?,?)";
		try {
			isSuccess = DataUtil.update(sql, DataUtil.Uuid(),family.getFaName(),
					family.getFaRelative(), family.getFaStatus(),
					family.getFaCompany(), family.getFaTel(), family.getFaOther(),
					family.getUserId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isSuccess;
	}
	public List<Map<String, Object>> getFamilyByUserId(String userId){
		List<Map<String, Object>> family=null;
		String sql="select * from family where user_id=?";
		try {
			family=DataUtil.queryList(sql, userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return family;
	}
	public boolean deleteFamilyById(String id){
		boolean isSuccess=false;
		String sql="delete from family where fa_id=?";
		try {
			isSuccess=DataUtil.update(sql, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isSuccess;
	}
	public boolean updateFamily(String property,String newValue){
		boolean isSuccess=false;
		String sql="update family set "+property+"=?";
		try {
			isSuccess=DataUtil.update(sql, newValue);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isSuccess;
	}
}

