package com.sist.vo;

public class ReserveVO {
	private String reserve_date;
	private String reserve_time;
	private String symptom;
	private String state;
	private int dogno;
	private int hosno;
	
	public String getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getReserve_time() {
		return reserve_time;
	}
	public void setReserve_time(String reserve_time) {
		this.reserve_time = reserve_time;
	}
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getDogno() {
		return dogno;
	}
	public void setDogno(int dogno) {
		this.dogno = dogno;
	}
	public int getHosno() {
		return hosno;
	}
	public void setHosno(int hosno) {
		this.hosno = hosno;
	}
}
