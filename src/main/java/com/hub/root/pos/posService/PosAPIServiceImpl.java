package com.hub.root.pos.posService;

import java.security.SecureRandom;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.root.pos.mybatis.PosMapper;
import com.hub.root.pos.posDTO.BookingDTO;
import com.hub.root.pos.posDTO.KeyDTO;
import com.hub.root.pos.posDTO.UpdateStatusDTO;
import com.hub.root.pos.posDTO.WaitDTO;

@Service
public class PosAPIServiceImpl implements PosAPIService{

	@Autowired
	PosMapper mapper;

	@Override
	public List<BookingDTO> todayReservation(String store_id) {

		List<BookingDTO> today = mapper.todayReservation(store_id);

		if(today != null)
		{
			for (BookingDTO element : today) {
				String str[] = element.getBooking_date_booking().split(" ");
				element.setBooking_date_booking(str[0]);

				int count = totalRegisterCount(store_id, element.getMember_id());
				element.setReview_count(count);
			}

			return today;
		}
		else {
			return null;
		}
	}

	@Override
	public int bookingStatus(UpdateStatusDTO updateStatus) {

		int result = mapper.bookingStatus(updateStatus.getBooking_id(), updateStatus.getBooking_status() );

		return result;
	}

	private int totalRegisterCount(String store_id, String member_id)
	{
		int result = 0;
		result = mapper.totalRegisterCount(store_id, member_id);

		return result;
	}

	@Override
	public BookingDTO updateSseDTO(BookingDTO bookingDTO) {

		BookingDTO dto = new BookingDTO();
		dto.setReview_count(mapper.totalRegisterCount(bookingDTO.getStore_id(), bookingDTO.getMember_id()));

		return dto;
	}


	@Override
	public KeyDTO key(KeyDTO key) {
		String makeKey = makekey(10, false);
		int result = 0;

		if(makeKey != null)
		{
			key.setStore_key(makeKey);
			key.setKey_status(0);

			result = mapper.key(key);
		}
		if(result == 1 )
			return key;
		else
			return null;
	}

	@Override
	public List<KeyDTO> getAllKey(String userId) {
		List<KeyDTO> result = mapper.getAllKey(userId);

		return result;
	}

	private String makekey(int length, boolean isUpperCase) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }
        return isUpperCase ? sb.toString() : sb.toString().toLowerCase();
	}

	@Override
	public int delete_key(KeyDTO key) {
		int result = mapper.delete_key(key);

		return result;
	}

	@Override
	public String findStoreId(String key) {
		String result = mapper.findStoreId(key);

		return result;
	}

	@Override
	public int registerWait(String name, String person_num, String store_id) {
		int wait_num = wait_num() + 1;
		mapper.registerWait(wait_num, name, person_num, store_id);
		return wait_num;
	}

	private int wait_num() {
		int result = mapper.wait_num();

		return result;
	}

	@Override
	public List<WaitDTO> todayWait(String store_id) {
		List<WaitDTO> dto = mapper.todayWait(store_id);


		return dto;
	}

	@Override
	public void wait123(String store_id, int wait_time, int wait_num) {

		mapper.wait123(store_id, wait_time, wait_num);
		System.out.println("store_id : " + store_id);
		System.out.println("wait_time : " + wait_time);
		System.out.println("wait_num : " + wait_num);


	}

	@Override
	public String averageTime(String store_id) {
		String[] result = mapper.averageTime(store_id);

		long average = 0;

		for (String element : result)
			average += Integer.parseInt(element);

		average = average / result.length;
		return Long.toString(average);
	}

	@Override
	public String nowWaitNum(String store_id) {
		String result = mapper.nowWaitNum(store_id);

		if(result == null)
			return "null";
		return result;
	}

}
