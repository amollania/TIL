package lecture20;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class ToEatListMain extends Application {
	@Override
	public void start(Stage primaryStage) throws Exception {
		Parent root = FXMLLoader.load(getClass().getResource("ToEatList.fxml"));
		primaryStage.setScene(new Scene(root));
		primaryStage.setTitle("Food List");
		primaryStage.show();
	}

	public static void main(String[] args) {
		launch(args);
	}
}
