package com.smhrd.upload;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UploadVO {

	private int upload_idx;
	private String id;
	private String upload_file;
	private String transformed_file;
	private Date created_at; 
	
}
