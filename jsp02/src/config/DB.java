package config;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DB {
	public static Connection getConn(){
		//context.xml�� ������ dbcp���� Ŀ�ؼ��� ������
		DataSource ds=null; //javax.sql
		Connection conn=null;
		try {
			//context.xml�� �м��ϴ� ��ü
			Context ctx=new InitialContext(); //javax.naming
			//context.xml�� Resource �±� �˻�
			ds=(DataSource)ctx.lookup("java:comp/env/oraDB");
			conn=ds.getConnection();//Ŀ�ؼ� �Ҵ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;//Ŀ�ؼ� ����
	}
}
