package util;

import java.lang.reflect.Field;

public class Traverse {
	public static void traverse(Object object){
        Field[] fields = object.getClass().getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true);
            try {
                System.out.print(field.getName() + ":"
                            + field.get(object) + "\t");
            } catch (IllegalArgumentException e) {
                    e.printStackTrace();
            } catch (IllegalAccessException e) {
                    e.printStackTrace();
            }
        }
}
}
