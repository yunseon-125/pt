package sqlmap;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisManager {
	// SqlSessionFactoryBuilder => SqlSessionFactory => SqlSession
	// SqlSession ��ü ������
	private static SqlSessionFactory instance;
	
	private MybatisManager() {
		
	}
	
	public static SqlSessionFactory getInstance() {
		/*�����ڴ� ���� public�ε� ���⼱ privateó�� �ߴ�. ���� �ܺο���
		 * ������ �ȵȴ�. new�ؼ� ������ �ƴϵǱ� ������ getInstance()�� ��ȸ
		 * �����Ѵ�.
		 * public�����ڸ� ���Ƽ� �ܺο��� new�� ���� �����ϴ°��� ���´�.
		 * ���� ����ڵ��� ���� ������ �����Ҷ� ����.
		 * MybatisManager m=new MybatisManagerr();�� �����ϸ� �޸𸮰�
		 * �þ�� ������ �ټ��� �ν��Ͻ� ������ ���� �ϳ��� �ν��ͽ���
		 * �������� ó���Ѵ�. ��, �̱������ϱ��
		 *  
		 */
		
		Reader reader = null;
		try {
			//getResourceAsReader()�� Java Resources�� src�� xml�� �о���̴�
			//�޼ҵ�
			reader = Resources.getResourceAsReader("sqlmap/sqlMapConfig.xml");
			instance = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(reader != null)
					reader.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//finally
		return instance;
	}
}
