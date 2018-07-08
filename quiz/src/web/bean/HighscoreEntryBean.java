package web.bean;

import java.io.Serializable;
import java.sql.Time;

public class HighscoreEntryBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	
	private String username;
	private int score, rank;
	private Time playTime;
	
	public HighscoreEntryBean(String username, int score, int rank, Time playTime) {
		this.rank = rank;
		this.score = score;
		this.username = username;
		this.playTime = playTime;
	}
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}

	public Time getPlayTime() {
		return playTime;
	}

	public void setPlayTime(Time playTime) {
		this.playTime = playTime;
	}
	
}