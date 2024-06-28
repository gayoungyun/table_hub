package com.hub.root.pos.posDTO;

public class BookingDTO {
	private int  booking_id;
	private String store_id;
	private String member_id;
	private String booking_date_booking;
	private String booking_time;
	private int booking_person;
	private String booking_phone;
	private int booking_status;
	
	private int review_count;
	
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public int getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	
	@Override
	public String toString() {
		return super.toString();
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBooking_date_booking() {
		return booking_date_booking;
	}
	public void setBooking_date_booking(String booking_date_booking) {
		this.booking_date_booking = booking_date_booking;
	}
	public String getBooking_time() {
		return booking_time;
	}
	public void setBooking_time(String booking_time) {
		this.booking_time = booking_time;
	}
	public int getBooking_person() {
		return booking_person;
	}
	public void setBooking_person(int booking_person) {
		this.booking_person = booking_person;
	}
	public String getBooking_phone() {
		return booking_phone;
	}
	public void setBooking_phone(String booking_phone) {
		this.booking_phone = booking_phone;
	}
	public int getBooking_status() {
		return booking_status;
	}
	public void setBooking_status(int booking_status) {
		this.booking_status = booking_status;
	}
}
