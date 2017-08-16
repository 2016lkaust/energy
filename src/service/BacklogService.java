package service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import util.DataUtil;

/**
 * ����¼����ɾ���
 * 
 * @author LOOK
 * 
 */
public class BacklogService {
	public static void main(String[] args) {
		Date date = new Date();
		System.out.println(new BacklogService().insertBacklog("1", "2", 0, 0,
				date, "1"));
	}

	/**
	 * object[0]:title; object[1]:content; object[2]:completeted;
	 * object[3]:deleted; object[4]:create; object[5]:user_id.
	 * 
	 * @param objects
	 * @return
	 */
	public boolean insertBacklog(Object... objects) {
		boolean isSuccess = false;
		String sql = "insert into backlog values(?,?,?,?,?,?,?)";
		UUID uuid = UUID.randomUUID();
		try {
			isSuccess = DataUtil.update(sql, uuid.toString(), objects[0],
					objects[1], objects[2], objects[3], objects[4], objects[5]);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("���뱸��¼" + isSuccess);
		return isSuccess;

	}

	public List<Map<String, Object>> getBacklogsById(String id, int offset,
			int number) {
		List<Map<String, Object>> backlogs = null;
		/**
		 * ��һ������ָ����һ�����ؼ�¼�е�ƫ�������ڶ�������ָ�����ؼ�¼�е������Ŀ
		 */
		String sql = "select * from backlog where user_id=? limit ?,?";
		try {
			backlogs = DataUtil.queryList(sql, id, offset, number);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return backlogs;
	}
	public List<Map<String, Object>> getBacklogs(String id) {
		List<Map<String, Object>> backlogs = null;
		/**
		 * ��һ������ָ����һ�����ؼ�¼�е�ƫ�������ڶ�������ָ�����ؼ�¼�е������Ŀ
		 */
		String sql = "select * from backlog where user_id=? order by b_created";
		try {
			backlogs = DataUtil.queryList(sql, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return backlogs;
	}
	public List<Map<String, Object>> getPartBacklogs(String id) {
		List<Map<String, Object>> backlogs = null;
		/**
		 * ��һ������ָ����һ�����ؼ�¼�е�ƫ�������ڶ�������ָ�����ؼ�¼�е������Ŀ
		 */
		String sql = "select * from backlog where user_id=? order by b_created limit 0,7";
		try {
			backlogs = DataUtil.queryList(sql, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return backlogs;
	}
}
