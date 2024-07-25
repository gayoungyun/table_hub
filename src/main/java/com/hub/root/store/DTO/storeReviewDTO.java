package com.hub.root.store.DTO;

import java.util.Date;
import java.util.List;

public class storeReviewDTO {
	
	List<String> store_id, member_id, store_review_body, store_review_date_create;
	List<Integer> store_review_num, store_review_score, booking_id;
	
	
	/*
	String store_id, member_id, store_review_body;
	int store_review_num, store_review_score, booking_id;
	Date store_review_date_create;
	*/
	
	
	
	public List<String> getStore_id() {
		return store_id;
	}
	public void setStore_id(List<String> store_id) {
		this.store_id = store_id;
	}
	public List<String> getMember_id() {
		return member_id;
	}
	public void setMember_id(List<String> member_id) {
		this.member_id = member_id;
	}
	public List<String> getStore_review_body() {
		return store_review_body;
	}
	public void setStore_review_body(List<String> store_review_body) {
		this.store_review_body = store_review_body;
	}
	public List<String> getStore_review_date_create() {
		return store_review_date_create;
	}
	public void setStore_review_date_create(List<String> store_review_date_create) {
		this.store_review_date_create = store_review_date_create;
	}
	public List<Integer> getStore_review_num() {
		return store_review_num;
	}
	public void setStore_review_num(List<Integer> store_review_num) {
		this.store_review_num = store_review_num;
	}
	public List<Integer> getStore_review_score() {
		return store_review_score;
	}
	public void setStore_review_score(List<Integer> store_review_score) {
		this.store_review_score = store_review_score;
	}
	public List<Integer> getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(List<Integer> booking_id) {
		this.booking_id = booking_id;
	}
	
	
}
