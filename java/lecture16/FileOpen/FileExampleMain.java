package lecture22;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class FileExampleMain extends Application {

		// TODO Auto-generated method stub
		@Override
		public void start(Stage primaryStage) throws Exception {
			Parent root = FXMLLoader.load(getClass().getResource("FileExample.fxml"));
			primaryStage.setScene(new Scene(root));
			primaryStage.setTitle("Title");
			primaryStage.show();
		}
		
		public static void main(String[] args) {
			launch(args);
		}
}
