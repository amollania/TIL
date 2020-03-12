package lecture20;

import java.net.URL;
import java.util.Optional;
import java.util.ResourceBundle;
import java.util.function.Predicate;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ListView;

public class listViewController implements Initializable {

	@FXML TextField inputField;
	@FXML ListView<String> foodListView;
	@FXML ListView<String> resultListView;
	
	@FXML TextField searchField;
	private ObservableList<String> foodList;
	private ObservableList<String> ResultList;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		foodList = FXCollections.observableArrayList();
		FilteredList<String> filteredList = new FilteredList<String>(foodList);
		foodListView.setItems(filteredList);

		// Filter
		searchField.textProperty().addListener(new ChangeListener<String>() {
			@Override
			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				filteredList.setPredicate(new Predicate<String>() {
					@Override
					public boolean test(String t) {
						return t.contains(searchField.getText());
					}
				});
				
			}
		});
		
	}
	
	@FXML public void uploadAction() {
		if ((inputField.getText()).equals("") || (inputField.getText()).equals(null)) {
			new Alert(AlertType.WARNING, "Please input typing", ButtonType.CLOSE).show();
		} else {
			foodList.add(inputField.getText());
		}
		inputField.setText("");
		inputField.requestFocus();
	}
	
	@FXML public void deleteAction() {
		int selectedIndex = foodListView.getSelectionModel().getSelectedIndex();
		if (selectedIndex < 0 ) {
			Alert alert = new Alert(AlertType.WARNING, "삭제할 항목을 선택하세요.", ButtonType.OK, ButtonType.CLOSE);
			Optional<ButtonType> wait = alert.showAndWait();
			if (wait.get() == ButtonType.OK) {
				new Alert(AlertType.CONFIRMATION, "OK", ButtonType.OK).show();
			}
			return;
		}
		foodList.remove(selectedIndex);
	}



}
