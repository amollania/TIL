package lecture21.table;

import java.net.URL;
import java.util.ResourceBundle;

import javax.naming.NameClassPair;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableCell;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.scene.control.TableColumn.CellEditEvent;
import javafx.util.Callback;
import javafx.util.StringConverter;

public class ScoreManagementController implements Initializable {

	@FXML TableView<ScoreVO> scoreTableView;
	
	@FXML TableColumn<ScoreVO, String> nameColumn;
	@FXML TableColumn<ScoreVO, Double> testColumn;
	@FXML TableColumn<ScoreVO, Double> test2Column;
	@FXML TableColumn<ScoreVO, Double> test3Column;
	@FXML TableColumn<ScoreVO, Double> otherColumn;
	@FXML TableColumn<ScoreVO, Double> sumColumn;

	@FXML TextField nameField;
	@FXML TextField testField;
	@FXML TextField test2Field;
	@FXML TextField test3Field;
	@FXML TextField otherField;
	
	private ObservableList<ScoreVO> scoreList;
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		// TODO Auto-generated method stub
		scoreList = FXCollections.observableArrayList();
		scoreTableView.setItems(scoreList);
		// 각 컬럼에 어떤 데이터를 바인딩(binding)할지 설정해야 한다.		
		
		
		nameColumn.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<ScoreVO,String>, ObservableValue<String>>() {
			@Override
			public ObservableValue<String> call(CellDataFeatures<ScoreVO, String> param) {
				// TODO Auto-generated method stub
				return param.getValue().nameProperty();
			}
		});
		
		testColumn.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<ScoreVO,Double>, ObservableValue<Double>>() {
			@Override
			public ObservableValue<Double> call(CellDataFeatures<ScoreVO, Double> param) {
				return param.getValue().testProperty().asObject();
			}
		});
		
		test2Column.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<ScoreVO,Double>, ObservableValue<Double>>() {
			@Override
			public ObservableValue<Double> call(CellDataFeatures<ScoreVO, Double> param) {
				// TODO Auto-generated method stub
				return param.getValue().test2Property().asObject();
			}
		});
		
		test3Column.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<ScoreVO,Double>, ObservableValue<Double>>() {
			@Override
			public ObservableValue<Double> call(CellDataFeatures<ScoreVO, Double> param) {
				// TODO Auto-generated method stub
				return param.getValue().test3Property().asObject();
			}
		});
		
		otherColumn.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<ScoreVO,Double>, ObservableValue<Double>>() {
			@Override
			public ObservableValue<Double> call(CellDataFeatures<ScoreVO, Double> param) {
				// TODO Auto-generated method stub
				return param.getValue().otherProperty().asObject();
			}
		});
		
		sumColumn.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<ScoreVO,Double>, ObservableValue<Double>>() {
			@Override
			public ObservableValue<Double> call(CellDataFeatures<ScoreVO, Double> param) {
				// TODO Auto-generated method stub
				return param.getValue().sumProperty().asObject();
			}
		});
		
		scoreTableView.setEditable(true);
		
		// 더블클릭했을 때
		nameColumn.setCellFactory(TextFieldTableCell.forTableColumn());
		StringConverter<Double> converter = new StringConverter<Double>() {
			@Override
			public String toString(Double object) {
				// TODO Auto-generated method stub
				return String.valueOf(object);
			}
			@Override
			public Double fromString(String string) {
				// TODO Auto-generated method stub
				return Double.valueOf(string);
			}
		};
		testColumn.setCellFactory(TextFieldTableCell.forTableColumn(converter));
		test2Column.setCellFactory(TextFieldTableCell.forTableColumn(converter));
		test3Column.setCellFactory(TextFieldTableCell.forTableColumn(converter));
		otherColumn.setCellFactory(TextFieldTableCell.forTableColumn(converter));

		
		testColumn.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent<ScoreVO,Double>>() {
			@Override
			public void handle(CellEditEvent<ScoreVO, Double> event) {
				// TODO Auto-generated method stub
				event.getRowValue().settest(event.getNewValue());
				scoreTableView.refresh();
			}
			
		});;
		
	}
	
	@FXML public void registerAction() {
		String name = nameField.getText();
		double test = Double.valueOf(testField.getText());
		double test2 = Double.valueOf(test2Field.getText());
		double test3 = Double.valueOf(test3Field.getText());
		double other = Double.valueOf(otherField.getText());
		scoreList.add(new ScoreVO(name, test, test2, test3, other));
	}


}
