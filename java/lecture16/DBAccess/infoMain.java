package lecture26;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class infoMain extends Application {
	@Override
	public void start(Stage primaryStage) throws Exception {
		Parent root = FXMLLoader.load(getClass().getResource("info.fxml"));
		primaryStage.setScene(new Scene(root));
		primaryStage.setTitle("Main Page");
		primaryStage.show();
	}

	public static void main(String[] args) {
		launch(args);
	}
}
