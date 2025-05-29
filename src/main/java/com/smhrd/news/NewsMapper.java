package com.smhrd.news;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface NewsMapper {

	public List<NewsVO> NewsList();

    NewsVO getNews(int news_idx);

    int getTotalCount();
    
    int getTotalCountBySearch(@Param("searchValue") String searchValue,
            @Param("searchContent") String searchContent);
    

    List<NewsVO> getNewssByPage(@Param("startRow") int startRow, @Param("endRow") int endRow);

    void updateNewsViews(@Param("newsIdx") int newsIdx);
    
    
    
    

    

	public int write(NewsVO vo);

	public List<NewsVO> NewsSearch(@Param("searchValue") String searchValue, @Param("searchContent") String searchContent,
									@Param("startRow") int startRow, @Param("endRow") int endRow);
	
	public int updateNewsEdit(NewsVO vo);   // 씀
	NewsVO selectNewsByNo(int news_idx);  // 씀
	int deleteNewsByNo(int news_idx);
}