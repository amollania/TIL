package lecture17.transition;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.util.ResourceBundle;

import javafx.animation.KeyFrame;
import javafx.animation.KeyValue;
import javafx.animation.Timeline;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;
import javafx.util.Duration;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Alert.AlertType;

interface MainInterface {
	void login(String id, String pw);
}
public class TransitionExampleController implements MainInterface, Initializable {
	
	private StringProperty id = new SimpleStringProperty();
	private StringProperty pw = new SimpleStringProperty();
	
	@FXML ImageView mainImage;
	@FXML StackPane mainStack;
	@FXML Button loginButton;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		id.addListener(new ChangeListener<String>() {
			@Override
			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				if (id.get().length() > 0) {
					loginButton.setText("로그아웃");
				} else {
					loginButton.setText("로그인");
				}
			}
		});
	}
	@FXML public void loginAction() throws Exception {
		if (loginButton.getText().equals("로그아웃")) {
			new Alert(AlertType.INFORMATION, "로그아웃되었습니다.").show();
			id.set("");
		} else {
			FXMLLoader loader = new FXMLLoader(getClass().getResource("Login.fxml"));
			loader.setControllerFactory(param -> new LoginController(this));
			Parent login = loader.load();
			
			mainStack.getChildren().add(login);
			// y값 셋팅
			login.setTranslateY(((AnchorPane) login).getPrefHeight());
			// 애니메이션
			Timeline timeline = new Timeline();
			KeyValue keyValue = new KeyValue(login.translateYProperty(), 0);
			KeyFrame keyFrame = new KeyFrame(Duration.millis(500), keyValue);
			timeline.getKeyFrames().add(keyFrame);
			
			timeline.play();
		}
	}

	@Override
	public void login(String id, String pw) {
		this.id.set(id);
		this.pw.set(pw);
	}


}
