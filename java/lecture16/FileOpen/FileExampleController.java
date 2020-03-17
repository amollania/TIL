package lecture22;

import java.io.File;
import java.io.FileReader;

import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.stage.FileChooser;

public class FileExampleController {

	@FXML Label fileNameLable;
	@FXML TextArea contentArea;

	@FXML public void openAction() throws Exception {
		FileChooser chooser = new FileChooser();
		File file = chooser.showOpenDialog(null);
		fileNameLable.setText("파일명 : " + file.getName());
		FileReader reader = new FileReader(file);
		char[] c = new char[1];
		StringBuffer buffer = new StringBuffer();
		while (reader.read(c) != -1) {
			buffer.append(c);
		}
		contentArea.setText(buffer.toString());
		reader.close();
	}
	
}
