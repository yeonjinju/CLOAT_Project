package com.smhrd.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Autowired
	private static NoticeMapper mapper;

	// 조회수 증가 처리
	public void increaseViews(int noticeNo) {
		mapper.updateNoticeViews(noticeNo);
	}

	/*
	 * // 공지사항 상세 데이터 반환 (비즈니스 로직이 있다면 이쪽에 구현) public NoticeVO getNoticeDetail(int
	 * noticeNo) { return mapper.getNotice(noticeNo); }
	 * 
	 * 
	 * }
	 */

	public static NoticeVO detail(String reNum) {
		// 예시: reNum이 notice_idx라고 가정하고 int로 변환
		int noticeIdx = Integer.parseInt(reNum);
		return mapper.getNotice(noticeIdx);
		}
	}