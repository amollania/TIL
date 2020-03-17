package lecture17.transition;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class TransitionExampleMain extends Application {

	@Override
	public void start(Stage primaryStage) throws Exception {
		Parent root = FXMLLoader.load(getClass().getResource("TransitionExample.fxml"));
		primaryStage.setScene(new Scene(root));
		primaryStage.setTitle("화면이동");
		primaryStage.show();
	}

	public static void main(String[] args) {
		launch(args);
	}
}
