package service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import util.DataUtil;

/**
 * ֪ͨ�������ɾ���
 * 
 * @author LOOK
 * 
 */
public class InformService {
	public static void main(String[] args) {
//		InformService informService = new InformService();
//		Date date = new Date();
		// System.out.println(informService.getInforms(0, 1));
		// System.out.println(informService.insertInform("title", "content", 0,
		// 0,
		// date, "1"));
		// System.out.println(informService.getInformByIid("5d67072b-d6f8-4542-aa39-78158fdb6927").get("i_title"));
		// informService.deleteInformByInformId("1");
	}

	/**
	 * �����µ�֪ͨ object[0]:title; object[1]:content; object[2]:readed;
	 * object[3]:deleted; object[4]:create; object[5]:user_id.
	 * 
	 * @param inform
	 * @return
	 */

	public boolean insertInform(Object... objects) {
		boolean isSuccess = false;
		String sql = "insert into inform values(?,?,?,?,?,?,?)";
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid);
		try {
			isSuccess = DataUtil.update(sql, uuid.toString(), objects[0],
					objects[1], objects[2], objects[3], objects[4], objects[5]);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return isSuccess;

	}

	/**
	 * ɾ��֪ͨ
	 * 
	 * @param iTitle
	 * @return
	 */
	public boolean deleteInformByInformId(String iId) {
		boolean isSuccess = false;
		String sql = "update inform set i_deleted=1 where i_id=?";
		try {
			isSuccess = DataUtil.update(sql, iId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isSuccess;
	}

	public Map<String, Object> getInformByIid(String iId) {
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = "select * from inform where i_id=?";
		try {
			map = DataUtil.queryMap(sql, iId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * ����ָ��λ����ָ��������֪ͨ
	 * 
	 * @param offset
	 * @param number
	 * @return
	 */
	public List<Map<String, Object>> getInforms(int offset, int number) {
		List<Map<String, Object>> informs = null;
		/**
		 * limit��һ������ָ����һ�����ؼ�¼�е�ƫ�������ڶ�������ָ�����ؼ�¼�е������Ŀ
		 */
		String sql = "select * from inform where i_deleted=0 order by i_create desc limit ?,?";
		try {
			informs = DataUtil.queryList(sql, offset, number);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return informs;
	}

	/**
	 * ��ѯ����֪ͨ
	 * 
	 * @param offset
	 * @param number
	 * @return
	 */
	public List<Map<String, Object>> getAllInforms() {
		List<Map<String, Object>> informs = null;
		String sql = "select * from inform where i_deleted=0 order by i_create desc";
		try {
			informs = DataUtil.queryList(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return informs;
	}

}