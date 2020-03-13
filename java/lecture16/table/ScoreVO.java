package lecture21.table;

import javafx.beans.property.DoubleProperty;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/* 객체사용 성격에 따라 구분
 * 값을 저장하는 객체 : Value Object(VO)
 * 값을 전달하는 객체 : Data Transfer Object (DTO)
 * 일반적으로 프로그래밍에서 데이터를 Model이라고 표현하기도 한다: Model
 * 안드로드에서는 목록중 하나의 항목이라고 해서 Item이라고 표현하기도 한다.
 */
public class ScoreVO {
	private StringProperty name;
	private DoubleProperty test;
	private DoubleProperty test2;
	private DoubleProperty test3;
	private DoubleProperty other;
	private DoubleProperty sum;
	
	public ScoreVO(String name, double test, double test2, double test3,
			double other) {
		this.name = new SimpleStringProperty(name);
		this.test = new SimpleDoubleProperty(test);
		this.test2 = new SimpleDoubleProperty(test2);
		this.test3 = new SimpleDoubleProperty(test3);
		this.other = new SimpleDoubleProperty(other);
		this.sum = new SimpleDoubleProperty(test + test2 + test3 + other);
	}
    public String getName() {
        return name.get();
    }

    public StringProperty nameProperty() {
        return name;
    }

    public void setName(String name) {
        this.name.set(name);
    }

    public double gettest() {
        return test.get();
    }

    public DoubleProperty testProperty() {
        return test;
    }

    public void settest(double test) {
        this.test.set(test);
    }

    public double gettest2() {
        return test2.get();
    }

    public DoubleProperty test2Property() {
        return test2;
    }

    public void settest2(double test2) {
        this.test2.set(test2);
    }

    public double gettest3() {
        return test3.get();
    }

    public DoubleProperty test3Property() {
        return test3;
    }

    public void settest3(double test3) {
        this.test3.set(test3);
    }

    public double getother() {
        return other.get();
    }

    public DoubleProperty otherProperty() {
        return other;
    }

    public void setother(double other) {
        this.other.set(other);
    }

    public double getSum() {
        return test.get() + test2.get() + test3.get() + other.get();
    }

    public DoubleProperty sumProperty() {
        return new SimpleDoubleProperty(getSum());
    }

    public void setSum(double sum) {
        this.sum.set(sum);
    }	
    @Override
    public String toString() {
        return "ScoreVO{" +
                "name=" + name +
                ", test=" + test +
                ", test2=" + test2 +
                ", test3=" + test3 +
                ", other=" + other +
                ", sum=" + sum +
                '}';
    }
}



