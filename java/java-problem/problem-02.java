



public class Time {
	private int hour = 0;
	private int minute = 0;
	private int second = 0;

	public void getter(int hour, int minute, int second) {
		this.hour = hour;
		this.minute = minute;
		this.second = second;
	}
	
	public void setter() {
		if (hour>23) { hour=0;}
		if (minute>59) { minute=0;}
		if (second>59) { minute=0;}
	}
	
	public String toString() {
		return String.format("%2d:%02d:%02d", hour, minute, second);
	}
	
	public Time(int hour, int minute, int second){
		getter(hour, minute, second);
		setter();
		toString();
	}
}
