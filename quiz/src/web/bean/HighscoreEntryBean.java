package web.bean;

import java.io.Serializable;

public class HighscoreEntryBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String username;
	private int score, rank;
	
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
}