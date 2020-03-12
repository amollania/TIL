package lecture14.problem;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.control.Button;

public class PhotoController implements Initializable {

	@FXML ImageView photoView;
	@FXML Button leftButton;
	@FXML Button rightButton;
	private List<Image> list;
	private IntegerProperty count = new SimpleIntegerProperty();
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		// TODO Auto-generated method stub
		list = new ArrayList<Image>();
		list.add(new Image(getClass().getResource("dog1.jpeg").toExternalForm()));
		list.add(new Image(getClass().getResource("dog2.jpeg").toExternalForm()));
		list.add(new Image(getClass().getResource("dog3.jpeg").toExternalForm()));
		list.add(new Image(getClass().getResource("dog4.jpeg").toExternalForm()));
		photoView.setImage(list.get(getCount()));

		//Count Observer
		count.addListener(new ChangeListener<Number>(){
			@Override
			public void changed(ObservableValue<? extends Number> observable, Number oldValue, Number newValue) {
				leftButton.setDisable(observable.getValue().intValue()==0);
				rightButton.setDisable(observable.getValue().intValue()==list.size()-1);
			}
		});
	}
	
	@FXML public void backAction() {
		setCount(getCount() - 1);
		photoView.setImage(list.get(getCount() % list.size()));
	}
	
	@FXML public void changeAction() {
		setCount(getCount() + 1);
		photoView.setImage(list.get(getCount() % list.size()));
		//photoView.setImage(list.get((int)Math.sqrt(Math.pow((++this.count%list.size()), 2))));
	}

	public int getCount() {
		return count.get();
	}
	
	public void setCount(int count) {
		this.count.set(count);
	}
	
	public IntegerProperty countProperty() {
		return count;
	}

}
