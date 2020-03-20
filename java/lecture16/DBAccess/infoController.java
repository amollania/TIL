package lecture26;

import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;
import java.util.function.Predicate;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ContextMenu;
import javafx.scene.control.MenuItem;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.util.Callback;

public class infoController implements Initializable{
	@FXML TableView<InfoModel> infoTableView;
	@FXML TableColumn<InfoModel, Integer> infoNoColumn;
	@FXML TableColumn<InfoModel, String> pcNoColumn;
	@FXML TableColumn<InfoModel, String> nameColumn;
	@FXML TableColumn<InfoModel, String> emailColumn;
	@FXML TableColumn<InfoModel, String> hobbylColumn;	
	@FXML TableColumn<InfoModel, String> activelColumn;

	@FXML TextField searchField;
	
	private InfoDAO infoDAO = new InfoDAO();
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
			InfoDAO dao = new InfoDAO();
			List<InfoModel> infoList = dao.selectInfo();
			ObservableList<InfoModel> list = FXCollections.observableArrayList(infoList);
			infoTableView.setItems(list);
			// 각 컬럼별로 데이터 바인딩하기
			
			// integer 컬럼 가져오기
			infoNoColumn.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<InfoModel, Integer>, ObservableValue<Integer>>() {
				@Override
				public ObservableValue<Integer> call(CellDataFeatures<InfoModel, Integer> param) {
					return param.getValue().infoNoProperty().asObject();
				}
			});
			
			// String 컬럼 가져오기
			pcNoColumn.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<InfoModel,String>, ObservableValue<String>>() {
				@Override
				public ObservableValue<String> call(CellDataFeatures<InfoModel, String> param) {
					return param.getValue().pcNoProperty();
				}
			});
			
			// String 컬럼 가져오기
			nameColumn.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<InfoModel,String>, ObservableValue<String>>() {
				@Override
				public ObservableValue<String> call(CellDataFeatures<InfoModel, String> param) {
					return param.getValue().nmProperty();
				}
			});
			
			// String 컬럼 가져오기
			emailColumn.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<InfoModel,String>, ObservableValue<String>>() {
				@Override
				public ObservableValue<String> call(CellDataFeatures<InfoModel, String> param) {
					return param.getValue().emailProperty();
				}
			});
			
			// String 컬럼 가져오기
			hobbylColumn.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<InfoModel,String>, ObservableValue<String>>() {
				@Override
				public ObservableValue<String> call(CellDataFeatures<InfoModel, String> param) {
					return param.getValue().hobbyProperty();
				}
			});
			
			// String 컬럼 가져오기
			activelColumn.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<InfoModel,String>, ObservableValue<String>>() {
				@Override
				public ObservableValue<String> call(CellDataFeatures<InfoModel, String> param) {
					return param.getValue().checkYnProperty();
				}
			});

			
			// 필터 기능
			FilteredList<InfoModel> filteredList = new FilteredList<InfoModel>(list);
			infoTableView.setItems(filteredList);
			
			searchField.textProperty().addListener(new ChangeListener<String>() {
				@Override
				public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
					filteredList.setPredicate(new Predicate<InfoModel>() {
						@Override
						public boolean test(InfoModel t) {
							return t.getNm().contains(observable.getValue()) || t.getEmail().contains(observable.getValue());
						}
					});
				}
			});
			
			
			// 편집 기능
			infoTableView.setEditable(true);
			nameColumn.setCellFactory(TextFieldTableCell.forTableColumn());
			emailColumn.setCellFactory(TextFieldTableCell.forTableColumn());
			hobbylColumn.setCellFactory(TextFieldTableCell.forTableColumn());
			activelColumn.setCellFactory(TextFieldTableCell.forTableColumn());
			// 편집 완료 시
//			nameColumn.setOnEditCommit(new EventHandler<TableColumn.CellEditEvent<InfoModel,String>>() {
//				@Override
//				public void handle(CellEditEvent<InfoModel, String> event) {
//					InfoDAO infoDAO = new InfoDAO();				
//					infoDAO.updateInfo(event.getRowValue());
//				}
//			});
			
			emailColumn.setOnEditCommit(event -> {
				event.getRowValue().setEmail(event.getNewValue());
				int updateInfo = dao.updateInfo(event.getRowValue());
				if (updateInfo != 0) {
					List<InfoModel> info = dao.selectInfo();
					list.setAll(info);
				}
			});
			
			hobbylColumn.setOnEditCommit(event -> {
				event.getRowValue().setHobby(event.getNewValue());			
				int updateInfo = dao.updateInfo(event.getRowValue());
				if (updateInfo != 0) {
					List<InfoModel> info = dao.selectInfo();
					list.setAll(info);					
				}			
			});
			
			
//			activelColumn.setOnEditCommit(event -> {
//				InfoDAO infoDAO = new InfoDAO();				
//				infoDAO.updateInfo(event.getRowValue());
//			}); 
			
			
			//Context Menu 추가하기
			MenuItem refreshMenu = new MenuItem("새로고침");
			refreshMenu.setOnAction(new EventHandler<ActionEvent>() {
				@Override
				public void handle(ActionEvent event) {
					List<InfoModel> info = dao.selectInfo();
					list.setAll(info);
				}
			});
			infoTableView.setContextMenu(new ContextMenu(refreshMenu));
			
	} 
}
