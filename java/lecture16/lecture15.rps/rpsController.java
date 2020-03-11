package lecture15.rps;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.fxml.Initializable;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

import java.util.List;
import java.util.Random;
import java.util.ArrayList;

public class rpsController implements Initializable{
	
	@FXML private Label resultBox;
	@FXML ImageView imageBox1;
	@FXML ImageView imageBox2;
	
	private List<Image> list;
	private List<Image> list2;
	private String cs;
	
	// computer play
	Random random = new Random();
	int ranNum = random.nextInt(3);
	String[] yhArr = {"보", "가위", "바위"};
	String yh = yhArr[ranNum];
	String result;
	
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		// TODO Auto-generated method stub
		list = new ArrayList<Image>();
		list.add(new Image(getClass().getResource("l_1.png").toExternalForm()));
		list.add(new Image(getClass().getResource("l_2.png").toExternalForm()));
		list.add(new Image(getClass().getResource("l_3.png").toExternalForm()));
		
		list2 = new ArrayList<Image>();
		list2.add(new Image(getClass().getResource("r_1.png").toExternalForm()));
		list2.add(new Image(getClass().getResource("r_2.png").toExternalForm()));
		list2.add(new Image(getClass().getResource("r_3.png").toExternalForm()));
		
		
	}

	@FXML public void cardButton1() {
		imageBox1.setImage(list.get(0));
		this.cs = "보";
	}

	@FXML public void cardButton2() {
		imageBox1.setImage(list.get(1));
		this.cs = "가위";
	}

	@FXML public void cardButton3() {
		imageBox1.setImage(list.get(2));
		this.cs = "바위";
	}
	
	@FXML public void gameStart() {
		imageBox2.setImage(list2.get(this.ranNum));
		
		if (cs.equals(yh)) {
			this.result = "비겼습니다!";
		} else if (cs.equals("가위") && yh.equals("바위") ||
				cs.equals("바위") && yh.equals("보") ||
				cs.equals("보") && yh.equals("가위")) {
			this.result = "영희 승!";
		} else {
			this.result = "철수 승!";
		}
		System.out.println("결과: " + this.result);
		resultBox.setText("Result = " +this.result);
		
		ranNum = random.nextInt(3);
		yh = yhArr[ranNum];
	}
}
