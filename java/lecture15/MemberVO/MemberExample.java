package lecture25;

import java.util.List;

public class MemberExample {
	public static void main(String[] args) throws Exception {
		MemberDAO dao = new MemberDAO();
		List<MemberVO> list = dao.selectList();
		// 전화번호(memHP)가 9877로 끝나는 사람의 이름을 출력
		// list.stream().filter(t-> t.getMemHp().endsWith("9877")).forEach(v->System.out.println());
		list.stream().filter(vo -> vo.getMemHp().endsWith("9")).forEach(vo -> System.out.println(vo.getMemName() + " || " + vo.getMemHp() + " | "+ vo.getMemAdd1() + vo.getMemAdd2()));
		
//		Iterator<MemberVO> iterator = list.iterator();
//		while (iterator.hasNext()) {
//			MemberVO vo = iterator.next();
//			System.out.printf("%s\t%s %s\n", vo.getMemName(), vo.getMemAdd1(), vo.getMemAdd2());
//		}
//		String id = "b001";
//		int update = dao.update(new MemberVO(id, "예쁜이", "서울시 천사동", "예쁜마을 1004-1", "010-1004-2004"));
//		if (update == 1) {
//			System.out.println("업데이트 되었습니다.");
//		} else {
//			System.out.println("업데이트 실패");
//		}
//		MemberVO vo = dao.selectOne(id);
//		try {
//			System.out.printf("%s\t%s %s\n", vo.getMemName(), vo.getMemAdd1(), vo.getMemAdd2());
//		} catch (NullPointerException e) {
////			e.printStackTrace();
//			System.out.println("해당하는 아이디가 존재하지 않습니다.");
//		}
		
//		if (vo != null) {
//			System.out.printf("%s\t%s %s\n", vo.getMemName(), vo.getMemAdd1(), vo.getMemAdd2());
//		} else {
//			System.out.println("해당하는 아이디가 존재하지 않습니다.");
//		}
		
	}
}
