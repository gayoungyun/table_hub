package com.hub.root.pos.posDTO;

public class BookingDTO {
	
	private String store_id;
	private String member_id;
	private String booking_date_booking;
	private String booking_time;
	private String booking_person;
	private String phone;
	private String booking_status;
	
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
	public String getBooking_person() {
		return booking_person;
	}
	public void setBooking_person(String booking_person) {
		this.booking_person = booking_person;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBooking_status() {
		return booking_status;
	}
	public void setBooking_status(String booking_status) {
		this.booking_status = booking_status;
	}
}
