package com.smhrd.review;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {   

   private int review_idx;
   private String review_title;
   private String review_content;
   private String review_file;
   private Date created_at;
   private Date updated_at;
   private int review_views;
   private String id;
   
   
    private int cmt_idx;
    private String cmt_content;
    private int cmt_heart;
    private String admin_id;
    

}