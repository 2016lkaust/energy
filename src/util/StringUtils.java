package util;

@SuppressWarnings("all")
public class StringUtils {
	public static boolean isEmpty(String str) {
		return null == str || str.equals("") || str.matches("\\s*");
	}

	public static String defaultValue(String content, String defaultValue) {
		if (isEmpty(content)) {
			return defaultValue;
		}
		return content;
	}

	public static void main(String[] args) {
		System.out.println(columnToProperty("user_id_num"));
		System.out.println(StringUtils.upperCaseFirstCharacter("user_id_num"));
		;
	}

	/**
	 * ������user_id_num���ַ�תΪ����userIdNum���ַ������»���ɾ���»��ߺ�ĵ�һ���ַ��д
	 * @param column
	 * @return
	 */
	public static String columnToProperty(String column) {
		if (isEmpty(column))
			return "";
		Byte length = (byte) column.length();

		StringBuilder sb = new StringBuilder(length);
		int i = 0;
		for (int j = 0; j < length; j++) {
			if (column.charAt(j) == '_') {
				while (column.charAt(j + 1) == '_') {
					j += 1;
				}
				sb.append(("" + column.charAt(++j)).toUpperCase());

			} else {
				sb.append(column.charAt(j));
			}
		}

		return sb.toString();
	}

	public static String upperCaseFirstCharacter(String str) {
		StringBuilder sb = new StringBuilder();
		char[] arr = str.toCharArray();
		for (int i = 0; i < arr.length; i++) {
			if (i == 0)
				sb.append((arr[i] + "").toUpperCase());
			else
				sb.append((arr[i] + ""));
		}
		return sb.toString();
	}

}
