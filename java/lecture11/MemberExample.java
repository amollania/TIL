package lecture11;

public class MemberExample {
	public static void main(String[] args) throws Exception {
		MemberDAO dao = new MemberDAO();
//		List<MemberVO> list = dao.selectList();
//		Iterator<MemberVO> iterator = list.iterator();
//		while (iterator.hasNext()) {
//			MemberVO vo = iterator.next();
//			System.out.printf("%s\t%s %s\n", vo.getMemName(), vo.getMem_Id(), vo.getMemAdd1(), vo.toString());
//		}

		String id = "b002";
		int update = dao.update(new MemberVO(id, "어여쁜", "대구시", "010-1004-2004"));
		if(update == 1 ) {
			System.out.println("Updated");
		} else {
			System.out.println("Not update");
		}
		MemberVO vo = dao.selectOne(id);
		try {
			System.out.printf("%s\t%s %s\n", vo.getMemName(), vo.getMemId(), vo.getMemAdd1(), vo.toString());			
		} catch (NullPointerException e) {
			System.out.println("It is Null");
		}
		
		
//		MemberVO vo = dao.selectOne("b001");
//		try {
//			System.out.printf("%s\t%s %s\n", vo.getMemName(), vo.getMemId(), vo.getMemAdd1(), vo.toString());			
//		} catch (NullPointerException e) {
//			System.out.println("It is Null");
//		}

//		if(vo != null) {
//			System.out.printf("%s\t%s %s\n", vo.getMemName(), vo.getMem_Id(), vo.getMemAdd1(), vo.toString());
//		} else {
//			System.out.println("It is Null");
//		}
		
	}
}
