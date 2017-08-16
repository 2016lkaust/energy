package annotation;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.SQLException;

import util.DataUtil;

/**
 * ����ע��ͷ��䶯̬�����ݱ��ɾ����ݱ�
 * 
 * @author LOOK
 * z
 */
@SuppressWarnings("all")
public class CreateSqlByAnno {
	public static void main(String[] args) {
		// String[]
		// tables={"user","activity","backlog","family","inform","student"};
		// for (int i = 0; i < tables.length; i++) {
		// String drop="drop table "+tables[i];
		// DataUtil.update(drop);
		// }
//		 createTable("User");
//		 createTable("Activity");
//		 createTable("Backlog");
//		 createTable("Family");
//		 createTable("Inform");
//		 createTable("Student");
		 createTable("User");
//		System.out.println(createSql("Activity"));
	}

	/**
	 * �����ݱ�
	 * 
	 * @param typeName
	 */
	public static void createTable(String typeName) {
		Connection connection = DataUtil.getConnection();
		String sql = createSql(typeName);
		try {
			DataUtil.update(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * ���ڶ�̬��ɽ������
	 * 
	 * @param type
	 */
	public static String createSql(String typeName) {// ��������
		StringBuffer stringBuffer = new StringBuffer();
		try {
			Class clazz = Class.forName("bean." + typeName);
			// ��ȡ���ע��
			TableNameAnno tableNameAnno = (TableNameAnno) clazz
					.getAnnotation(TableNameAnno.class);
			stringBuffer.append("create table " + tableNameAnno.value() + "(");
			// ��ȡ�������Ե�ע�⣬�������ע�������
			Field[] fields = clazz.getDeclaredFields();
			TableFieldAnno tableFieldAnno = null;
			for (int i = 0; i < fields.length; i++) {
				// ��ȡÿ�����Ե�ע��
				tableFieldAnno = fields[i].getAnnotation(TableFieldAnno.class);
				// ���ÿ��ע�������
				if (tableFieldAnno.length() == 0) {
					stringBuffer.append(tableFieldAnno.field() + " "
							+ tableFieldAnno.type() + " ");
				} else {
					stringBuffer.append(tableFieldAnno.field() + " "
							+ tableFieldAnno.type() + " ("
							+ tableFieldAnno.length() + ") ");
				}
				if (tableFieldAnno.primaryKey()) {
					stringBuffer.append(" primary key, ");
				} else if (i != fields.length - 1) {// ���һ��
					stringBuffer.append("default null,");
				} else {// ������
					stringBuffer.append("default null");
				}

			}
			stringBuffer.append(") default charset='utf8';");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return stringBuffer.toString();
	}

}