package web.bean;

import java.io.Serializable;
import java.sql.Time;
import java.sql.Timestamp;

public class HighscoreEntryBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	
	private String username;
	private int score, rank;
	private String diff;
	
	public HighscoreEntryBean(String username, int score, int rank, String diff) {
		this.rank = rank;
		this.score = score;
		this.username = username;
		this.diff = diff;
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

	public String getPlayTime() {
		return diff;
	}

	public void setPlayTime(String diff) {
		this.diff = diff;
	}
	
}