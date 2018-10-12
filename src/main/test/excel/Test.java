package excel;

public class Test {

	
	@org.junit.Test
	public void test() {
		int id=7;
		String sql = "";
		for(int i=10; i>id; i--) {
			if(i-1>id) {
				sql = sql+"column"+i+"="+"column"+(i-1)+",";
			}else {
				sql = sql+"column"+i+"="+"column"+(i-1);
			}
		}
		System.out.println(sql);
	}
}
