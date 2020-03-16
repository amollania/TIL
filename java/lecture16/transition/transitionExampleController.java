package lecture21.transition;

import javafx.animation.KeyFrame;
import javafx.animation.KeyValue;
import javafx.animation.Timeline;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.image.ImageView;
import javafx.util.Callback;
import javafx.util.Duration;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;



public class transitionExampleController implements MainInterface {
	
	@FXML ImageView mainImage;
	@FXML StackPane mainStack;
	
	@FXML public void loginAction() throws Exception {
//		Parent login = FXMLLoader.load(getClass().getResource("Login.fxml"));
		FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("Login.fxml"));
		loader.setControllerFactory(new Callback<Class<?>, Object>() {
			@Override
			public Object call(Class<?> param) {
				return param.getConstructor(parameterTypes);
			}
		});
		
		mainStack.getChildren().add(login);
//		Scene scene = new Scene(login);
//		Stage primaryStage = (Stage) mainImage.getScene().getWindow();
//		primaryStage.setScene(scene);
		
		login.setTranslateY(((AnchorPane) login).getPrefHeight());
	
		Timeline timeline = new Timeline();
		KeyValue keyValue = new KeyValue(login.translateYProperty(), 0);
		KeyFrame keyFrame = new KeyFrame(Duration.millis(500), keyValue);
		timeline.getKeyFrames().add(keyFrame);
		timeline.play();
	}

	@FXML public void logoutAction() {}

}


interface MainInterface {
	void login(String id, String pw);
}

