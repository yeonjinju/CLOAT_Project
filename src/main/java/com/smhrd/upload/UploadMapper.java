package com.smhrd.upload;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UploadMapper {
	
	public int insert(UploadVO vo);
	
}