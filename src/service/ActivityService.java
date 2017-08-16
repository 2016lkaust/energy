package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import bean.Activity;
import util.DataUtil;
/**
 * ѧ��μӿ�������ɾ���
 * @author LOOK
 *
 */
public class ActivityService {
	public static void main(String[] args) {
		ActivityService activitys=new ActivityService();
		Activity activity=new Activity();
//		activity.setAward("sdaf");
//		activity.setCreated("safj");
//		activity.setCulture("qwrwqr");
//		activity.setDone("sdafxzcv");
//		activity.setGoal("dasfasz");
//		activity.setGoals("����");
		activitys.insertActivity(activity);
		String string=activitys.getActivitiesByUserId("1",0,1).toString();
		System.out.println(string);;
	}
	public boolean insertActivity(Activity activity) {
		boolean isSuccess = false;
		String sql = "insert into activity values(?,?,?,?,?,?,?,?,?,?)";
		UUID uuid=UUID.randomUUID();
		System.out.println(uuid);
		try {
			isSuccess=DataUtil.update(sql, uuid.toString(), activity.getCreated(),
					activity.getCulture(), activity.getDone(), activity.getGoals(),
					activity.getGoal(), activity.getOther(), activity.getAward(),
					activity.getPunish(), activity.getUserId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isSuccess;

	}

	public List<Map<String, Object>> getActivitiesByUserId(String id,int offset,int number) {
		List<Map<String, Object>> activitiesList = null;
		/**
		 * ��һ������ָ����һ�����ؼ�¼�е�ƫ�������ڶ�������ָ�����ؼ�¼�е������Ŀ
		 */
		String sql="select * from activity where user_id=? limit ?,?";
		try {
			activitiesList=DataUtil.queryList(sql, id,offset,number);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return activitiesList;
	}
}
