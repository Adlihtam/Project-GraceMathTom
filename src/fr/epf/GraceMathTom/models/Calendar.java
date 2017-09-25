package fr.epf.GraceMathTom.models;

import java.util.Date;

public class Calendar {
	private String intitule;
	private String start;
	private String end;
	private String membre;
	
	
	public Calendar(String intitule, String start, String end, String membre) {
		super();
		this.intitule = intitule;
		this.start = start;
		this.end = end;
		this.membre = membre;
	}
	public String getIntitule() {
		return intitule;
	}
	public void setIntitule(String intitule) {
		this.intitule = intitule;
	}
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getMembre() {
		return membre;
	}
	public void setMembre(String membre) {
		this.membre = membre;
	}
	
	
}
