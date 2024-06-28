package com.hub.root.pos.posDTO;

public class keyDTO {
	String store_id;
	String store_key;
	int key_status;
	
	public int getKey_status() {
		return key_status;
	}
	public void setKey_status(int key_status) {
		this.key_status = key_status;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public String getStore_key() {
		return store_key;
	}
	public void setStore_key(String store_key) {
		this.store_key = store_key;
	}
}
