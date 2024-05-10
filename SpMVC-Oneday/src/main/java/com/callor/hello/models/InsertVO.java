package com.callor.hello.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class InsertVO {
	private String	i_id;	
	private String	i_date;	
	private String	i_time;	
	private String	i_title;	
	private String	i_email;	
	private String	i_pass;	
	private String	i_org_image;	
	private String	i_up_image;	
}
