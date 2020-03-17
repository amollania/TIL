package lecture17.transition;

import javafx.animation.KeyFrame;
import javafx.animation.KeyValue;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;
import javafx.util.Duration;

public class LoginController {
	private MainInterface main;

	@FXML TextField idField;
	@FXML TextField pwField;
	@FXML AnchorPane loginPane;
	public LoginController(MainInterface main) {
		this.main = main;
	}
	
	@FXML public void loginAction() {
		StackPane root = (StackPane) loginPane.getScene().getRoot();
		String id = idField.getText();
		String pw = pwField.getText();
		main.login(id, pw);
		// 애니메이션
		Timeline timeline = new Timeline();
		KeyValue keyValue = new KeyValue(loginPane.translateYProperty(), 300);
		KeyFrame keyFrame = new KeyFrame(Duration.millis(500), new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				root.getChildren().remove(loginPane);
			}
		}, keyValue);
		timeline.getKeyFrames().add(keyFrame);
		
		timeline.play();
	}
	@FXML public void cancelAction() {
		StackPane root = (StackPane) loginPane.getScene().getRoot();
		
		// 애니메이션
		Timeline timeline = new Timeline();
		KeyValue keyValue = new KeyValue(loginPane.translateYProperty(), 300);
		KeyFrame keyFrame = new KeyFrame(Duration.millis(500), new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent event) {
				root.getChildren().remove(loginPane);
			}
		}, keyValue);
		timeline.getKeyFrames().add(keyFrame);
		
		timeline.play();
	}

}
