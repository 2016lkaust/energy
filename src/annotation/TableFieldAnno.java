package annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 用于注解类字段的属性
 * 
 * @author LOOK
 * 
 */
@Target(value = ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface TableFieldAnno {
	String field();// 字段名称

	boolean primaryKey() default false;// 是否是主键

	String type() default "varchar";// 类型

	int length() default 30;

}
