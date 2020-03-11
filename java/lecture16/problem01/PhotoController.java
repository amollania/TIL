package lecture14.problem;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.control.Button;

//import javafx.collections.FXCollections;
//import javafx.collections.ObservableList;
//import java.util.Observable;

public class PhotoController implements Initializable {

	@FXML ImageView photoView;
	private List<Image> list;
	private int count;
	@FXML Button leftButton;
	@FXML Button rightButton;
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		// TODO Auto-generated method stub
		// Arrary, list
		// #1. Arrary
		
//		Image[] images = new Image[] {
//				new Image(""),
//				new Image(""),
//				new Image(""),
//				new Image("")
//	};
		
		list = new ArrayList<Image>();
		list.add(new Image(getClass().getResource("dog1.jpeg").toExternalForm()));
		list.add(new Image(getClass().getResource("dog2.jpeg").toExternalForm()));
		list.add(new Image(getClass().getResource("dog3.jpeg").toExternalForm()));
		list.add(new Image(getClass().getResource("dog4.jpeg").toExternalForm()));
		
		photoView.setImage(list.get(this.count));

		//left button disable
		leftButton.disabledProperty().addListener(new ChangeListener<Boolean>() {

			@Override
			public void changed(ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) {
				// TODO Auto-generated method stub
				
			}
		});;
		
		
//		// #3. JavaFX list
//		ObservableList<Object> observableArrayList = FXCollections.observableArrayList();{
//			observableArrayList.add(new Image(""));
//			observableArrayList.add(new Image(""));
//			observableArrayList.add(new Image(""));
//			observableArrayList.add(new Image(""));
//	};
	
	}
	
	@FXML public void backAction() {

		if (count == 0) {
			
		}
		
//		3 2 1 0 3 2 1 0	
//		photoView.setImage(list.get((int)Math.sqrt(Math.pow((--this.count%list.size()), 2))));
//		
//		System.out.println(count);
//		System.out.println("changed");
	}
	
	@FXML public void changeAction() {
		photoView.setImage(list.get((int)Math.sqrt(Math.pow((++this.count%list.size()), 2))));

		System.out.println(count);
		System.out.println("changed");
	}

	
	

}
