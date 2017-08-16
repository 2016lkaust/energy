package service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.DataUtil;
import bean.Student;

/**
 * ѧ�����Ϣ����ɾ���
 * 
 * @author LOOK
 * 
 */
public class StudentService {
	public static void main(String[] args) {
		Student student = new Student();
		student.setStuBirth("1995/08/01");
		student.setStuClassNo("1");
		student.setStuSex("��");
		student.setStuDorm("B");
		student.setStuHome("����ʡ����������ʥȪ��");
		student.setStuJob("����");
		student.setStuMajor("��ȫ����");
		student.setStuNum("1234354657");
		student.setStuPoor("һ��");
		student.setStuQq("134567");
		student.setStuResult("0");
		student.setStuStatus("Ⱥ��");
		student.setUserName("����");
//		StudentService service = new StudentService();
		// System.out.println(service.insertStudent(student));
		for (int i = 0; i < 20; i++) {
			student.setUserId(i + "");
//			service.insertStudent(student);
		}
		// System.out.println(service.getStudents("1"));
		// service.getStudentstring("1");
//		System.out.println(service.getStudents("����", "","", "", "", 0,15));
//		System.out.println(service.count("����", "","", "", ""));
//		System.out.println(service.getStuDes("1", "activity"));
	}

	public boolean insertStudent(Student student) {
		boolean isSuccess = false;
		String sql = "insert into student values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			isSuccess = DataUtil.update(sql, student.getUserId(),
					student.getUserName(), student.getStuSex(),
					student.getStuBirth(), student.getStuNation(),
					student.getStuMajor(), student.getStuClassNo(),
					student.getStuStatus(), student.getStuJob(),
					student.getStuHome(), student.getStuJob(),
					student.getStuDorm(), student.getStuNum(),
					student.getStuScore(), student.getStuPoor(),
					student.getStuResult());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isSuccess;
	}

	public List<Map<String, Object>> getStudents(String stuId) {
		List<Map<String, Object>> students = null;
		String sql = "select * from student where stu_id=?";
		try {
			students = DataUtil.queryList(sql, stuId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return students;
	}
	public List<Map<String, Object>> getInfo(String userId,String tableName) {
		List<Map<String, Object>> infos = null;
		String sql = "select * from "+tableName+" where user_id=?";
		try {
			infos = DataUtil.queryList(sql, userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return infos;
	}

	/* where stu_id='%%' */
	/**
	 * objects: objects[0]:stuId,stuName,stuHome; objects[1]:stuMajor;
	 * objects[2]:stuClassno; objects[3]:stuSex; objects[4]:stuJob;
	 * objects[5]:offset;
	 * objects[6]:length.
	 * @param stuId
	 * @param objects
	 * @return
	 */
	public List<Map<String, Object>> getStudents(Object... objects) {
		List<Map<String, Object>> students = null;
		String sql = "select * from student where user_id like '%" + objects[0]
				+ "%' or user_name like '%" + objects[0]
				+ "%' or stu_home like '%" + objects[0]
				+ "%' and stu_major like '%" + objects[1]
				+ "%' and stu_classno like '%" + objects[2]
				+ "%' and stu_sex like '%" + objects[3]
				+ "%' and stu_job like '%" + objects[4] + "%' order by user_id limit ?,?";
		System.out.println(sql);
		try {
			students = DataUtil.queryList(sql, objects[5], objects[6]);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return students;
	}
	public int count(Object... objects) {
		int count=0;
		List<Map<String, Object>> students = null;
		String sql = "select * from student where user_id like '%" + objects[0]
				+ "%' or user_name like '%" + objects[0]
				+ "%' or stu_home like '%" + objects[0]
				+ "%' and stu_major like '%" + objects[1]
				+ "%' and stu_classno like '%" + objects[2]
				+ "%' and stu_sex like '%" + objects[3]
				+ "%' and stu_job like '%" + objects[4] + "%'";
		try {
			students = DataUtil.queryList(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		count=students.size();
		System.out.println(count);
		return count;
		
	}
	public Map<String, Object> getStuDes(String userId,String tableName){
		Map<String, Object> stuDes=new HashMap<String, Object>();
		String sql="select * from "+tableName+" where user_id=?";
		try {
			stuDes=DataUtil.queryMap(sql, userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stuDes;
	}
}
