package BoardGet;
import java.util.ArrayList;
import java.util.List;


public class BoardDao {	
	public List<Board> getBoardList() {
		List<Board> list = new ArrayList<Board>();
		
		list.add(new Board("Hong", "mang"));
		list.add(new Board("Zong", "zang"));
		list.add(new Boasrd("Mong", "Mei"));
	
		return list;
	}
}
