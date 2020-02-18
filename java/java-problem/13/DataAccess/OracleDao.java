package dataaccess;

public class OracleDao implements DataAccessObject {
		
		@Override
		public void select() {
			System.out.println("Oracle DB에서 검색");
		}

		@Override
		public void insert() {
			// TODO Auto-generated method stub
			System.out.println("Oracle DB에 삽입");
		}

		@Override
		public void update() {
			// TODO Auto-generated method stub
			System.out.println("Oracle DB에 수정");
		}

		@Override
		public void delete() {
			// TODO Auto-generated method stub
			System.out.println("Oracle DB에 삭제");
		}
}
