public class Time {
	private int hour;
	private int minute;
	private int second;

	public Time(int hour, int minute, int second) {
		this.hour = hour;
		this.minute = minute;
		this.second = second;
	}

	public int getHour(){
		return hour;	
	}

	public void setHour(int hour) {
		if (hour < 0 || 23 < hour) return;
		this.hour = hour;
	}

	public int getMinute(){
		return minute;
	}

	public void setMiute(int minute){
		if (minute < 0 || minute > 59 ) return;
		this.minute = minute;
	}

	public int getSecond(){
		return second;
	}

	public int setSecond(int second){
		if (second < 0 || second > 59) return;
		this.second = second;
	}

	public String toString(){
		return String.format("%02d:%02d:%02d", hour, minute, second);
	}
}