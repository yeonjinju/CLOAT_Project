package com.smhrd.notice;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface NoticeMapper {

    List<NoticeVO> NoticeList();

    NoticeVO getNotice(int notice_idx);

    int getTotalCount();
    
    int getTotalCountBySearch(@Param("searchValue") String searchValue,
            @Param("searchContent") String searchContent);

    List<NoticeVO> getNoticesByPage(@Param("startRow") int startRow, @Param("endRow") int endRow);

    void updateNoticeViews(@Param("noticeIdx") int noticeIdx);
    
    
    
    

	public int write(NoticeVO vo);

	public List<NoticeVO> NoticeSearch(@Param("searchValue") String searchValue, @Param("searchContent") String searchContent,
			@Param("startRow") int startRow, @Param("endRow") int endRow);
	
	public int updateNoticeEdit(NoticeVO vo);   // 씀
	NoticeVO selectNoticeByNo(int news_idx);  // 씀
	int deleteNoticeByNo(int news_idx);
	
}