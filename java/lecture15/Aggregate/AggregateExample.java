package lecture25;

import java.util.List;
import java.util.OptionalDouble;
import java.util.function.ToIntFunction;
import java.util.stream.IntStream;

public class AggregateExample {
	public static void main(String[] args) throws Exception {
		IntStream.range(2, 10).sum();
		MemberDAO dao = new MemberDAO();
		List<MemberVO> list = dao.selectList();
		OptionalDouble average = list.stream().mapToInt(new ToIntFunction<MemberVO>() {
			@Override
			public int applyAsInt(MemberVO value) {
				return value.getMemMileage();
			}
		}).average();
		System.out.println(average.getAsDouble());
	}
}
