package lecture26;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class InfoModel {
	private IntegerProperty infoNo;
	private StringProperty pcNo;
	private StringProperty nm;
	private StringProperty email;
	private StringProperty hobby;
	private StringProperty checkYn;

	public InfoModel(int infoNo, String pcNo, String nm, String email, String hobby, String checkYn) {
		this.infoNo = new SimpleIntegerProperty(infoNo);
		this.pcNo = new SimpleStringProperty(pcNo);
		this.nm = new SimpleStringProperty(nm);
		this.email = new SimpleStringProperty(email);
		this.hobby = new SimpleStringProperty(hobby);
		this.checkYn = new SimpleStringProperty(checkYn);
	}

	public int getInfoNo() {
		return infoNo.get();
	}

	public IntegerProperty infoNoProperty() {
		return infoNo;
	}

	public void setInfoNo(int infoNo) {
		this.infoNo.set(infoNo);
	}

	public String getPcNo() {
		return pcNo.get();
	}

	public StringProperty pcNoProperty() {
		return pcNo;
	}

	public void setPcNo(String pcNo) {
		this.pcNo.set(pcNo);
	}

	public String getNm() {
		return nm.get();
	}

	public StringProperty nmProperty() {
		return nm;
	}

	public void setNm(String nm) {
		this.nm.set(nm);
	}

	public String getEmail() {
		return email.get();
	}

	public StringProperty emailProperty() {
		return email;
	}

	public void setEmail(String email) {
		this.email.set(email);
	}

	public String getHobby() {
		return hobby.get();
	}

	public StringProperty hobbyProperty() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby.set(hobby);
	}

	public String getCheckYn() {
		return checkYn.get();
	}

	public StringProperty checkYnProperty() {
		return checkYn;
	}

	public void setCheckYn(String checkYn) {
		this.checkYn.set(checkYn);
	}

	@Override
	public String toString() {
		return "InfoModel{" +
				"infoNo=" + infoNo.get() +
				", pcNo=" + pcNo.get() +
				", nm=" + nm.get() +
				", email=" + email.get() +
				", hobby=" + hobby.get() +
				", checkYn=" + checkYn.get() +
				'}';
	}
}