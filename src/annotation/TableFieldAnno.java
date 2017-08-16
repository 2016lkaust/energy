package annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * ����ע�����ֶε�����
 * 
 * @author LOOK
 * 
 */
@Target(value = ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface TableFieldAnno {
	String field();// �ֶ�����

	boolean primaryKey() default false;// �Ƿ�������

	String type() default "varchar";// ����

	int length() default 30;

}
