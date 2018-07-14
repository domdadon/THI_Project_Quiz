package web.bean;

import java.io.Serializable;

public class QuestionBean implements Serializable {
	private static final long serialVersionUID = 1L;
		
	private String q, a_1, a_2, a_3, a_4;
	private Integer qID, a_ID1, a_ID2, a_ID3, a_ID4;
	private Integer currentScore, q_Number;
	
	public String getQ() {
		return q;
	}
	public void setQ(String q) {
		this.q = q;
	}
	public String getA_1() {
		return a_1;
	}
	public void setA_1(String a_1) {
		this.a_1 = a_1;
	}
	public String getA_2() {
		return a_2;
	}
	public void setA_2(String a_2) {
		this.a_2 = a_2;
	}
	public String getA_3() {
		return a_3;
	}
	public void setA_3(String a_3) {
		this.a_3 = a_3;
	}
	public String getA_4() {
		return a_4;
	}
	public void setA_4(String a_4) {
		this.a_4 = a_4;
	}
	public Integer getqID() {
		return qID;
	}
	public void setqID(Integer qID) {
		this.qID = qID;
	}
	public Integer getA_ID1() {
		return a_ID1;
	}
	public void setA_ID1(Integer a_ID1) {
		this.a_ID1 = a_ID1;
	}
	public Integer getA_ID2() {
		return a_ID2;
	}
	public void setA_ID2(Integer a_ID2) {
		this.a_ID2 = a_ID2;
	}
	public Integer getA_ID3() {
		return a_ID3;
	}
	public void setA_ID3(Integer a_ID3) {
		this.a_ID3 = a_ID3;
	}
	public Integer getA_ID4() {
		return a_ID4;
	}
	public void setA_ID4(Integer a_ID4) {
		this.a_ID4 = a_ID4;
	}
	public Integer getActualScore() {
		return currentScore;
	}
	public void setActualScore(Integer currentScore) {
		this.currentScore = currentScore;
	}
	public Integer getQ_Number() {
		return q_Number;
	}
	public void setQ_Number(Integer q_Number) {
		this.q_Number = q_Number;
	}
	public Integer getCurrentScore() {
		return currentScore;
	}
	public void setCurrentScore(Integer currentScore) {
		this.currentScore = currentScore;
	}
}