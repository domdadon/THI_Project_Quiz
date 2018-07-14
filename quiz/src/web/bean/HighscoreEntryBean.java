package web.bean;

import java.io.Serializable;


public class HighscoreEntryBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String username;
	private int score, rank;
	private int id;
	private Long diff;
	
	public HighscoreEntryBean(String username, int score, int rank, long diff, int id) {
		this.rank = rank;
		this.score = score;
		this.username = username;
		this.diff = diff;
		this.id = id;
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

	public Long getPlayTime() {
		return diff;
	}

	public void setPlayTime(Long diff) {
		this.diff = diff;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Long getDiff() {
		return diff;
	}


	public void setDiff(Long diff) {
		this.diff = diff;
	}
	
	
}