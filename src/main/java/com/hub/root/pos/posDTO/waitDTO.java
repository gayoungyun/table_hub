package com.hub.root.pos.posDTO;

public class waitDTO {
	
	private int wait_num;
	private String store_id;
	private int person_num;
	private String wait_date;
	private int wait_status;
	private int wait_time;
	private String wait_name;	
	
	public int getWait_status() {
		return wait_status;
	}
	public void setWait_status(int wait_status) {
		this.wait_status = wait_status;
	}
	public int getWait_num() {
		return wait_num;
	}
	public void setWait_num(int wait_num) {
		this.wait_num = wait_num;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public int getPerson_num() {
		return person_num;
	}
	public void setPerson_num(int person_num) {
		this.person_num = person_num;
	}
	public String getWait_date() {
		return wait_date;
	}
	public void setWait_date(String wait_date) {
		this.wait_date = wait_date;
	}
	public int getWait_time() {
		return wait_time;
	}
	public void setWait_time(int wait_time) {
		this.wait_time = wait_time;
	}
	public String getWait_name() {
		return wait_name;
	}
	public void setWait_name(String wait_name) {
		this.wait_name = wait_name;
	}
	
}
