package lecture21.transition;

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

public class loginController {
	private MainInterface main;
	
	@FXML TextField idField;
	@FXML TextField passField;
	@FXML AnchorPane loginPane;

	public LoginController(MainInterface main) {
		this.main = main;
	}
	
	@FXML public void LoginAction() {
		StackPane root = (StackPane)loginPane.getScene().getRoot();
		String id = idField.getText();
		String pw = passField.getText();
		main.login(id, pw);
		
		// Animation
		Timeline timeline = new Timeline();
		KeyValue keyValue = new KeyValue(loginPane.translateYProperty(), 480);
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
		StackPane root = (StackPane)loginPane.getScene().getRoot();
		
		Timeline timeline = new Timeline();
		KeyValue keyValue = new KeyValue(loginPane.translateYProperty(), 480);
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
