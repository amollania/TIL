package dataaccess;

public class Mysql implements DataAccessObject{
			@Override
			public void select() {
				System.out.println("MySql DB에서 검색");
			}

			@Override
			public void insert() {
				// TODO Auto-generated method stub
				System.out.println("MySql DB에 삽입");
			}

			@Override
			public void update() {
				// TODO Auto-generated method stub
				System.out.println("MySql DB에 수정");
			}

			@Override
			public void delete() {
				// TODO Auto-generated method stub
				System.out.println("MySql DB에 삭제");
			}

}
